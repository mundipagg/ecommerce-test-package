<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Mink\Exception\ResponseTextException;
use Behat\MinkExtension\Context\MinkContext;
use Dotenv\Dotenv;
use Dotenv\Environment\Adapter\EnvConstAdapter;
use Dotenv\Environment\Adapter\PutenvAdapter;
use Dotenv\Environment\DotenvFactory;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     *
     * @var Behat\Gherkin\Node\StepNode
     */
    private $dotenv;
    protected $baseUrl;
    private $currentStep = null;
    private $scenarioTokens = null;
    private static $featureHash = null;
    private $screenshotDir = DIRECTORY_SEPARATOR . 'tmp';

    public function __construct()
    {

        $factory = new DotenvFactory([
            new EnvConstAdapter(),
            new PutenvAdapter(),
        ]);

        $this->dotenv = Dotenv::create(
            __DIR__ . '/../../',
            null,
            $factory
        );
        $this->dotenv->load();
        $this->baseUrl = $_ENV['BASE_URL'];
    }

    /** @BeforeScenario */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        foreach ($environment->getContexts() as $context) {
            if ($context instanceof \Behat\MinkExtension\Context\RawMinkContext) {
                $context->setMinkParameter('base_url', $this->baseUrl);
            }
        }
    }

    /**
     *
     * @AfterStep
     * @param     $event
     */
    public function afterStepFailureScreenshot($event)
    {
        $e = $event->getTestResult()->getCallResult()->getException();
        if ($e) {
            if (!file_exists($this->screenshotDir)) {
                mkdir($this->screenshotDir);
            }
            $filename = tempnam($this->screenshotDir, "failure_screenshoot_");
            unlink($filename);
            $filename .= ".png";
            $this->screenshot($filename);
            echo "saved failure screenshot to '$filename'";
        }
    }

    /**
     *
     * @BeforeFeature
     */
    public static function beforeFeature($event)
    {
        self::$featureHash = null;
        $requestTime = $_SERVER['REQUEST_TIME'];
        $featureTitle = $event->getFeature()->getTitle();
        $hash = hash('sha512', $featureTitle . $requestTime);
        self::$featureHash = substr($hash, 0, 16);
    }

    /**
     *
     * @BeforeScenario
     */
    public function beforeScenario($event)
    {
        if ($event->getScenario()->hasTag('smartStep')) {
            die();
        }

        $this->scenarioTokens = null;
        try {
            //trying to save examples to use in @smartStep
            $this->scenarioTokens =
                $event->getScenario()->getTokens();
        }catch(Throwable $e) {
        }
    }

    /**
     *
     * @BeforeStep
     */
    public function beforeStep($event)
    {
        $this->currentStep  = $event->getStep();
    }

    /**
     * Show an animation when waiting for a step
     *
     * @param int   $remaning Amount in seconds remaing on wait.
     * @param float $interval in seconds to update animation frame.
     */
    private function spinAnimation($remaining = null, $interval = 0.1)
    {
        static $frameId = null;
        $currentTime = microtime(true);
        static $lastUpdate = null;

        if($frameId === null) {
            $frameId = 0;
        }

        if($lastUpdate === null) {
            $lastUpdate = $currentTime;
        }

        if($currentTime - $lastUpdate < $interval) {
            return;
        }
        $lastUpdate = $currentTime;

        switch($frameId) {
            default: $frameId = 0;
            case 0: $frame = '|';
                break;
            case 1: $frame = '\\';
                break;
            case 2: $frame = '--';
                break;
            case 3: $frame = '/';
                break;

        }
        $frameId++;

        if($this->currentStep !== null) {

            print "'" . $this->currentStep->getText() . "' - ";
        }
        if($remaining !== null) {
            print "$remaining seconds remaining...  ";
        }
        print "$frame             \r";
        flush();
    }


    /**
     * Based on example from http://docs.behat.org/en/v2.5/cookbook/using_spin_functions.html
     *
     * @param  callable $lambda The callback that will be called in spin
     * @param  int      $wait   Amount in seconds to spin timeout
     * @return bool
     * @throws Exception
     */
    private function spin(callable $lambda, $wait = 60)
    {
        $startTime = time();
        do{
            try {
                if($lambda($this)) {
                    return true;
                }
            }catch(Exception $e) {
                //do nothing;
            }
            usleep(100000);
            $this->spinAnimation($wait - (time() - $startTime));
        }while(time() < $startTime + $wait);

        throw new Exception(
            "Timeout: $wait seconds."
        );
    }

    /**
     *
     * @When /^(?:|I )click in element "(?P<element>(?:[^"]|\\")*)"$/
     */
    public function clickInElement($element)
    {
        $element = $this->replacePlaceholdersByTokens($element);
        $session = $this->getSession();
        $locator = $this->fixStepArgument($element);
        $xpath = $session->getSelectorsHandler()->selectorToXpath('css', $locator);
        $element = $this->getSession()->getPage()->find('xpath', $xpath);
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not find element'));
        }

        $element->click();
    }

    /**
     * Overriding fillField to make it compatible with @smartStep in Scenario Outline.
     *
     * @param $field
     * @param $value
     */
    public function fillField($field, $value)
    {
        $field = $this->replacePlaceholdersByTokens($field);
        parent::fillField($field, $value);
    }

    /**
     * Overriding selectOption to make it compatible with @smartStep in Scenario Outline.
     *
     * @param $select
     * @param $option
     */
    public function selectOption($select, $option)
    {
        $select = $this->replacePlaceholdersByTokens($select);
        $option = $this->replacePlaceholdersByTokens($option);
        parent::selectOption($select, $option);
    }

    /**
     *
     * @When   /^If "(?P<select>(?:[^"]|\\")*)" is present, I select "(?P<option>(?:[^"]|\\")*)" from it$/
     * @param  $text
     * @param  $wait
     * @throws \Exception
     */
    public function selectIfPresent($select, $option)
    {
        $select = $this->replacePlaceholdersByTokens($select);
        $option = $this->replacePlaceholdersByTokens($option);

        if ($this->getSession()->getPage()->findField($select)) {
            $this->selectOption($select, $option);
        }
    }

    private function replacePlaceholdersByTokens($element)
    {
        if (is_array($this->scenarioTokens)) {
            foreach ($this->scenarioTokens as $key => $value) {
                $element = str_replace("<$key>", $value, $element);
            }
        }
        return $element;
    }

    /**
     *
     * @When   /^(?:|I )wait for element "(?P<element>(?:[^"]|\\")*)" to appear$/
     * @Then   /^(?:|I )should see element "(?P<element>(?:[^"]|\\")*)" appear$/
     * @param  $element
     * @throws \Exception
     */
    public function iWaitForElementToAppear($element)
    {
        $this->spin(
            function (FeatureContext $context) use ($element) {
                try {
                    $context->assertElementOnPage($element);
                    return true;
                }
                catch(ResponseTextException $e) {
                    // NOOP
                }
                return false;
            }
        );
    }

    /**
     *
     * @When   /^(?:|I )wait for element "(?P<element>(?:[^"]|\\")*)" to appear, for (?P<wait>(?:\d+)*) seconds$/
     * @param  $element
     * @param  $wait
     * @throws \Exception
     */
    public function iWaitForElementToAppearForNSeconds($element,$wait)
    {
        $this->spin(
            function (FeatureContext $context) use ($element) {
                try {
                    $context->assertElementOnPage($element);
                    return true;
                }
                catch(ResponseTextException $e) {
                    // NOOP
                }
                return false;
            }, $wait
        );
    }

    /**
     *
     * @When   /^(?:|I )wait for (?P<wait>(?:\d+)*) seconds$/
     * @param  $element
     * @param  $wait
     * @throws \Exception
     */
    public function iWaitForNSeconds($wait)
    {
        return sleep($wait);
    }

    /**
     *
     * @When   /^(?:|I )wait for element "(?P<element>(?:[^"]|\\")*)" to become visible$/
     * @param  $element
     * @throws \Exception
     */
    public function iWaitForElementToBecomeVisible($element)
    {
        $session = $this->getSession();

        $locator = $this->fixStepArgument($element);
        $xpath = $session->getSelectorsHandler()->selectorToXpath('css', $locator);
        $element = $this->getSession()->getPage()->find('xpath', $xpath);
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not find element'));
        }

        $this->spin(
            function () use ($element) {
                try {
                    return $element->isVisible();
                }
                catch(ResponseTextException $e) {
                    // NOOP
                }
                return false;
            }
        );
    }

    /**
     *
     * @when /^(?:|I )follow the element "(?P<element>(?:[^"]|\\")*)" href$/
     */
    public function iFollowTheElementHref($element)
    {
        $session = $this->getSession();

        $locator = $this->fixStepArgument($element);
        $xpath = $session->getSelectorsHandler()->selectorToXpath('css', $locator);
        $element = $this->getSession()->getPage()->find('xpath', $xpath);
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not find element'));
        }

        $href = $element->getAttribute('href');
        $this->visit($href);
    }

    /**
     *
     * @When   /^(?:|I )wait for text "(?P<text>(?:[^"]|\\")*)" to appear$/
     * @Then   /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)" appear$/
     * @param  $text
     * @throws \Exception
     */
    public function iWaitForTextToAppear($text)
    {
        $this->spin(
            function (FeatureContext $context) use ($text) {
                try {
                    $context->assertPageContainsText($text);
                    return true;
                }
                catch(ResponseTextException $e) {
                    // NOOP
                }
                return false;
            }
        );
    }


    /**
     *
     * @When   /^(?:|I )wait for text "(?P<text>(?:[^"]|\\")*)" to appear, for (?P<wait>(?:\d+)*) seconds$/
     * @param  $text
     * @param  $wait
     * @throws \Exception
     */
    public function iWaitForTextToAppearForNSeconds($text,$wait)
    {
        $this->spin(
            function (FeatureContext $context) use ($text) {
                try {
                    $context->assertPageContainsText($text);
                    return true;
                }
                catch(ResponseTextException $e) {
                    // NOOP
                }
                return false;
            }, $wait
        );
    }

    /**
     *
     * @Given  /^I fill in "([^"]*)" with a random email$/
     * @param  $element
     * @throws \Exception
     */

    public function iFillInWithARandomEmail($field)
    {
        $field = $this->replacePlaceholdersByTokens($field);
        $field = $this->fixStepArgument($field);
        $value = $this->randomEmail();
        $this->getSession()->getPage()->fillField($field, $value);
    }

    public function randomEmail()
    {
        return rand(900000, 99999999) . "@test.com";
    }

    /**
     *
     * @Given  /^I fill in "([^"]*)" with the fixed email$/
     * @param  $element
     * @throws \Exception
     */

    public function iFillInWithTheFixedEmail($field)
    {

        $field = $this->replacePlaceholdersByTokens($field);
        $field = $this->fixStepArgument($field);
        $value = self::$featureHash . "@test.com";
        $this->getSession()->getPage()->fillField($field, $value);
    }


    /**
     *
     * @Given /^document should open in new tab$/
     */
    public function documentShouldOpenInNewTab()
    {
        $session     = $this->getSession();
        $windowNames = $session->getWindowNames();
        if(sizeof($windowNames) < 2) {
            throw new \ErrorException("Expected to see at least 2 windows opened");
        }

        //You can even switch to that window
        $session->switchToWindow($windowNames[1]);
    }

    /**
     * Some forms do not have a Submit button just pass the ID
     *
     * @Given /^I submit the form with id "([^"]*)"$/
     */
    public function iSubmitTheFormWithId($element)
    {
        $script = sprintf('jQuery("%s").submit();', $element);
        $this->executeScript($element, $script);
    }

    /**
     *
     * @Given /^I use jquery to click on element "([^"]*)"$/
     */
    public function iUseJqueryToClickOnElement($element)
    {
        $script = sprintf('jQuery("%s").click();', $element);
        $this->executeScript($element, $script);
    }

    /**
     * @Given I use jquery to fill element :field with value :value
     */
    public function iUseJqueryToFillElementWithValue($element, $value)
    {
        $script = sprintf('jQuery("%s").val("%s").change();', $element, $value);
        $this->executeScript($element, $script);
    }

    /**
     * @Given I use jquery to click in element :field
     */
    public function iUseJqueryToClickInElement($field)
    {
        $script = sprintf('jQuery("%s").click();', $field);
        $this->executeScript($field, $script);
    }

    /**
     * @Given I use jquery to focus in element :field
     */
    public function iUseJqueryToFocusInElement($field)
    {
        $script = sprintf('jQuery("%s").click();', $field);
        $this->executeScript($field, $script);
    }

    /**
     * @Given I use jquery to focus out element :field
     */
    public function iUseJqueryToFocusOut($field)
    {
        $script = sprintf('jQuery("%s").focusout();', $field);
        $this->executeScript($field, $script);
    }

    /**
     * @Given I use jquery to fill element :field with a random email
     */
    public function iUseJqueryToFillElementWithARandomEmail($element)
    {
        $value = $this->randomEmail();

        $script = sprintf('jQuery("%s").val("%s").change();', $element, $value);
        $this->executeScript($element, $script);
    }
    /**
     * @Given I use jquery to set :html to element :field with value :value
     */
    public function iUseJqueryToSetToElementWithValue($html, $element, $value)
    {
        $script = sprintf('jQuery("%s").html("%s").val("%s").change();', $element, $html, $value);
        $this->executeScript($element, $script);
    }

    /**
     *
     * @Given /^a new session$/
     */
    public function newSession()
    {
        //$this->getSession()->reset();
    }

    /**
     *
     * @Given /^I define failure screenshot dir as "([^"]*)"$/
     */
    public function setScreenshotDir($dir)
    {
        $this->screenshotDir = $dir;
    }

    /**
     *
     * @Given /^I save a screenshot to "([^"]*)" file$/
     */
    public function screenshot($filename)
    {
        $driver =  $this->getSession()->getDriver();
        $data = $driver->getScreenshot();
        $file = fopen($filename, "w");
        fwrite($file, $data);
        fclose($file);
    }

    /**
     * @Given I check if card brand is selected in element :field
     */
    public function iCheckIfCardBrandIsSelectedInElement($element)
    {
        $script = sprintf( "jQuery('%s').attr('style') == 'filter: none;';", $element);
        $this->executeScript($element, $script);
    }

    /**
     * @Given I check if element :element exists
     */
    public function iCheckIfElementExists($element)
    {
        $node = $this->getSession()->getPage()->find('css', $element);
        if($node) {
            return true;
        } else {
            throw new Exception('Element not found: ' .  $element);
        }
    }

    private function executeScript($field, $script)
    {
        $node = $this->getSession()->getPage()->find('css', $field);

        if(!$node) {
            throw new Exception('Element not found: ' . $script);
        }

        $this->getSession()->executeScript($script);
    }

    /**
     * @Given I click in :arg1 by container
     */
    public function iClickInByContainer1($arg1)
    {
        $script = "jQuery('#payment-buttons-container').children('button').css('border', '2px solid red')";
        $this->executeScript($arg1, $script);
        echo $script;
        $script = "jQuery('#payment-buttons-container').children('button').click()";
        $this->executeScript($arg1, $script);
    }

}

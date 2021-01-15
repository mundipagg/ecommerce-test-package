<?php

namespace Mundipagg\Exceptions;

use Exception;

class ElementNotFound extends Exception
{
    public function __construct($message = "", $code = 404, $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}

<?php

namespace Mundipagg\Exceptions;

use Exception;

class TimeoutException extends Exception
{
    public function __construct($message = "", $code = 500, $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
}

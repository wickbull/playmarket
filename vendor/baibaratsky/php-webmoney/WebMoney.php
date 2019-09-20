<?php

namespace baibaratsky\WebMoney;

use baibaratsky\WebMoney\Exception\CoreException;
use baibaratsky\WebMoney\Request\AbstractRequest;
use baibaratsky\WebMoney\Request\AbstractResponse;
use baibaratsky\WebMoney\Request\Requester\AbstractRequester;

class WebMoney
{
    /** @var AbstractRequester */
    private $xmlRequester;

    /**
     * @param AbstractRequester $xmlRequester
     */
    public function __construct(AbstractRequester $xmlRequester)
    {
        $this->xmlRequester = $xmlRequester;
    }

    /**
     * @param AbstractRequest $requestObject
     *
     * @return AbstractResponse
     * @throws CoreException
     */
    public function request(AbstractRequest $requestObject)
    {
        if (!$requestObject->validate()) {
            throw new CoreException('Incorrect request data. See getErrors().');
        }

        return $this->xmlRequester->perform($requestObject);
    }
}

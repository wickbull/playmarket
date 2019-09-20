<?php

namespace baibaratsky\WebMoney\Api\X\X8;

use baibaratsky\WebMoney\Api\X;
use baibaratsky\WebMoney\Exception\ApiException;
use baibaratsky\WebMoney\Request\RequestValidator;
use baibaratsky\WebMoney\Signer;

/**
 * Class Request
 *
 * @link https://wiki.wmtransfer.com/projects/webmoney/wiki/Interface_X8
 */
class Request extends X\Request
{
    /** @var string testwmpurse/wmid */
    protected $wmid;

    /** @var string testwmpurse/purse */
    protected $purse;

    /**
     * @param string $authType
     * @throws ApiException
     */
    public function __construct($authType = self::AUTH_CLASSIC)
    {
        switch ($authType) {
            case self::AUTH_CLASSIC:
                $this->url = 'https://w3s.webmoney.ru/asp/XMLFindWMPurseNew.asp';
                break;

            case self::AUTH_LIGHT:
                $this->url = 'https://w3s.wmtransfer.com/asp/XMLFindWMPurseCertNew.asp';
                break;

            default:
                throw new ApiException('This interface doesn\'t support the authentication type given.');
        }

        parent::__construct($authType);
    }

    /**
     * @return array
     */
    protected function getValidationRules()
    {
        return array(
                RequestValidator::TYPE_REQUIRED => array('requestNumber'),
                RequestValidator::TYPE_DEPEND_REQUIRED => array(
                        'signerWmid' => array('authType' => array(self::AUTH_CLASSIC)),
                ),
        );
    }

    /**
     * @return string
     */
    public function getData()
    {
        $xml = '<w3s.request>';
        $xml .= self::xmlElement('reqn', $this->requestNumber);
        $xml .= self::xmlElement('wmid', $this->signerWmid);
        $xml .= self::xmlElement('sign', $this->signature);
        $xml .= '<testwmpurse>';
        $xml .= self::xmlElement('wmid', $this->wmid);
        $xml .= self::xmlElement('purse', $this->purse);
        $xml .= '</testwmpurse>';
        $xml .= '</w3s.request>';

        return $xml;
    }

    /**
     * @return string
     */
    public function getResponseClassName()
    {
        return Response::className();
    }

    /**
     * @param Signer $requestSigner
     */
    public function sign(Signer $requestSigner = null)
    {
        if ($this->authType === self::AUTH_CLASSIC) {
            $this->signature = $requestSigner->sign($this->wmid . $this->purse);
        }
    }

    /**
     * @param string $wmid
     */
    public function setWmid($wmid)
    {
        $this->wmid = (string)$wmid;
    }

    /**
     * @return string
     */
    public function getWmid()
    {
        return $this->wmid;
    }

    /**
     * @param string $testPurse
     */
    public function setPurse($testPurse)
    {
        $this->purse = (string)$testPurse;
    }

    /**
     * @return string
     */
    public function getPurse()
    {
        return $this->purse;
    }
}

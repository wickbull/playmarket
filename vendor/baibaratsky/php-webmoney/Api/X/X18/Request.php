<?php

namespace baibaratsky\WebMoney\Api\X\X18;

use baibaratsky\WebMoney\Api\X;
use baibaratsky\WebMoney\Exception\ApiException;
use baibaratsky\WebMoney\Request\RequestValidator;
use baibaratsky\WebMoney\Signer;

/**
 * Class Request
 *
 * @link https://wiki.wmtransfer.com/projects/webmoney/wiki/Interface_X18
 */
class Request extends X\Request
{
    const PAYMENT_NUMBER_TYPE_DEFAULT = 0;
    const PAYMENT_NUMBER_TYPE_ORDER = 1;
    const PAYMENT_NUMBER_TYPE_INVOICE = 2;
    const PAYMENT_NUMBER_TYPE_TRANSACTION = 3;

    /** @var string lmi_payee_purse */
    protected $payeePurse;

    /** @var string lmi_payment_no */
    protected $paymentNumber;

    /** @var int lmi_payment_no_type */
    protected $paymentNumberType = self::PAYMENT_NUMBER_TYPE_DEFAULT;

    /** @var string sha256 */
    protected $sha256;

    /** @var string md5 */
    protected $md5;

    /** @var string secret_key */
    protected $secretKey;

    /**
     * @param string $authType
     * @param string $secretKey
     * @throws ApiException
     */
    public function __construct($authType = self::AUTH_CLASSIC, $secretKey = null)
    {
        if (
                $secretKey === null
                && in_array($authType, array(self::AUTH_SHA256, self::AUTH_MD5, self::AUTH_SECRET_KEY))
        ) {
            throw new ApiException('Secret key is required for this authentication type.');
        }

        $this->url = 'https://merchant.webmoney.ru/conf/xml/XMLTransGet.asp';
        $this->secretKey = $secretKey;

        parent::__construct($authType);
    }

    /**
     * @return array
     */
    protected function getValidationRules()
    {
        return array(
                RequestValidator::TYPE_REQUIRED => array('signerWmid', 'payeePurse', 'paymentNumber'),
                RequestValidator::TYPE_RANGE => array(
                        'paymentNumberType' => array(
                                self::PAYMENT_NUMBER_TYPE_DEFAULT,
                                self::PAYMENT_NUMBER_TYPE_ORDER,
                                self::PAYMENT_NUMBER_TYPE_INVOICE,
                                self::PAYMENT_NUMBER_TYPE_TRANSACTION,
                        ),
                ),
        );
    }

    /**
     * @return string
     */
    public function getData()
    {
        $xml = '<merchant.request>';
        $xml .= self::xmlElement('wmid', $this->signerWmid);
        $xml .= self::xmlElement('lmi_payee_purse', $this->payeePurse);
        $xml .= self::xmlElement('lmi_payment_no', $this->paymentNumber);
        $xml .= self::xmlElement('lmi_payment_no_type', $this->paymentNumberType);
        $xml .= self::xmlElement('sign', $this->signature);
        $xml .= self::xmlElement('sha256', $this->sha256);
        $xml .= self::xmlElement('md5', $this->md5);

        if ($this->authType === self::AUTH_SECRET_KEY) {
            $xml .= self::xmlElement('secret_key', $this->secretKey);
        }

        $xml .= '</merchant.request>';

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
            $this->signature = $requestSigner->sign($this->signerWmid . $this->payeePurse . $this->paymentNumber);
        } elseif ($this->authType === self::AUTH_SHA256) {
            $this->sha256 = hash(
                    'sha256',
                    $this->signerWmid . $this->payeePurse . $this->paymentNumber . $this->secretKey
            );
        } elseif ($this->authType === self::AUTH_MD5) {
            $this->md5 = md5($this->signerWmid . $this->payeePurse . $this->paymentNumber . $this->secretKey);
        }
    }

    /**
     * @param string $payeePurse
     */
    public function setPayeePurse($payeePurse)
    {
        $this->payeePurse = (string)$payeePurse;
    }

    /**
     * @return string
     */
    public function getPayeePurse()
    {
        return $this->payeePurse;
    }

    /**
     * @param string $paymentNumber
     */
    public function setPaymentNumber($paymentNumber)
    {
        $this->paymentNumber = (string)$paymentNumber;
    }

    /**
     * @return string
     */
    public function getPaymentNumber()
    {
        return $this->paymentNumber;
    }

    /**
     * @param int $paymentNumberType
     */
    public function setPaymentNumberType($paymentNumberType)
    {
        $this->paymentNumberType = (int)$paymentNumberType;
    }

    /**
     * @return int
     */
    public function getPaymentNumberType()
    {
        return $this->paymentNumberType;
    }
}

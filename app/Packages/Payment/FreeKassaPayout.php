<?php

namespace App\Packages\Payment;


class FreeKassaPayout
{
    /**
     * @var
     */
    private $merchant_id;
    /**
     * @var
     */
    private $api_key;
    /**
     * @var null
     */
    /**
     * @var string
     */
    private $url;

    /**
     * FreeKassaPayment constructor.
     * @param $merchant_id
     * @param $secret_word
     * @param null $secret_word2
     */
    function __construct($merchant_id, $api_key)
    {
        $this->merchant_id = $merchant_id;
        $this->api_key = $api_key;
        $this->url = 'https://www.fkwallet.ru/';
    }

    /**
     * @param $method
     * @param array $content
     * @return \SimpleXMLElement
     */
    private function sendRequest($method, array $content = [])
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $this->url . $method . '?' . http_build_query($content));
        $result = curl_exec($ch);
        curl_close($ch);
        return @simplexml_load_string($result);
    }

    /**
     * @param $data
     * @return string
     * @throws \Exception
     */
    private function generateUrl($data)
    {
        if (empty($data['orderID'])) throw new \Exception("Необходим номер транзакции");
        if (empty($data['amount'])) throw new \Exception("Укажите суму транзакции");
        $setting = [
            'm' => $this->merchant_id,
            's' => $this->paymentHash($data['amount'], $data['orderID']),
            'o' => $data['orderID'],
            'em' => $data['email'] ? $data['email'] : '',
            'oa' => $data['amount'],
            'lang' => 'ru',
        ];
        if (!empty($data['currency'])) $setting['i'] = $data['currency'];

        return $this->url . 'merchant/cash.php' . '?' .
            http_build_query($setting);
    }

    /**
     * @return mixed
     */
    private function getIP()
    {
        if (isset($_SERVER['HTTP_X_REAL_IP'])) return $_SERVER['HTTP_X_REAL_IP'];
        return $_SERVER['REMOTE_ADDR'];
    }

    /**
     *
     */
    public function checkIP($ip)
    {
        if (!in_array($ip, array('136.243.38.147', '136.243.38.149', '136.243.38.150', '136.243.38.151', '136.243.38.189', '88.198.88.98'))) {
            die("hacking attempt!");
        }
    }

    /**
     * @param $order_amount
     * @param $order_id
     * @param $hash
     * @throws \Exception
     */
    private function checkHash($order_amount, $order_id, $hash)
    {
        if ($hash != $this->paymentHash($order_amount, $order_id))
            throw new \Exception("Hash  не совпадает");
    }

    /**
     * @param double $order_amount Сума платежа
     * @param int $order_id Номер заказа
     * @return string hash
     */
    protected function paymentHash($order_amount, $order_id)
    {
        if (!is_numeric($order_amount))
            throw new \Exception("Сума платежа должна быть числом");
        if (!is_numeric($order_id))
            throw new \Exception("Номер заказа должна быть числом");
        return md5($this->merchant_id . ':' . $order_amount . ':' . $this->secret_word . ':' . $order_id);
    }

    /**
     * @param double $order_amount Сума платежа
     * @param int $order_id Номер заказа
     * @return string hash
     */
    public function scriptHash($order_amount, $order_id)
    {
        if (empty($this->secret_word2))
            throw new \Exception("Укажите Секретное слово 2");
        if (!is_numeric($order_amount))
            throw new \Exception("Сума платежа должна быть числом");
        if (!is_numeric($order_id))
            throw new \Exception("Номер заказа должна быть числом");
        return md5($this->merchant_id . ':' . $order_amount . ':' . $this->secret_word2 . ':' . $order_id);
    }


    /**
     * @return \SimpleXMLElement
     */
    public function checkBalance()
    {
        return $this->sendRequest('api.php', [
            'merchant_id' => $this->merchant_id,
            's' => md5($this->merchant_id . $this->secret_word2),
            'action' => 'get_balance'
        ]);
    }


    /**
     * @param string|int $order_id Номер заказа
     * @param null $intid
     * @return \SimpleXMLElement
     */
    public function checkOrder($order_id, $intid = null)
    {
        if (empty($intid)) $intid = $order_id;
        return $this->sendRequest('api.php', [
            'merchant_id' => $this->merchant_id,
            's' => md5($this->merchant_id . $this->secret_word2),
            'order_id' => $order_id,
            'intid' => $intid,
            'action' => 'check_order_status'
        ]);
    }


    /**
     * @param string $email Емейл
     * @param double $amount Сумма
     * @param string null $desc Описание
     * @return \SimpleXMLElement
     */
    public function paymentEmail($email, $amount, $desc = null)
    {
        return $this->sendRequest('api.php', [
            'merchant_id' => $this->merchant_id,
            's' => md5($this->merchant_id . $this->secret_word2),
            'email' => $email,
            'amount' => $amount,
            'desc' => !empty($desc) ? $desc : 'Оплата на ' . config('app.name'),
            'action' => 'create_bill'
        ]);
    }


    public function operationHistory()
    {
        return $this->sendRequest('export.php', [
            'merchant_id' => $this->merchant_id,
            's' => md5($this->merchant_id . $this->secret_word2),
            'status' => 'all',
            'limit' => '100',
            'action' => 'get_orders'
        ]);
    }

    public function payout($amount)
    {
        return $this->sendRequest('api.php', [
            'merchant_id' => $this->merchant_id,
            's' => md5($this->merchant_id . $this->secret_word2),
            'currency' => 'card',
            'amount' => $amount,
            'action' => 'payment',
        ]);
    }


    /**
     * @param $data
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Exception
     */
    public function payment($data)
    {
        return redirect($this->generateUrl($data));
    }

}
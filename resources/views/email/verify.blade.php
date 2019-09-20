<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
</head>
<body>
<h2>Verify Your Email Address</h2>

<div>
    Добро пожаловать на Goldlvl.ru!
    Чтоб активировать ваш аккаунт, перейдите по ссылке в письме.
    <a href="{{ URL::to('register/verify/' . $data) }}">Link</a><br/>

</div>

</body>
</html>
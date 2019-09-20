@component('mail::message')
{{-- Greeting --}}
@if (! empty($greeting))
# {{ $greeting }}
@else
@if ($level == 'error')
    # Упс!
@else
    # Здравствуйте!
@endif
@endif

{{-- Intro Lines --}}
@foreach ($introLines as $line)
{{ $line }}

@endforeach

{{-- Action Button --}}
@isset($actionText)
<?php
    switch ($level) {
        case 'success':
            $color = 'green';
            break;
        case 'error':
            $color = 'red';
            break;
        default:
            $color = 'blue';
    }
?>
@component('mail::button', ['url' => $actionUrl, 'color' => $color])
{{ $actionText }}
@endcomponent
@endisset

{{-- Outro Lines --}}
@foreach ($outroLines as $line)
{{ $line }}

@endforeach

{{-- Salutation --}}
{{--@if (! empty($salutation))--}}
{{--{{ $salutation }}--}}
{{--@else--}}
    {{--С уважением, {{ config('app.name') }}--}}
{{--@endif--}}

{{-- Subcopy --}}
@isset($actionText)
@component('mail::subcopy')
    Если у вас проблемы с кнопкой "{{ $actionText }}" , скопируйте URL и вставте у вашу адресну строку браузера: [{{ $actionUrl }}]({{ $actionUrl }})
@endcomponent
@endisset
@endcomponent

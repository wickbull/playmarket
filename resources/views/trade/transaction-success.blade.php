@extends('layouts.app')

@section('content')
    <main>
        <div class="container">
            <div class="row">
                <div class="col-md-24">
                    <div class="panel panel-default">
                        <div class="panel-body c-my-purchases">
                            <div class="modal-footer__ttl text-center">
                                Транзакция успешно проведена.<br>
                                В ближайшее время прийдет сообщения в чат об успешной оплате.
                                <a href="{{route('chat')}}">В чат</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            setTimeout(function () {
                window.location.href = "{{route('chat')}}";
            }, 2000);
        })

    </script>
@endsection

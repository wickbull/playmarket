@extends('layouts.app')

@section('content')
    <main>
        <div class="container">
            <div class="row">
                <div class="col-md-24">
                    <div class="panel panel-default">
                        <div class="panel-body c-my-purchases">
                            <div class="modal-footer__ttl text-center">
                            Что-то пошло не так. Ошибка транзакции.<br>
                            <a href="{{route('home')}}">На главную</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection

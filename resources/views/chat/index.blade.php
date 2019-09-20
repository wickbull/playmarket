@extends('layouts.app')

@section('content')
    <main>
        <chat-layout :users="{{$users}}" :auth="{{auth()->user()}}" :lang="{{$lang}}"></chat-layout>
{{--        <chat-layout :users="{{$users}}" :auth="{{auth()->user()}}" :new_msg="{{$new_chat_event}}"></chat-layout>--}}
    </main>
@endsection

@section('scripts')

@endsection
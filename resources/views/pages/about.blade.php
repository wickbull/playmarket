@extends('layouts.app')

@push('head')
    <style>
        {!! $page->excerpt !!}
    </style>
@endpush

@section('content')
    <div class="c-text-content">
        <div class="container">
            <h1 class="h1">{{ $page->title }}</h1>
            {!! $page->body !!}
        </div>
    </div>

@endsection

@section('scripts')
    @parent
    @if(!Auth::user() || Auth::user()->confirmed_rules == 1)
    <script>
        $('#rules-btn').remove()
    </script>
    @endif
@endsection
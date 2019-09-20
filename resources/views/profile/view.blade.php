@extends('layouts.app')

@section('content')

    <main>
        <div class="c-profile">
            <div class="container">
                <div class="c-profile__header">
                    <div class="row">
                        <div class="col-lg-18 col-md-16 col-sm-12 col-xs-24">
                            <div class="c-profile__user">
                                <div class="c-profile__user-left">
                                    <div class="c-profile__user-avatar">
                                        <div class="h-object-fit"><img src="{{ $user['avatar'] }}" alt="alt"/></div>
                                    </div>
                                </div>
                                <div class="c-profile__user-right">
                                    <div class="c-profile__user-name">
                                        <span>{{ $user['name'] }}</span>@if($user->isOnline())<span
                                                class="c-chat__online">online</span>@else <span class="c-chat__offline">offline</span> @endif
                                    </div>
                                    <div class="c-profile__user-info">
                                        <span>@lang(session("langId"), 'cabinet_profile', 'registered', 43200) {{ date('d m Y  H:i', strtotime($user['created_at'])) }}</span>
                                    </div>
                                    <div class="c-profile__user-rating"><span class="txt">@lang(session("langId"), 'cabinet_profile', 'rating', 43200)</span><span
                                                class="value"
                                                @if($user['rating'] < 0) style="color:red!important;" @endif>{{ $user['rating'] }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="c-profile__body">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 col-sm-12 col-xs-24">
                            <div role="tablist" class="c-tab-nav xs-full xx-full">
                                <button type="button" class="c-tab-nav__trig visible-xs"><span>@lang(session("langId"), 'cabinet_profile', 'lots', 43200)</span>
                                </button>
                                <ul class="c-tab-nav__drop h-list minimized">
                                    <li role="presentation" class="active"><a href="#profile_feedbacks"
                                                                              aria-controls="profile_feedbacks"
                                                                              role="tab"
                                                                              data-toggle="tab"><span>@lang(session("langId"), 'cabinet_profile', 'reviews', 43200)</span></a>
                                    </li>
                                    <li role="presentation"><a href="#profile_lots"
                                                                              aria-controls="profile_lots" role="tab"
                                                                              data-toggle="tab"><span>@lang(session("langId"), 'cabinet_profile', 'lots', 43200)</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="profile_feedbacks" role="tabpanel" class="tab-pane fade active in">
                            <div class="c-profile__feedbacks">
                                <div class="c-profile__feedbacks-filter">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-xx-24">
                                            <div class="form-group">
                                                <div class="form-group__ttl">@lang(session("langId"), 'cabinet_profile', 'view', 43200)</div>
                                                <div class="select-wrap">
                                                    <select title="Выбрать" name="mark" id="user-mark-filter"
                                                            class="selectpicker">
                                                        <option value="1">@lang(session("langId"), 'cabinet_profile', 'positive', 43200)</option>
                                                        <option value="0">@lang(session("langId"), 'cabinet_profile', 'negative', 43200)</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-14 col-md-18 col-xs-24">
                                            <div class="c-profile__feedbacks-list">
                                                @include('profile.parts.feedback-list-composer',['reviews' => $user->reviews])
                                            </div>
                                            @if(count($review_access) && !empty($review_access->where('review',null)->first()))
                                                <div class="saler-feedbacks__form">
                                                    <form id="feedback-form"
                                                          action="{{route('send_user_feedback',['id' => $user->id])}}"
                                                          method="POST">
                                                        {{csrf_field()}}
                                                        <input type="hidden" name="trade_id"
                                                               value="{{$review_access->where('review',null)->first()->id or ''}}">
                                                        <div class="form-group">
                                                            <div class="input-wrap">
                                                                            <textarea placeholder="Написать отзыв"
                                                                                      maxlength="250"
                                                                                      required="required" name="text"
                                                                                      class="form-control no-resize"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="saler-feedbacks__form-radios">
                                                            <div class="form-group">
                                                                <label class="radio-label label_good">
                                                                    <input type="radio"
                                                                           name="mark"
                                                                           checked="checked"
                                                                           value="1"
                                                                           class="hidden-input"/><span
                                                                            class="check-icon"></span><span
                                                                            class="check-value">@lang(session("langId"), 'cabinet_profile', 'positive', 43200)</span>
                                                                </label>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="radio-label label_bad">
                                                                    <input type="radio"
                                                                           name="mark"
                                                                           value="0"
                                                                           class="hidden-input"/><span
                                                                            class="check-icon"></span><span
                                                                            class="check-value">@lang(session("langId"), 'cabinet_profile', 'negative', 43200)</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="saler-feedbacks__form-footer">
                                                            <button id="send_review"
                                                                    class="btn btn_blue btn_upper">
                                                                @lang(session("langId"), 'cabinet_profile', 'send', 43200)
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="profile_lots" role="tabpanel" class="tab-pane fade">
                            <div class="c-my-lots">
                                <div class="c-my-sales__filter">
                                    <form class="profile-lot-filter-form">
                                        <input type="hidden" name="user_id" value="{{$user->id}}">
                                        <div class="row">
                                            <div class="col-lg-18 col-xs-24">
                                                <div class="row">
                                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                                        <div class="form-group">
                                                            <div class="form-group__ttl">Игра</div>
                                                            <div class="select-wrap">
                                                                <select id="game" title="Выбрать" name="game_id"
                                                                        class="selectpicker">
                                                                    <option value="">Выбрать</option>
                                                                    @foreach($games as $game)
                                                                        <option value="{{$game['game']['id']}}">{{$game['game']['name']}}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                                        <div class="form-group">
                                                            <div class="form-group__ttl">Сервер</div>
                                                            <div class="select-wrap">
                                                                <select id="server" title="Выбрать" name="server_id"
                                                                        class="selectpicker">
                                                                    <option value="">Выбрать</option>
                                                                    @foreach($servers as $server)
                                                                        <option value="{{$server['server']['id']}}">{{$server['server']['name']}}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                                        <div class="form-group">
                                                            <div class="form-group__ttl">Раздел</div>
                                                            <div class="select-wrap">
                                                                <select id="tag" title="Выбрать" name="tag_id"
                                                                        class="selectpicker">
                                                                    <option value="">Выбрать</option>
                                                                    @foreach($tags as $tag)
                                                                        <option value="{{$tag['tag']['id']}}">{{$tag['tag']['name']}}</option>
                                                                    @endforeach
                                                                    <option value="currency">Валюта</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="c-my-sales__body">
                                    <table class="c-my-sales__table">
                                        <thead>
                                        <tr>
                                            <th>Лот</th>
                                            <th class="text-center">Наличие</th>
                                            <th class="text-center">Цена</th>
                                        </tr>
                                        </thead>
                                        <tbody id="lots-block">
                                        @include('profile.parts.user-profile-list',['lots' => $user->lots])
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

@endsection

@section('scripts')
    <script src="{{ asset('js/search.js') }}"></script>

    <script>
        $(document).on('click', '#send_review', function (e) {
            e.preventDefault();
            $.ajax({
                url: "{{route('send_user_feedback',['id' => $user->id])}}",
                type: "POST",
                data: $('#feedback-form').serialize(),
                statusCode: {
                    500: function () {
                        console.log('Сервер недоступен');
                    }
                },
                success: function (data) {
                    console.log(data);
                    $('.c-profile__feedbacks-list').prepend(data.view);
                    if (data.rating != undefined)
                        $('.value').html(data.rating);
                    $('.saler-feedbacks__form').remove();
                },
                error: function (data) {
                    console.log('Не удалось отправить.');
                    var errors = data.responseJSON;
                    console.log(errors);

                }
            });
        });
        $('#user-mark-filter').on('change', function () {
            let mark = $(this).val();
            $.ajax({
                url: "{{route('user-profile-review',['id' => $user->id])}}",
                type: "POST",
                data: {
                    '_token': '{{csrf_token()}}',
                    'mark': mark
                },
                statusCode: {
                    500: function () {
                        console.log('Сервер недоступен');
                    }
                },
                success: function (data) {
                    $('.c-profile__feedbacks-list').html(data);
                },
                error: function (data) {
                    console.log('Не удалось отправить.');
                    var errors = data.responseJSON;
                    console.log(errors);

                }
            });
        })
    </script>
@endsection

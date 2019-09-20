<div class="c-personal-data js-personal-data">
    <form role="form" action="{{ route('update-profile', $user['id']) }}"
          method="POST"
          enctype="multipart/form-data">
        {{ csrf_field() }}
        <div class="c-profile__user">
            <div class="c-profile__user-left">
                <div class="c-profile__user-avatar">
                    <div class="h-object-fit"><img src="{{ $user['avatar'] }}" alt="alt"
                                                   class="js-avatar"/></div>
                </div>
            </div>
            <div class="c-profile__user-right">
                <label class="btn btn_blue-white btn_auto-height text-center js-change-avatar"><span>@lang(session("langId"), 'personal_data', 'change_avatar', 43200)</span>
                    <input type="file" name="avatar" id="avatar"
                           class="hidden-input js-change-avatar" multiple/>
                </label>
            </div>
        </div>
        <div class="c-personal-data__list">
            <div class="c-personal-data__item">
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-24">
                        <div class="c-personal-data__item-ttl"><span>@lang(session("langId"), 'personal_data', 'msisdn', 43200)</span></div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-10 col-xs-24">
                        <div class="c-personal-data__item-val">
                            <span>{{strlen($user['phone'])>5?"+".$user['phone']:'-'}}</span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-8 col-xs-24">
                        <div class="c-personal-data__item-btn">
                            <button type="button" data-toggle="modal"
                                    data-target="#modal-change-tel"
                                    class="btn btn_blue-white btn_block js-change-avatar">
                                @lang(session("langId"), 'personal_data', 'edit', 43200)
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="c-personal-data__item">
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-24">
                        <div class="c-personal-data__item-ttl"><span>@lang(session("langId"), 'personal_data', 'mail', 43200)</span></div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-10 col-xs-24">
                        <div class="c-personal-data__item-val">
                            <span>{{ $user['email'] }}</span></div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-4 col-xs-24">
                        <div class="c-personal-data__item-btn">
                            <button type="button" data-toggle="modal"
                                    data-target="#modal-change-email"
                                    class="btn btn_blue-white btn_block js-change-avatar">
                                @lang(session("langId"), 'personal_data', 'edit', 43200)
                            </button>
                        </div>
                    </div>
                    @if(auth()->user()->confirmed != '1')
                        <div class="col-lg-4 col-md-5 col-sm-4 col-xs-24">
                            <div class="c-personal-data__item-btn">
                                <button type="button" data-toggle="modal"
                                        data-target="#modal-confirm-email"
                                        class="btn btn_blue-white btn_block">
                                    @lang(session("langId"), 'personal_data', 'confirm', 43200)
                                </button>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
            <div class="c-personal-data__item">
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-24">
                        <div class="c-personal-data__item-ttl"><span>@lang(session("langId"), 'personal_data', 'password', 43200)</span></div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-10 col-xs-24">
                        <div class="c-personal-data__item-val"><span>***********</span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-4 col-xs-9">
                        <div class="c-personal-data__item-btn">
                            <button type="button" data-toggle="modal"
                                    data-target="#modal-change-pass"
                                    class="btn btn_blue-white btn_block js-change-avatar">
                                @lang(session("langId"), 'personal_data', 'edit', 43200)
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-15">
                        <div class="c-personal-data__item-btn">
                            <button id="resetPass" type="button"
                                    class="btn btn_blue-white btn_block js-change-avatar">
                                @lang(session("langId"), 'personal_data', 'remind_password', 43200)
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="c-personal-data__footer">
            <button type="submit" class="btn btn_blue">@lang(session("langId"), 'personal_data', 'save', 43200)</button>
        </div>
    </form>
</div>
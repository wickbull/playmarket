<div class="c-profile">
    <div class="c-profile__header">
        <div class="row">
            <div class="col-lg-18 col-md-16 col-sm-12 col-xs-24">
                <div class="c-profile__user">
                    <div class="c-profile__user-left">
                        <div class="c-profile__user-avatar">
                            <div class="h-object-fit"><img src="{{ $user['avatar'] }}"
                                                           alt="alt"/></div>
                        </div>
                    </div>
                    <div class="c-profile__user-right">
                        <div class="c-profile__user-name">
                            <span>{{ $user['name'] }}</span>@if($user->isOnline())<span
                                    class="c-chat__online">@lang(session("langId"), 'cabinet_profile', 'online', 43200)</span>@else <span
                                    class="c-chat__offline">@lang(session("langId"), 'cabinet_profile', 'offline', 43200)</span> @endif
                        </div>
                        <div class="c-profile__user-info">
                            <span>@lang(session("langId"), 'cabinet_profile', 'registered', 43200) {{ localeDate($user['created_at'],'d M Y  H:i') }}</span>
                        </div>
                        <div class="c-profile__user-rating"><span class="txt">@lang(session("langId"), 'cabinet_profile', 'rating', 43200)</span><span
                                    class="value">{{ $user['rating'] }}</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="c-profile__body">
        <div class="row">
            <div class="col-lg-18 col-md-16 col-sm-12 col-xs-24">
                <div class="c-balance__money">
                    <div class="c-balance__money-ttl"><span>@lang(session("langId"), 'cabinet_profile', 'reviews', 43200)</span></div>
                    <div class="c-balance__money-list">
                        <div class="c-profile__feedbacks">
                            <div class="c-profile__feedbacks-filter">
                                <div class="c-profile__feedbacks-list">
                                    @each('profile.parts.feedback-list', $user->reviews, 'item','profile.parts.feedback-empty')
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="modal-change-tel" tabindex="-1" role="dialog" class="modal-change modal-change-tel modal fade modal_centered">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                <h3 class="modal-title">@if(auth()->check() && strlen(auth()->user()->phone) < 6) @lang(session("langId"), 'modal', 'add_msisdn', 43200) @else @lang(session("langId"), 'modal', 'add_msisdn', 43200) @endif</h3>
            </div>
            <div class="modal-body">
                <form class="js-form_check" method="POST" action="{{ route('change-phone') }}">
                    {{ csrf_field() }}
                    <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                        <div class="form-group__ttl">@lang(session("langId"), 'modal', 'password', 43200)</div>
                        <div class="input-wrap">
                            <input type="password" name="password" value="" required="required" class="form-control"/>
                            @if ($errors->has('password'))
                                <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>
                    <div class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                        <div class="form-group__ttl">@lang(session("langId"), 'modal', 'msisdn', 43200)</div>
                        <div class="input-wrap">
                            <input id="phone" type="text" name="phone" value="" required="required" placeholder="@lang(session("langId"), 'modal', 'msisdn_placeholder', 43200)"
                                   class="form-control"/>
                            @if ($errors->has('phone'))
                                <span class="help-block">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <button id="sms-code" type="button" class=" button btn btn_blue-white sms-code">@lang(session("langId"), 'modal', 'send_sms', 43200)</button>
                    </div>
                    <div class="form-group{{ $errors->has('code') ? ' has-error' : '' }}">
                        <div class="form-group__ttl">@lang(session("langId"), 'modal', 'sms_code', 43200)</div>
                        <div class="input-wrap">
                            <input type="text" name="code" value="" required="required"
                                   class="form-control"/>
                            @if ($errors->has('code'))
                                <span class="help-block">
                                        <strong>{{ $errors->first('code') }}</strong>
                                    </span>
                            @endif
                        </div>
                    </div>
                    <div class="form-footer text-center">
                        <button type="submit" class=" button btn btn_blue btn_upper">@lang(session("langId"), 'modal', 'save', 43200)</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
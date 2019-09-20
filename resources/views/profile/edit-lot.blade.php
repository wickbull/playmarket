<form class="js-form_check" id="modal-form" method="POST" action="{{route('edit-sell-proposition', $lot->id)}}">
    {{ csrf_field() }}
    <div class="row">
        <div class="col-xs-24">
            <div class="form-group">
                @if(!empty($servers))
                    <div class="form-group__ttl">Сервер</div>
                    <div class="select-wrap">
                        <select title="Выбрать" name="server_id" class="selectpicker">
                            @foreach($servers as $server)
                                <option @if($server->id == $lot->server_id) selected="selected"
                                        @endif value="{{$server->id}}">{{ $server->name }}</option>
                            @endforeach
                        </select>
                    </div>
                @endif
            </div>
        </div>
        @foreach($subtags as $subtag)
            <div class="col-xs-24 subtag-data"
                 @if($subtag->attach != 0 && !$lot->subtags->where('sub_tag_id',$subtag->id)->count()) style="display: none;"
                 @endif @if($lot->subtags->where('sub_tag_id',$subtag->id)->count()) data-active="{{$subtag->attach}}" @endif data-id="{{$subtag->id}}" data-parent="{{$subtag->attach}}">
                    <div class="form-group">
                        @if($subtag->subTagMetadata->isNotEmpty())
                            <div class="form-group__ttl">{{ $subtag->name }}</div>
                            <div class="select-wrap">
                                <select title="Выбрать" name="subtags[{{ $subtag->id }}]" required
                                        @if($subtag->attach != 0 && !$lot->subtags->where('sub_tag_id',$subtag->id)->count()) disabled="disabled"
                                        @endif
                                        class="selectpicker subtag-pick">
                                    {{--<option>Выбрать</option>--}}
                                    @foreach($subtag->subTagMetadata as $metadata)
                                        <option @if($lot->subtags->where('sub_tag_id',$subtag->id)->where('sub_tag_value_id',$metadata->id)->count()) selected="selected"
                                                @endif value="{{$metadata->id}}">{{ $metadata->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        @else
                            @foreach($lot->subtags as $lot_subtag)
                                @if($subtag->id == $lot_subtag->sub_tag_id)
                                    <div class="form-group__ttl">{{ $subtag->name }}</div>
                                    <div class="input-wrap">
                                        <input type="text" name="subtags[{{ $subtag->id }}]"
                                               placeholder="Название" value="{{$lot_subtag->name}}"
                                               required="required"
                                               class="form-control"/>

                                    </div>
                                @endif
                            @endforeach
                        @endif
                    </div>
                </div>
        @endforeach
        <div class="col-xs-24 col-xx-24">
            <div class="form-group">
                <div class="form-group__ttl">Описание</div>
                <div class="input-wrap">
                    <textarea name="description" required="required" class="form-control" aria-required="true"
                              maxlength="100">{!! $lot->description !!}
                    </textarea>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-xx-24">
            <div class="form-group">
                <div class="form-group__ttl">Цена ₽</div>
                <div class="input-wrap input-group">
                    <input type="number" step="any" name="price"
                           value="{{floatval($lot->price)}}" required="required"
                           class="form-control"/>
                    <span class="input-group-addon">₽</span>

                </div>
            </div>
        </div>
        @if($lot->availability != 0)
            <div class="col-xs-12 col-xx-24">
                <div class="form-group">
                    <div class="form-group__ttl">Наличие шт.</div>
                    <div class="input-wrap">
                        <input type="number" name="availability" value="{{intval($lot->availability)}}"
                               required="required"
                               class="form-control"/>
                    </div>
                </div>
            </div>
        @endif
        <div class="col-xs-24">
            <div class="form-group">
                <label class="checkbox-label">
                    <input type="checkbox" name="active"
                           @if($lot->active == 1) checked="checked" @endif
                           value="1" class="hidden-input"/><span
                            class="check-icon"></span><span
                            class="check-value">Активное</span>
                </label>
            </div>
        </div>
    </div>
    <div class="form-footer text-center">
        <button type="submit" class="btn btn_blue btn_upper">сохранить</button>
    </div>
</form>
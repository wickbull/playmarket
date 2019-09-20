{{ csrf_field() }}
<div class="c-games-chat__adena-form-ttl"><span>Оформление заказа</span></div>
<div class="row">
    <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
        <div class="form-group">
            <div class="form-group__ttl">Способ оплаты</div>
            <div class="select-wrap">
                <select title="Выбрать" name="pay_method" class="selectpicker">
                    <option>lorem</option>
                    <option>Ipsum</option>
                    <option>Dolor</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
        <div class="form-group">
            <div class="form-group__ttl">Имя персонажа</div>
            <div class="input-wrap">
                <input type="text" name="character_name" placeholder="Название" value=""
                       class="form-control"/>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
        <div class="form-group ">
            <div class="form-group__ttl">Заплачу</div>
            <div class="input-wrap"  id="get-price-currency">
                <input type="text" name="price" placeholder="00.00 ₽" value=""
                       class="form-control" id="currency-price"/>
                <input id="hidden-currency-price" disabled class="form-control hidden" value="{{$lot->price}}">
            </div>
        </div>
        <div class="form-group">
            <div class="form-group__ttl">Получу</div>
            <div class="input-wrap">
                <input type="text" name="currency-total-price" placeholder="00.00 ₽"
                       value="" class="form-control" id="currency-total-price"/>
                <input id="hidden-availability-currency" disabled class="form-control hidden" value="{{$lot->availability}}">
                <input id="hidden-min-order" disabled class="form-control hidden" value="{{$lot->min_order}}">
            </div>
        </div>
    </div>
</div>
<div class="c-games-chat__adena-form-footer">
    <button type="submit" class="btn btn_blue btn_upper create-trade-proposition">Купить</button>
</div>

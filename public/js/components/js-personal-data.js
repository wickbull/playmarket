(function () {
    var read_img_url = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.js-avatar').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        };
    };
    $('.js-change-avatar').on('change', function(){
        read_img_url(this);
    });
})();
$(function () {
    $('#pay').click(function () {
        var identifier = $(this).attr('identifier')
        $.get('/pay/', {'identifier':identifier}, function (response) {
            console.log(response)
            if (response.status){
                window.open(response.alipay_url, target='_self')
            }
        })
    })
})
$(function () {
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var flag5 = false;
    //设置手机号
    // 定义一个手机函数
    function mobile(num) {
        // 以13x|15x|18x|开头，+8位数字结尾
        if( /^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+(\d{8})$/.test(num) == false ) {

            //改变输入的提示信息
            $("#phonenum").attr({"class": "u-btn-user txtno"});
            $(".user").attr({"class": "user no"});
            $(".tips1").html("手机号不正确");
            flag1 = false;
        } else
            {
                // $.ajax({
                //     url:'/checkutel/',
                //     type:'get',
                //     data:{'utel': $(this).val()},
                //     success:function (response) {
                //
                //         // $.get('/checkutel/', {'utel': $(this).val()}, function (response) {
                //         console.log(response)
                //         // $('#phonenum .text').html(response.msg)
                //         if (response.status) {   // 可用
                //             $("#phonenum").attr({"class": "u-btn-user txtyes"});
                //             $(".user").attr({"class": "user yes"});
                //             $(".tips1").html("");
                //             flag1 = true;
                //         } else {    // 不可用
                //             $("#phonenum").attr({"class": "u-btn-user txtno"});
                //             $(".user").attr({"class": "user no"});
                //             $(".tips1").html(response.msg);
                //             flag1 = false;
                //         }
                //
                //     }
                // })


            $("#phonenum").attr({"class": "u-btn-user txtyes"});
            $(".user").attr({"class": "user yes"});
            $(".tips1").html("");
            flag1 = true;
        }
    }
    $("#phonenum").keyup(function () {
        mobile( $("#phonenum").val() );//调用，并且给上面的手机函数传参
    });
    $("#phonenum").focus(function () {
        $("#txt1").fadeIn("slow");
    });
    $("#phonenum").blur(function () {
        $("#txt1").fadeOut(200);

    });


    // 第二次手机验证，验证是否被注册
    $('#phonenum').blur(function () {
        if ($(this).val() == '') return

        var reg =/^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+(\d{8})$/
        if (reg.test( $(this).val() )){ // 符合要求
            // 发起ajax请求　　>>> 　邮箱是否可用　？？？
            $.ajax({
                    url:'/checkutel/',
                    type:'get',
                    data:{'utel': $(this).val()},
                    success:function (response) {

                        console.log(response)
                        $('.tips1').html(response.msg)
                        if (response.status) {   // 可用
                            $("#phonenum").attr({"class": "u-btn-user txtyes"});
                            $(".user").attr({"class": "user yes"});
                            $(".tips1").html("");
                            flag1 = true;
                        } else {    // 不可用
                            $("#phonenum").attr({"class": "u-btn-user txtno"});
                            $(".user").attr({"class": "user no"});
                            $(".tips1").html(response.msg);
                            flag1 = false;
                        }
                    }
            })

        } else {    // 不符合要求
            $("#phonenum").attr({"class": "u-btn-user txtno"});
            $(".user").attr({"class": "user no"});
            $(".tips1").html("手机号不正确");
            flag1 = false;

        }

    })





    //设置密码
    // 定义密码函数
    function password(pwd) {
        if( /(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+).{6,20}/.test(pwd) == false ) {
            //改变输入的提示信息

            $("#pwd").attr({"class": "u-btn-pwd txtno"});//文本框的颜色
            $(".pwd").attr({"class": "pwd no"});//文本框中的图标
            $(".tips2").html("密码不正确");
            flag2 = false;
        } else {
            $("#pwd").attr({"class": "u-btn-pwd txtyes"});
            $(".pwd").attr({"class": "pwd yes"});
            $(".tips2").html("");
            flag2 = true;
        }
    }


    $("#pwd").keyup(function () {
        password( $("#pwd").val() );//调用，并且给密码函数传参
    });
    $("#pwd").focus(function () {
        $("#txt2").fadeIn("slow");
    });
    $("#pwd").blur(function () {
        $("#txt2").fadeOut(200);
    });


    //2次
    function password2(pwd2) {
        if( /(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+).{6,20}/.test(pwd2) == false ) {
            //改变输入的提示信息

            $("#pwd2").attr({"class": "u-btn-pwd txtno"});//文本框的颜色
            $(".pwd2").attr({"class": "pwd no"});//文本框中的图标
            $(".tips3").html("两次密码不正确");
            // flag4 = false;
        } else {
            $("#pwd2").attr({"class": "u-btn-pwd txtyes"});
            // $(".pwd2").attr({"class": "pwd yes"});
            $(".tips3").html("");
            // flag4 = true;
        }
    }

    $("#pwd2").focus(function () {
        $("#txt3").fadeIn("slow");
    });
    $("#pwd").blur(function () {
        $("#txt3").fadeOut(200);
    });
    $("#pwd2").blur(function () {
        var pwd1 = $('#pwd').val()
        var pwd2 = $(this).val()

        if ( pwd1== pwd2 ){   // 符合
            flag4 = true
            $(".pwd2").attr({"class": "pwd2 yes"});
            $(".tips3").html("");
        } else {   // 不符合
            flag4 = false
            $('.tips3').html('两次密码输入不一致')

        }


    });

    //验证码
    //改变验证码
    function checkCode(valCode, code) {
        //验证码不正确
        if( !(valCode == code) ) {
            $("#code").attr({"class": "u-btn-code txtno"});
            $(".code").attr({"class": "code no"});
            $(".tips4").html("验证码不正确");
            flag3 = false;
        } else {
            $("#code").attr({"class": "u-btn-code txtyes"});
            $(".code").attr({"class": "code yes"});
            $(".tips4").html("");
            flag3 = true;
        }
    }
    //两次验证码验证
    var valCode = "";
    $("#code").keyup(function () {
        //获取验证码
        valCode = $("#code2").val();
        checkCode( valCode, $("#code").val() );//传参
    });
    //随机产生验证码
    $(".change").click(function () {
        valCode = parseInt( Math.random()*9000+1000 );
        $("#code2").val(valCode);
    });

    $("#code").focus(function () {
        $("#txt4").fadeIn("slow");
    });
    $("#code").blur(function () {
        $("#txt4").fadeOut(200);
    });
    

    // //短信验证码（未做）
    // function checkMsgCode(msg) {
    // 	if( /^\d{6}$/.test(msg) == false ) {
    // 		//改变输入的提示信息
    //         $("#msg").attr({"class": "u-btn-msg txtno"});//文本框的颜色
    //         $(".msg").attr({"class": "msg no"});//文本框中的图标
    //         $(".tips4").html("短信验证码不正确");
    // 		flag4 = false;
    // 	} else {
    // 		$("#msg").attr({"class": "u-btn-msg txtyes"});
    //         $(".msg").attr({"class": "msg yes"});
    //         $(".tips4").html("");
    // 		flag4 = true;
    // 	}
    // }
    // //输入
    // $("#msg").keyup(function () {
    //     checkMsgCode( $("#msg").val() );//传参
    // });
    // $("#msg").focus(function () {
    //     $("#txt4").fadeIn("slow");
    // });
    // $("#msg").blur(function () {
    //     $("#txt4").fadeOut(200);
    // });
    
    
    //好友校验码
    function checkFrdCode(frdCode) {
    	if( /^[0-9a-zA-Z]{6}$/.test(frdCode) == false) {
    		//改变输入的提示信息
            $("#frd").attr({"class": "u-btn-frd txtno"});//文本框的颜色
            $(".frd").attr({"class": "frd no"});//文本框中的图标
            $(".tips5").html("好友推荐码不正确");
    		flag5 = false;
    	} else {
    		$("#frd").attr({"class": "u-btn-frd txtyes"});
            $(".frd").attr({"class": "frd yes"});
            $(".tips5").html("");
    		flag5 = true;
    	}
    }
    //输入
    $("#frd").keyup(function () {
        checkFrdCode( $("#frd").val() );//传参
    });
    $("#frd").focus(function () {
        $("#txt5").fadeIn("slow");
    });
    $("#frd").blur(function () {
        $("#txt5").fadeOut(200);
    });
   
	

    // //注册
    // $("#reg").click(function () {
    //     //ajax
    //     var xhr = new XMLHttpRequest();
    //     xhr.open("post", "http://127.0.0.1/Go Shopping2/mysite14/php/register.php", true);
    //     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //     var str = "username="+$("#phonenum").val() + "&pwd="+$("#pwd").val();
    //   	console.log(str);//得到正确的值
    //     xhr.send(str);
    //     xhr.onreadystatechange = function () {
    //         if (xhr.readyState==4 && xhr.status==200) {
    //             //console.log(xhr.responseText);
    //             //json解析
    //             var regTxt = JSON.parse(xhr.responseText);
    //             console.log(regTxt);
    //             //判断是否注册成功
		//         if( flag1&&flag2&&flag3&&flag4&&flag5 ) {
		//         	//成功
		//         	if(regTxt.status == 1) {
		//         		alert(regTxt.msg);
		//         		location.href = "login.html";
		//         	}
		//         	//失败
		//         	else {
		//         		alert(regTxt.msg);
		//         	}
		//         }
		//         if(!flag1) {
		//             $(".tips1").html("手机号不正确");
		//         }
		//         if(!flag2) {
		//             $(".tips2").html("密码不正确");
		//         }
		//         if(!flag3) {
		//             $(".tips3").html("验证码不正确");
		//         }
		//         if(!flag4) {
		//             $(".tips4").html("短信验证码不正确");
		//         }
		//         if(!flag5) {
		//             $(".tips5").html("好友推荐码不正确");
		//         }
    //
    //         }
    //     }
    //
    // });

    $('.u-btn-reg').click(function () {
        var isRegister = true   // 默认可以注册
        if (flag1&&flag2&&flag3&&flag4)
        {
            isRegister = true
            $('.u-form').submit()
        }
        else
        {
            isRegister = false

        }

        console.log(isRegister)

    })





































})
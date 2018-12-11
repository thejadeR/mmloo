$(function() {
    var flag1 = false;
    var flag2 = false;
    // //手机号/用户名/邮箱
    // function checkUser(username) {
    //     if(  /^\w[0-9a-zA-Z_]{5,8}$/.test(username) || ( /^1[234578]\d{10}$/.test(username))
    //         ) {
    //         flag1 = false;
    //         $(".username").attr({"class":"username no"});
    //         $("#txt").html("用户名输入不合法");
    //     } else {
    //         flag1 = true;
    //         $(".username").attr({"class":"username yes"});
    //         $("#txt").html("");
    //     }
    // }
    // //用户名
    // $(".username").keyup(function () {
    //     var user = $(".username").val();
    //     checkUser(user);
    //
    // });

        //检查手机号格式
      function mobile(username) {
        // 以13x|15x|18x|开头，+8位数字结尾
        if( /^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+(\d{8})$/.test(username) == false ) {

            //改变输入的提示信息
             flag1 = false;
            $(".username").attr({"class":"username no"});
            $("#txt").html("用户名输入不合法");
        }
        else
            {
               flag1 = true;
                $(".username").attr({"class":"username yes"});
                $("#txt").html("");
            }
    }
    //keyup
    $(".username").keyup(function () {
        mobile( $(".username").val() );//调用，并且给上面的手机函数传参
        checkSub()
    });



    //检查密码格式
    function checkPwd(password) {
        if( (/(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+).{6,20}/).test(password) == false) {
            flag2 = false;
            $(".pwd").attr({"class":"pwd no"});
            $("#pwdtxt").html("密码输入不合法");
        } else {
            flag2 = true;
            $(".pwd").attr({"class":"pwd yes"});
            $("#pwdtxt").html("");
        }
    }
    //kyeup
    $(".pwd").keyup(function () {
        var pwd = $(".pwd").val();
        checkPwd(pwd);
        checkSub()
    });


    function checkSub() {
        if (flag1 && flag2){
            $('.loginbtn').removeAttr('disabled')
        } else {
            $('.loginbtn').attr('disabled', 'disabled')
        }
    }


    //登录
    // $(".loginbtn").click(function () {
    // 	//ajax
    //     var xhr = new XMLHttpRequest();
    //     xhr.open("post", "/static/php/login.php", true);
    //     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    //     var str = "db_utel="+$(".username").val() + "&db_upassword="+$(".pwd").val();
    //     xhr.send(str);
    //     xhr.onreadystatechange = function () {
    //         if (xhr.readyState==4 && xhr.status==200) {
    //
    //             //json解析
    //             var loginTxt = JSON.parse(xhr.responseText);
    //             //判断
		// 		if( !(flag1) ) {
		//             $(".username").addClass("no");
		//             $("#txt").html("用户名输入不合法");
		//         }
		//         else if( !(flag2) ) {
		//             $(".pwd").addClass("no");
		//             $("#pwdtxt").html("密码输入不合法");
		//         }
		//         //登录成功
		//         else if(loginTxt.status == 1) {
    //     			alert(loginTxt.msg);
    //     			window.location.href = "index.html";
    //     		}
    //     		else {
    //     			alert(loginTxt.msg);
    //     		}
    //     	}
    //
    //     }
    //
    //
    // });



})
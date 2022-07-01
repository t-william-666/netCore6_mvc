////-----------------------------------------------------------Login$Reegister 开始start  登录注册页面--------------------------------------------------------------------------
///登录--------------------------------------------------------------------------------
//使用Jquery的Ajax请求
$("#btnLogin").click(function () {
    let getUrl = "/Home/Logining";
    let account = $("#txtLogin").val();
    let password = $("#txtPassword").val();

    $.ajax({
        url: getUrl,
        type: "post",
        headers: {//传送令牌
            RequestVerificationToken: $("#token").val() ////服务配置没有配置标头时，标头的名称则为 RequestVerificationToken
            //"X-XSRF-TOKEN":$("#token").val() ////X-XSRF-TOKEN 为 服务配置的标头，且必须为配置的标头名称；否则请求失败！
        },
        data: {
            account, password
        },
        success: function (da) {
            if (da == "sorry") {
                layer.msg("您输入的密码错误或账号不存在！", {
                    icon: 0
                });
                console.log(da);
            }
            else {
                console.log(da);
                location.href = '/Home/Home';
            }
        },
        error: function (err) {
            console.log(err);
        }
    });
});

var vm1 = new Vue({
    el: "#app",
    data: {
        user: "",
        pass: "",
    },
    methods: {
        ////Vue的Ajax请求
        loginWeb: function () {

            ////请求路径
            //let getUrl = "http://localhost:4460/Home/Logining";
            //axios({
            //    method: "post",
            //    url: getUrl,
            //    params: {
            //        account: this.user,
            //        password: this.pass
            //    }
            //}).then(function (res) {//请求成功
            //    if(res.data=="sorry"){
            //        layer.msg("您输入的密码错误或账号不存在！", {
            //            icon: 0
            //        });
            //        console.log(res.data);
            //    }
            //    else
            //    {
            //        //获取返回内容
            //        console.log(res);
            //        //获取重新定向的路径
            //        console.log( res.request.responseURL);
            //        //location.href=res.request.responseURL;
            //    }
            //}).catch(function (err) {//请求失败
            //    console.log(err);
            //})

            //axios.get(getUrl, {

            //})

            //axios.post(getUrl, {

            //})
        }
    },
    //计算属性
    computed: {

    },
    //监听属性
    watch: {

    },
    //组件属性
    components: {

    }
})

///注册--------------------------------------------------------------------------------

////使用Jquery的Ajax请求
//$("#btnRegister").click(function () {
//    let getUrl = "/Home/Register";
//    let account = $("#txtRegister").val();
//    let password = $("#txtPassword").val();
//    let passwordTrue=$("#txtPasswordTrue").val();


//    $.ajax({
//        url: getUrl,
//        type: "post",
//        headers:{//传送令牌
//             RequestVerificationToken:$("#token").val() ////服务配置没有配置标头时，标头的名称则为 RequestVerificationToken
//             //"X-XSRF-TOKEN":$("#token").val() ////X-XSRF-TOKEN 为 服务配置的标头，且必须为配置的标头名称；否则请求失败！
//        },
//        data: {
//            account, password,passwordTrue
//        },
//        success: function (da) {
//            if (da == "sorry") {
//                console.log(da);
//            }
//            else {
//                console.log(da);
//                location.href='/Home/Home';
//            }
//        },
//        error: function (err) {
//            console.log(err);
//        }
//    });
//});

var vm1 = new Vue({
    el: "#app",
    data: {
        token: "",
        user: "",
        pass: "",
        passtrue: "",
    },
    methods: {
        ////Vue的Ajax请求
        registerWeb: function () {
            //请求路径
            let getUrl = "http://localhost:4460/Home/Register";
            axios({
                method: "post",
                url: getUrl,
                headers: { "RequestVerificationToken": "@requestToken" },
                params: {
                    account: this.user,
                    password: this.pass,
                    passwordTrue: this.passtrue
                }
            }).then(function (res) {//请求成功
                if (res.data == "sorry") {
                    console.log(res.data);
                }
                else {
                    //获取返回内容
                    console.log(res);
                    //获取重新定向的路径
                    console.log(res.request.responseURL);
                    location.href = res.request.responseURL;
                }
            }).catch(function (err) {//请求失败
                console.log(err);
            })

            //axios.get(getUrl, {

            //})

            //axios.post(getUrl, {

            //})
        }
    },
    //计算属性
    computed: {

    },
    //监听属性
    watch: {

    },
    //组件属性
    components: {

    }
})

////-----------------------------------------------------------Login$Reegister 结束end    登录注册页面--------------------------------------------------------------------------
//
//
////-----------------------------------------------------------       home 开始start 主页页面         --------------------------------------------------------------------------
// 控制轮播的速度 2秒跳转到下一张
$('.carousel').carousel({
    interval: 3000
})

// 分页
$('.Page ul li').click(function () {
    // 添加样式
    $(this).addClass('active').siblings().removeClass('active');
})

//收藏
$('.addLike').on('click', function () {
    ////有该类则移除，没有该类则添加
    //$(this).toggleClass('addactive');

    //// hasClass 是判断是否存在该 className 返回的是：bool类型
    if ($(this).hasClass('addactive')) {
        $(this).removeClass('addactive');
        layer.msg('已成功移除该商品收藏', {
            icon: 0
        });
    }
    else {
        $(this).addClass('addactive');
        layer.msg('已成功添加该商品收藏', {
            icon: 6
        });
    }

})

//购物车
$('.addCart').on('click', function () {
    layer.msg('加入购物车成功', {
        icon: 6
    });
})
////-----------------------------------------------------------       home 结束end   主页页面         --------------------------------------------------------------------------
//
//
////-----------------------------------------------------------   Usercenter 开始start 用户中心页面   --------------------------------------------------------------------------
$(function () {
    let finddate = $('#user_birthday').hasClass('user_birthday');
    console.log(finddate)
    if (finddate) {
        //初始化日期插件
        $('.user_birthday').date();
    }
});

$(document).ready(function () {
    var hashID = window.location.hash;
    $("#to-account-info").click();
})
////-----------------------------------------------------------   Usercenter 结束end   用户中心页面   --------------------------------------------------------------------------
//
//
////------------------------------------------------------------Searchshopproduct  开始start  搜索页面--------------------------------------------------------------------------



////------------------------------------------------------------Searchshopproduct  结束end    搜索页面--------------------------------------------------------------------------
//
//
////------------------------------------------------------------Shopdetail   开始start    商家详情页面--------------------------------------------------------------------------



////------------------------------------------------------------Shopdetail   结束end      商家详情页面--------------------------------------------------------------------------
//
//
////-----------------------------------------------------------Productdetail  开始start   商品详情页面--------------------------------------------------------------------------
// 评论添加样式
$('.commsBtn').click(function () {
    let findactive = $(this).parents('.review_details').find('.commentBoxmore').hasClass('in');
    console.log(findactive);
    if (findactive) {
        $(this).removeClass('active');
    } else {
        $(this).addClass('active');
    }
});

//点赞添加样式
$('.likeBtn').click(function () {
    let theclass = $(this).parent('p').find('.likeBtn').hasClass("active");
    let num = $(this).find('.likeNum').text();
    if (theclass) {
        num--
        $(this).removeClass('active')
        $(this).find('.likeNum').text(num);
    } else {
        num++
        $(this).addClass('active');
        $(this).find('.likeNum').text(num);
    }

})


// 用户评论的星级评分
var starNum = 0; //获取星星的数量
var star1 = ""
var star2 = ""
var star3 = ""
var star4 = ""
var star5 = ""
$(function () {
    // 使用点击事件
    $(".star_div ul li").click(function () { //方法二：点击事件
        var _lefts = $(".star_div").offset().left;
        var e = e || window.event;
        var obj = e.pageX;
        var obg = e.pageY;
        let starwidth = 30;
        let n = $(this).index();
        let starPosition = obj - _lefts - n * starwidth;
        if (starPosition < 15) {
            $(this).addClass("half-star").prevAll().removeClass("half-star").next().prevAll()
                .addClass("empty-star")
            n = n + 0.5
            // console.log(n)
        } else {
            $(this).addClass("empty-star").removeClass("half-star").prevAll().removeClass(
                "half-star").next().prevAll().addClass("empty-star")
            n = n + 1
            // console.log(n)
        }
        $(this).nextAll().removeClass("empty-star").removeClass("half-star")
        if (n <= 0.5) {
            $(".commentStar-desc").text("超级烂啊！")
            star1 = "halfstar.png"
            star2 = "fullstar.png"
            star3 = "fullstar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n <= 1) {
            $(".commentStar-desc").text("做工不好哦")
            star1 = "emptystar.png"
            star2 = "fullstar.png"
            star3 = "fullstar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n <= 1.5) {
            $(".commentStar-desc").text("不符合要求")
            star1 = "emptystar.png"
            star2 = "halfstar.png"
            star3 = "fullstar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n <= 2) {
            $(".commentStar-desc").text("质量不怎么满意")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "fullstar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n <= 2.5) {
            $(".commentStar-desc").text("质量稍微有点烂")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "halfstar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n == 3) {
            $(".commentStar-desc").text("质量和外形一般般")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "emptystar.png"
            star4 = "fullstar.png"
            star5 = "fullstar.png"
        } else if (n <= 3.5) {
            $(".commentStar-desc").text("质量还可以吧")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "emptystar.png"
            star4 = "halfstar.png"
            star5 = "fullstar.png"
        } else if (n == 4) {
            $(".commentStar-desc").text("质量还不错哦")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "emptystar.png"
            star4 = "emptystar.png"
            star5 = "fullstar.png"
        } else if (n <= 4.5) {
            $(".commentStar-desc").text("很不错，还可以")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "emptystar.png"
            star4 = "emptystar.png"
            star5 = "halfstar.png"
        } else if (n == 5) {
            $(".commentStar-desc").text("非常好棒极了")
            star1 = "emptystar.png"
            star2 = "emptystar.png"
            star3 = "emptystar.png"
            star4 = "emptystar.png"
            star5 = "emptystar.png"
        }
        starNum = n;
    })
})
////------------------------------------------------------------Productdetail  结束end    商品详情页面--------------------------------------------------------------------------
//
//
////------------------------------------------------------------Cart       开始start        购物车页面--------------------------------------------------------------------------
addPrice();
function addPrice() {
    $(".cart-plus-minus-box").each(function (index) {
        // 当前区域对应的单价
        var p = $(".pro-price").eq(index).text();
        // 当前区域对应的数量
        var n = $(".cart-plus-minus-box").eq(index).val();
        // alert(n + p + index);
        // 返回的是字符串 所以要把￥截取掉 使用substr()截取
        // 截取后还是字符串，用parseFloat转换为数值型
        p = parseFloat(p.substr(1));
        // 保留两位小数点 toFixed(2)
        var price = (p * n).toFixed(2);
        // alert(price);
        // 把计算好的商品总和价放到标签里
        $(".pro-subtotal").eq(index).text("￥" + price);
    })
}

// 1.实现全选按钮控制小按钮
// 1.1 小按钮的状态与全选按钮的状态保持一致 prop()固有属性检测表单是否被选中
$("#checkboxBtnAll").change(function () {
    $(".checkboxBtn, .checkall").prop("checked", $(this).prop("checked"));
    // 改变背景色
    if ($(this).prop("checked")) {
        // 添加类 改变背景色
        $(this).parents(".cart-item").addClass("check-cart-item");
    }
    else {
        // 移除类
        $(this).parents(".cart-item").toggleClass("check-cart-item");
    }
    getSum();
})


// 1.2 小按钮的状态决定全选按钮状态
$(".checkboxBtn").change(function () {
    // if(按钮选中的个数 === 按钮的总个数){
    // 全选选中
    // }else{
    // 不选择全选
    // }
    if ($(".checkboxBtn:checked").length == $(".checkboxBtn").length) {
        $("#checkboxBtnAll").prop("checked", true);
    }
    else {
        $("#checkboxBtnAll").prop("checked", false);
    }
    //重新计算总价
    getSum();
})



// 2.点击+ -按钮来增加和减少商品数量
// 2.1 +添加数量
$(".incs").click(function () {
    // 获取当前 + 的兄弟表单的值
    var n = $(this).siblings(".cart-plus-minus-box").val();
    // 然后点击一次自增——商品数量
    n++;
    // console.log(n);
    // 数量：表单的商品数量
    console.log(n)
    $(this).siblings(".cart-plus-minus-box").val(n);
    // 当前被点击的 + 区域对应的单价
    var p = $(this).parents(".pro-quantity").siblings(".pro-price").text();
    // 返回的是字符串 所以要把￥截取掉 使用substr()截取
    // 截取后还是字符串，用parseFloat转换为数值型
    p = parseFloat(p.substr(1));
    console.log(p);
    // 获取当前的总价
    var price = $(this).parents(".pro-quantity").siblings(".pro-subtotal").text();
    // 去掉￥符号
    price = parseFloat(price.substr(1));
    // 保留两位小数点 toFixed(2)
    price = (p * n).toFixed(2);
    console.log(price);
    // 把计算好的商品总和价放到标签里
    $(this).parents(".pro-quantity").siblings(".pro-subtotal").text("￥" + price);
    //重新计算总价
    getSum();
})
// 2.2 -号减少数量
$(".decs").click(function () {
    // 一定是当前加号的兄弟表单的值自增
    var n = $(this).siblings(".cart-plus-minus-box").val();
    // 商品数量
    n--;
    console.log(n);
    // 三元表达式：判断数量不能小于0
    n = n <= 0 ? 1 : n;
    $(this).siblings(".cart-plus-minus-box").val(n);
    // 当前+号区域的单价
    var p = $(this).parents(".pro-quantity").siblings(".pro-price").text();
    p = parseFloat(p.substr(1));
    console.log(p);
    // 获取当前的总价
    var price = $(this).parents(".pro-quantity").siblings(".pro-subtotal").text();
    // 去掉￥符号
    price = parseFloat(price.substr(1));
    price = (p * n).toFixed(2);
    console.log(price);
    $(this).parents(".pro-quantity").siblings(".pro-subtotal").text("￥" + price);
    //重新计算总价
    getSum();
})


// 3. 这样的话
$(".cart-plus-minus-box").keyup(function () {
    var n = $(this).val();
    //获取当前+号区域的单价
    var p = $(this).parents(".pro-quantity").siblings(".pro-price").text();
    p = parseFloat(p.substr(1));
    //获取当前总价
    var price = $(this).parents(".pro-quantity").siblings(".pro-subtotal").text();
    // 去掉￥符号
    price = parseFloat(price.substr(1));
    price = (p * n).toFixed(2);
    console.log(price);
    $(this).parents(".pro-quantity").siblings(".pro-subtotal").text("￥" + price);
    //重新计算总价
    getSum();
})



// 4.结算总金额函数方法
// 封装一个函数，用来计算小结的内容
function getSum() {
    var totalNumber = 0; // 总件数
    var totalPrice = 0; // 总价钱
    // 遍历car-item所有的表单中的商品数量 累加 算出所有商品的总数量
    $(".cart-plus-minus-box").each(function (i, ele) {
        // 判断 商品对应的按钮是否选中，选中才会结算 不选中不参与结算
        var singleBtn = $(this).parents(".pro-quantity").siblings(".p-checkbox").children(".checkboxBtn");
        if (singleBtn.prop("checked")) {
            totalNumber += parseFloat($(ele).val());
        }
    })
    $(".pro-Number").text(totalNumber);

    // 遍历每个car-item中的商品总计 累加起来算出所有商品价
    $(".pro-subtotal").each(function (i, ele) {
        var singleBtn = $(this).siblings(".p-checkbox").children(".checkboxBtn");
        if (singleBtn.prop("checked")) {
            totalPrice += parseFloat($(ele).text().substr(1));
        }
    })
    $(".pro-sumPrice").text("￥" + totalPrice.toFixed(2));
};
// 5. 删除模块 删除按钮
$(".deleteBtn").click(function () {
    $(".checkboxBtn:checked").parents("tr").remove();
    getSum();
});

////------------------------------------------------------------Cart       结束end          购物车页面--------------------------------------------------------------------------





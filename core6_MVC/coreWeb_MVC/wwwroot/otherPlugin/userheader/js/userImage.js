//弹出框水平垂直居中
(window.onresize = function () {
    var win_height = $(window).height();
    var win_width = $(window).width();
    if (win_width <= 768){
        $(".tailoring-content").css({
            "top": (win_height - $(".tailoring-content").outerHeight())/2,
            "left": 0
        });
    }else{
        $(".tailoring-content").css({
            "top": (win_height - $(".tailoring-content").outerHeight())/2,
            "left": (win_width - $(".tailoring-content").outerWidth())/2
        });
    }
})();

//弹出图片裁剪框
$("#replaceImg").on("click",function () {
    $(".tailoring-container").toggle();
});
//图像上传
function selectImg(file) {
    if (!file.files || !file.files[0]){
        return;
    }
    var reader = new FileReader();
    reader.onload = function (evt) {
        var replaceSrc = evt.target.result;
        //更换cropper的图片
        $('#tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
    }
    reader.readAsDataURL(file.files[0]);
}
//cropper图片裁剪
$('#tailoringImg').cropper({
    aspectRatio: 1/1,//默认比例
    preview: '.previewImg',//预览视图
    guides: false,  //裁剪框的虚线(九宫格)
    autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
    movable: false, //是否允许移动图片
    dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
    movable: true,  //是否允许移动剪裁框
    resizable: true,  //是否允许改变裁剪框的大小
    zoomable: false,  //是否允许缩放图片大小
    mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
    touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
    rotatable: true,  //是否允许旋转图片
    crop: function(e) {
        // 输出结果数据裁剪图像。
    }
});
//旋转
$(".cropper-rotate-btn").on("click",function () {
    $('#tailoringImg').cropper("rotate", 45);
});
//复位
$(".cropper-reset-btn").on("click",function () {
    $('#tailoringImg').cropper("reset");
});
//换向
var flagX = true;
$(".cropper-scaleX-btn").on("click",function () {
    if(flagX){
        $('#tailoringImg').cropper("scaleX", -1);
        flagX = false;
    }else{
        $('#tailoringImg').cropper("scaleX", 1);
        flagX = true;
    }
    flagX != flagX;
});

//裁剪后的处理
$("#sureCut").on("click", function () {
    if ($("#tailoringImg").attr("src") == null) {
        return false;
    } else {
        var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
        var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
        $("#finalImg").prop("src", base64url);//显示为图片的形式
        //将Canvas转换为Blob对象
        var blob = dataURLtoBlob(base64url);
        //Blob对象转换为FormData对象
        var fd = new FormData();
        fd.append("image", blob, "image.png");
        //console.log("blob" + blob);
        //console.log("fd" + fd);
        var changefiles = document.getElementById('chooseImg').files[0];
        changefiles = dataURLtoFile(base64url, new Date().getTime() + ".png");//将剪切的file对象重新赋值给file控件
        //console.log('chooseImg' + document.getElementById('chooseImg').files[0])
        //console.log("change" + changefiles)

        if (changefiles == null) {
            return;
        }
        //获取表单的数据
        var formData = new FormData();
        formData.append('iFormFile', changefiles);
        $.ajax({
            url: "/api/Usercenter/UploadFile",
            type: "post",
            data: formData,
            contentType: false, //jQuery不要去设置Content-Type请求头 contentType默认值为application/x-www-form-urlencoded; charset=UTF-8'。
            processData: false, //processData会默认将data转化为字符串，所以需要配置为false，不进行处理
            success: function (data) {
                if (data == "success") {
                    console.log("上传头像成功");
                } else {
                    console.log(data.msg);
                }
            },
            error: function (data) {
                alert("上传失败")
            }
        });

        //关闭裁剪框
        closeTailor();
    }
});


//dataURL转换为Blob对象
function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], { type: mime });
}

//dataURL转换为File对象
function dataURLtoFile(dataurl, filename) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new File([u8arr], filename, { type: mime });
}

//关闭裁剪框
function closeTailor() {
    $(".tailoring-container").toggle();
}
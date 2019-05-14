﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<%@include file="./common/head.jsp"%>
<body>
<header class="wow fadeInRight"> <img src="images/two.jpg" class="img-circle logo"
		alt="logo" />
  <div class="desc">校园二手交易系统</div>
</header>
<!-- /.container-fluid -->

<div class="container-fluid">
  <div class="row ">
  <!--data-toggle collapse 折叠  ul class =collapse 初始折叠 -->
    <div class="col-md-2 wow slideInDown" id="left"> <a href="#systemSetting"  data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>后台管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span><br/> </a> 
      <!--ul id  和 上面a 标签的id对应 所以能够弹出li -->
      <ul id="systemSetting" class="nav nav-pills nav-stacked collapse ">
        <li><a href="usermanage.jsp"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
        <li><a href="productmanage.jsp"><i class="glyphicon glyphicon-globe"></i>商品管理</a></li>
      </ul>
    </br>
     <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#userSetting"  data-toggle="collapse"> 
        <i class="glyphicon glyphicon-fire"></i> 买家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse in " id="userSetting">
        <li> <a href="mycart.jsp" class="ex0 active"> <i class="glyphicon glyphicon-inbox"></i> 我的购物车</a> </li>
           <li> <a href="product.jsp"> <i class="glyphicon glyphicon-gift"></i> 已买到的商品</a> </li>
        <li> <a href="buy.jsp"> <i class="glyphicon glyphicon-heart"></i> 商品详情</a> </li>
           <li> <a href="user.jsp"> <i class="glyphicon glyphicon-user"></i> 个人资料</a> </li>

      </ul>
    </div>
      </br>
    <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#sellSetting"  data-toggle="collapse"> <i class="glyphicon glyphicon-asterisk"></i> 卖家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse in " id="sellSetting">
        <li class="active"> <a href="publish.jsp" class="ex0 active"> <i class="glyphicon glyphicon-pencil"></i> 发布商品 </a> </li>
           <li > <a href="selling.jsp"> <i class="glyphicon glyphicon-barcode"></i> 出售中的商品</a> </li>
      </ul>
    </div>
      
  </div>
  <!--   折叠结束 -->
  
    <!-- 显示表格数据 -->
    
    <div class=" col-md-8 publish wow fadeInUp" id="right"><!-- 将数据appendTo tbody 定义id -->
      <form class="form-horizontal" action="${APP_PATH}/user/regist"
				method="post">
        <div class="form-group">
          <label  class="col-sm-2">商品名称:</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" id="title" name="title" >
            <span	class="help-block"></span> </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2">商品价格:</label>
          <div class="col-sm-3">
            <input type="text" class="form-control" id="title" name="title" >
            <span	class="help-block"></span> </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2">商品详情:</label>
          <div class="col-sm-7">
            <textarea rows="3" cols="70" name="note"></textarea>
            <span	class="help-block"></span> </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2">商品图片:</label>
          <div class="col-sm-10">
      <input id="file_upload" type="file" class="file" />
          </div>
        </div>
        
        <!-- 发布人ID 隐藏-->
       
        <br/>
        <br/>
        <button type="submit"  class="btn btn-primary  col-sm-2 col-md-offset-2" id="expaddbtn">发布</button>
        
        <button type="reset" class="btn btn-danger col-sm-2 " id="exp_delete_all_btn">重置</button>
      </form>
    </div>
  </div>
</div>
</div>
<script src="js/wow.min.js"></script>
<script>
$(function(){

new WOW().init();
})
</script>
<script>
$("#file_upload").fileinput({

                language: 'zh', //设置语言

                uploadUrl:"http://127.0.0.1/", //上传的地址

               allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀

               //uploadExtraData:{"id": 1, "fileName":'123.mp3'},

                uploadAsync: true, //默认异步上传

                showUpload:true, //是否显示上传按钮

                showRemove :true, //显示移除按钮

                showPreview :true, //是否显示预览

                showCaption:true,//是否显示标题

                browseClass:"btn btn-primary", //按钮样式    

               dropZoneEnabled: true,//是否显示拖拽区域

               //minImageWidth: 50, //图片的最小宽度

               //minImageHeight: 50,//图片的最小高度

               //maxImageWidth: 1000,//图片的最大宽度

               //maxImageHeight: 1000,//图片的最大高度

                //maxFileSize:0,//单位为kb，如果为0表示不限制文件大小

               //minFileCount: 0,

                maxFileCount:10, //表示允许同时上传的最大文件个数

                enctype:'multipart/form-data',

               validateInitialCount:true,

                previewFileIcon: "<iclass='glyphicon glyphicon-king'></i>",

               msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

           }).on("fileuploaded", function (event, data, previewId, index){
 //上传图片后的回调函数，可以在这做一些处理
                 

});
</script>
</body>
</html>

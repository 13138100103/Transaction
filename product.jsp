<%@ page language="java" contentType="text/html; charset=UTF-8"
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
           <li class="active"> <a href="product.jsp"> <i class="glyphicon glyphicon-gift"></i> 已买到的商品</a> </li>
        <li> <a href="buy.jsp"> <i class="glyphicon glyphicon-heart"></i> 商品详情</a> </li>
           <li> <a href="user.jsp"> <i class="glyphicon glyphicon-user"></i> 个人资料</a> </li>

      </ul>
    </div>
      </br>
    <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#sellSetting"  data-toggle="collapse"> <i class="glyphicon glyphicon-asterisk"></i> 卖家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse in " id="sellSetting">
        <li > <a href="publish.jsp" class="ex0 active"> <i class="glyphicon glyphicon-pencil"></i> 发布商品 </a> </li>
           <li > <a href="selling.jsp"> <i class="glyphicon glyphicon-barcode"></i> 出售中的商品</a> </li>
      </ul>
    </div>
      
  </div>
  <!--   折叠结束 -->
  
    <!-- 显示表格数据 -->
  </div>
</div>
</div>

<script src="js/wow.min.js"></script>
<script>
$(function(){

new WOW().init();
})
</script>
</body>
</html>

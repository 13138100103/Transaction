<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <c:set target="${pageContext.request}"
         property="characterEncoding" value="UTF-8"/>
  	<jsp:useBean id="getAllUser"
               class="cc.product.dao.impl.UserDAOImpl" scope="page"/>          
<!doctype html>
<html>
    
<c:if test="${ sessionScope.manager==null }">
        <c:redirect url="/shop.jsp" />
</c:if>

<head>
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>user管理页面</title>
<!--自己的样式-->
<link rel="stylesheet" type="text/css" href="css/backstage.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<!-- Bootstrap -->
<!--fileinput 样式-->
<link rel="stylesheet" type="text/css" href="css/fileinput.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--动画CSS插件-->
<link rel="stylesheet" type="text/css" href="css/animate.min.css">
   <script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/fileinput.js"></script>
<script src="js/zh.js"></script>
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
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
      <ul id="systemSetting" class="nav nav-pills nav-stacked collapse  in ">
        <li class="active"><a href="usermanage.jsp"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
        <li><a href="productmanage.jsp"><i class="glyphicon glyphicon-globe"></i>商品管理</a></li>
      </ul>
    </br>
     <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#userSetting"  data-toggle="collapse"> 
        <i class="glyphicon glyphicon-fire"></i> 买家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse " id="userSetting">
        <li> <a href="mycart.jsp" class="ex0 active"> <i class="glyphicon glyphicon-inbox"></i> 我的购物车</a> </li>
           <liclass="active"> <a href="product.jsp"> <i class="glyphicon glyphicon-gift"></i> 已买到的商品</a> </li>
        <li> <a href="buy.jsp"> <i class="glyphicon glyphicon-heart"></i> 商品详情</a> </li>
           <li> <a href="user.jsp"> <i class="glyphicon glyphicon-user"></i> 个人资料</a> </li>

      </ul>
    </div>
      </br>
    <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#sellSetting"  data-toggle="collapse"> <i class="glyphicon glyphicon-asterisk"></i> 卖家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse" id="sellSetting">
        <li > <a href="publish.jsp" class="ex0 active"> <i class="glyphicon glyphicon-pencil"></i> 发布商品 </a> </li>
           <li > <a href="selling.jsp"> <i class="glyphicon glyphicon-barcode"></i> 出售中的商品</a> </li>
      </ul>
    </div>
      
  </div>
  <!--   折叠结束 -->
  

 <div class=" col-md-8 publish wow fadeInUp" id="right">
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="80">性别</th>
				<th width="120">手机</th>
				<th width="150">邮箱</th>
				<th width="200">地址</th>            
				<th width="80">操作</th>
			</tr>
		</thead>
	<tbody>
	
	               
                       
<c:forEach var="user" items="${getAllUser.AllUser()}">
		<tr>
          <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${user.id}</td>
          <td>${user.name}</td>
          <td>${user.sex}</td>
          <td>${user.phone}</td>
          <td>${user.email}</td>
          <td class="text-l">${user.address}</td>
          <td class="td-manage">
          <a title="删除" href="${pageContext.request.contextPath}/DeleteUser?id=${user.id}"  class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i>删除</a>
          </td>
		</tr>
</c:forEach>		
		
		
      </tbody>
	</table>
   </div>




 </div>
  
  
  
  
  
  
  
  
  
  
  
  
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

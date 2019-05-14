<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set target="${pageContext.request}"
         property="characterEncoding" value="UTF-8"/>
  	<jsp:useBean id="getProduct"
               class="cc.product.dao.impl.ProductDAOImpl" scope="page"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<!-- 让IE采用最新的渲染模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 移动端的页面宽度等于设备宽度，缩放比为1 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/sidebarDemo2.css">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/shop.css">
<!--动画CSS插件-->
<link rel="stylesheet" type="text/css" href="css/animate.min.css">
<title>shop购物界面</title>
</head>
<body>


<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="container"> 
    <!-- 当浏览器大小下于一定程度后的响应式图标-->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <!--设置商标--> 
      <a class="navbar-brand" href="index.jsp">校园二手交易系统</a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
    
   <ul class="nav navbar-nav navbar-right">
    <c:choose> 
      <c:when test="${ sessionScope.user==null }">
       <li><a href="${pageContext.request.contextPath}/login.jsp" >登陆</a></li>
       <li><a href="${pageContext.request.contextPath}/regist.jsp" >注册</a></li>
      </c:when>
        
      <c:when test="${ sessionScope.user!=null }">
      <li><a>欢迎您</a></li>
      <li><a>${sessionScope.user}</a></li>
      <li><a href="/Transaction/LoginOut">退出登录</a>
      </c:when>
      </c:choose>
      
      <li><a href="about.jsp" data-toggle="modal" data-target="#about">关于</a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
  
</nav>
<div id="sidebar">
  <ul>
    <a href="user.jsp"><li id="prof" class="item"> <span class="glyphicon glyphicon-user"> </span>
      <div>我</a> </div>
    </li>
    <a href="mycart.jsp"><li id="asset" class="item"> <span class="glyphicon glyphicon-usd"></span>
      <div>购物车</div></a>
    </li>
    <a href="selling.jsp"><li id="calendar" class="item"> <span class="glyphicon glyphicon-time"></span>
      <div>已购</div></a>
    </li>
    <a href="publish.jsp"><li id="brand" class="item"> <span class="glyphicon glyphicon-heart"> </span>
      <div>发布</div></a>
    </li>
    <a href="selling.jsp"><li id="foot" class="item"> <span class="glyphicon glyphicon-eye-open"> </span>
      <div>出售中</div></a>
    </li>
  </ul>
  <div id="closeBar">
    <span class="glyphicon glyphicon-remove"></span> 
  </div>
</div>

<div class="jumbotron wow slideInDown ">
  <h1>校园二手交易</h1>
  <p >让闲置游起来</p>
  <p><a class="btn btn-primary btn-lg" href="publish.html" role="button">发布商品</a></p>
  <div class="input-group col-sm-3"> <span class="input-group-btn ">
    <button class="btn btn-info" type="button"> 搜 索 </button>
    </span>
    <input type="text" class="form-control" placeholder="Search for...">
  </div>-->
  <!-- /input-group --> 
  
</div>

<!--秒杀板块-->
<div class="container wow slideInDown">
  <div class="row">
<!--     <ul class="nav nav-tabs ">
      <li role="presentation" ><a href="index.jsp">首页</a></li>
      <li role="presentation" class="active"><a href="#" >书籍</a></li>
      <li role="presentation" class="active"><a href="#">数码</a></li>
      <li role="presentation"><a href="#">交通</a></li>
      <li role="presentation"><a href="#">运动</a></li>
      <li role="presentation"><a href="#">盆栽</a></li>
      <li role="presentation"><a href="#">杂货</a></li>
    </ul> -->
   <!--  book  digital  traffic exercise  plant  sundries -->
        <ul class="nav nav-tabs " role="tablist">
      <li role="presentation" ><a href="index.jsp">首页</a></li>
      <li role="presentation" class="active"><a href="#book"role="tab" data-toggle="tab">书籍</a></li>
      <li role="presentation"><a href="#digital"role="tab" data-toggle="tab">数码</a></li>
      <li role="presentation"><a href="#traffic"role="tab" data-toggle="tab">交通</a></li>
      <li role="presentation"><a href="#exercise"role="tab" data-toggle="tab">运动</a></li>
      <li role="presentation"><a href="#plant"role="tab" data-toggle="tab">盆栽</a></li>
      <li role="presentation"><a href="#sundries"role="tab" data-toggle="tab">杂货</a></li>
    </ul>

    <div>
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="book">   
    
<!--     书籍列表 -->
     </br><h1 class="wow slideInDown">书籍列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('书籍')}">
     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">
      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
      </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>
</div>
    <div role="tabpanel" class="tab-pane" id="digital">
    
<!--     数码列表 -->
     </br><h1 class="wow slideInDown">数码列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('数码')}">
     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">

      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
     </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>


</div>
    <div role="tabpanel" class="tab-pane" id="traffic">
   
<!--     交通列表 -->
     </br><h1 class="wow slideInDown">交通列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('交通')}">

     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">

      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
     </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>

</div>
    <div role="tabpanel" class="tab-pane" id="exercise">

<!--     运动列表 -->
     </br><h1 class="wow slideInDown">运动列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('运动')}">

     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">
     <from action="/Transaction/buy.jsp" method="dopost">
      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
     </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>
</div>
    <div role="tabpanel" class="tab-pane" id="plant">

<!--     盆栽列表 -->
     </br><h1 class="wow slideInDown">盆栽列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('盆栽')}">

     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">
     <from action="/Transaction/buy.jsp" method="dopost">
      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
     </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>
</div>
    <div role="tabpanel" class="tab-pane" id="sundries">

<!--     杂物列表 -->
     </br><h1 class="wow slideInDown">杂物列表：</h1></br>
<c:forEach var="product" items="${getProduct.querybycategory('杂物')}">

     <div class="img col-md-4 wow flash " data-wow-duration="1s" data-wow-delay="2s">
     <div class="aa">
     <from action="/Transaction/buy.jsp" method="dopost">
      <a href="#"> <img src="./product/${product.p_picture}"></a></div></br>
      <div class="foot_money "> <span>${product.price}</span> <a href="#" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
      <div class="foot_title ">
        <p>${product.p_name}</p>
     </div>
      <input  onClick="location.href='/Transaction/ProductDetails?id=${product.p_id}'" type="submit" class="btn btn-danger col-md-4 col-sm-offset-2  wow flash"  data-wow-duration="1s" data-wow-delay="2s" id="daoqi" value="购买">
      </div>
</c:forEach>
</div>
  </div>
</div>
    


    
  </div>
  </br>
  
  
  
  
  <h1 class="wow slideInDown" data-wow-duration="1.5s">人气精选<i>Hot:</i></h1>
  </br>
</div>
</br>

<!--秒杀板块 结束--> 
<!--商品列表-->

<div class="container wow slideInDown">
<div class="row">
<c:forEach var="product" items="${getProduct.ProNotSold()}">
  <div class="box">
    <div class="pic"> <img src="./product/${product.p_picture}"/> </div>
    <div class="foot_money "> <span>¥${product.price}</span> <a href="/Transaction/ProductDetails?id=${product.p_id}" class="foot_a"> <span class="glyphicon lyphicon glyphicon-heart-empty">${product.p_hits}</span></a> </div>
    <div class="foot_title ">
      <p>${product.p_name}</p>
    </div>
    </div>
 
  </c:forEach>
  </div>
  
</div>
<!--右侧边栏-->
<div class="right_go">
  <p class="pull-right"><a href="#top">回到顶部</a></p>
</div>
<!--秒杀时间js--> 
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/sidebarDemo2.js"></script>
<!-- <script>
  function GetRTime(){
       var EndTime= new Date('2019/03/10 00:00:00');//这里设置你预定的时间
       var NowTime = new Date();
       var t =EndTime.getTime() - NowTime.getTime();
       var d=Math.floor(t/1000/60/60/24);
       var h=Math.floor(t/1000/60/60%24);
       var m=Math.floor(t/1000/60%60);
       var s=Math.floor(t/1000%60);

       document.getElementById("t_d").innerHTML = d + "天";
       document.getElementById("t_h").innerHTML = h + "时";
       document.getElementById("t_m").innerHTML = m + "分";
       document.getElementById("t_s").innerHTML = s + "秒";
      
}
   setInterval(GetRTime,0);
  


</script>  -->
 <script>
    /*jshint expr: true */
    /*jslint evil: true */  
    window.jQuery || document.write('<script src="components/jquery/dist/jquery.min.js"><\/script>');
    </script>
    
    
<!--关于模态框-->
<div class="modal fade" id="about" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">网站公告</h4>
      </div>
      <div class="modal-body">
        <p>本网站仅用于个人开发学习用途</p>
        <p>如果有发现新的bug，可以扫描以下微信进行反馈</p>
        <img class="feature-image img-rounded" src="product/weixin.jpg" alt="2"> </div>
        <p>当然大部分都不能解决的，毕竟我只是个小菜鸡</p>
        <p>收费教or代做程序设计0.0</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">了解</button>
      </div>
    </div>
  </div>
</div>
    
    
    
    
    
    
    
    
<script>
$(function(){

new WOW().init();
})
</script>
</body>
</html>
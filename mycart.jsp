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
        <li  class="active"> <a href="mycart.jsp" class="ex0 active"> <i class="glyphicon glyphicon-inbox"></i> 我的购物车</a> </li>
           <li> <a href="product.jsp"> <i class="glyphicon glyphicon-gift"></i> 已买到的商品</a> </li>
        <li> <a href="buy.jsp"> <i class="glyphicon glyphicon-heart"></i> 商品详情</a> </li>
           <li> <a href="user.jsp"> <i class="glyphicon glyphicon-user"></i> 个人资料</a> </li>

      </ul>
    </div>
      </br>
    <!--data-toggle collapse 折叠   collapse in 初始不折叠-->
        <div> <a href="#sellSetting"  data-toggle="collapse"> <i class="glyphicon glyphicon-asterisk"></i> 卖家中心<span class="pull-right glyphicon glyphicon-chevron-down"></span> </a> 
      <ul class="nav nav-pills nav-stacked collapse in " id="sellSetting">
        <li> <a href="publish.jsp" class="ex0 active"> <i class="glyphicon glyphicon-pencil"></i> 发布商品 </a> </li>
           <li > <a href="selling.jsp"> <i class="glyphicon glyphicon-barcode"></i> 出售中的商品</a> </li>
      </ul>
    </div>
      
  </div>
  <!--   折叠结束 -->


 <form  action="/Transaction/Buy" method="post">
 <div class=" col-md-8 publish wow fadeInUp" id="right">
  <table id="cartTable">
 <thead>
 <tr>
 <th><label><input class="check-all check" type="checkbox" value="1"/> 全选</label></th>
 <th>商品</th>
 <th>卖家</th>
 <th>小计</th>
 <th>操作</th>
 </tr>
 </thead>
 
 
 <tbody>
 
     <c:forEach var="product" items="${sessionScope.pro}">
 <tr>
 <td class="checkbox"><input class="check-one check" type="checkbox" value="1" /></td>
 <td class="goods"><img src="./product/${product.p_picture}" alt="" /><span>${product.p_name}</span></td>
 <td>${product.p_soler}</td>
 <td class="subtotal">${product.price}</td>
 <td class="operation"><span class="delete">删除</span></td>
 </tr>
     </c:forEach>

 
 </tbody>
</table>
<div class="foot" id="foot">
 <label class=" fl select-all"><input type="checkbox" class="check-all check" /> 全选</label>
 <a class="fl delete" id="deleteAll" href="javascript:;" rel="external nofollow" >删除</a>
<div class="fr closing" id="clickme"><input type="submit" value="结算" style="width:90px"></div>
 <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
 <div class="fr select" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
 <div class="selected-view">
 <div id="selectedViewList" class="clearfix">
 <div><img src="images/1.jpg"><span>取消选择</span></div>
 </div>
 <span class="arrow">◆<span>◆</span></span>
 </div>
</div>
</div>

</form>
    <!-- 显示表格数据 -->
  </div>
</div>
</div>


<script>
var cartTable = document.getElementById('cartTable');
 var tr = cartTable.children[1].rows;//获取table下的tbody下的每一行
 var checkInputs = document.getElementsByClassName('check');
 var checkAllInputs = document.getElementsByClassName('check-all');
 var selectedTotal = document.getElementById('selectedTotal');
 var priceTotal = document.getElementById('priceTotal');
 //计算总数和价格
 function getTotal(){
 var selected = 0;
 var price = 0;
 for(var i=0;i < tr.length; i++){
 if(tr[i].getElementsByTagName('input')[0].checked){
  selected += parseInt(tr[i].getElementsByTagName('input')[0].value);
  price += parseFloat(tr[i].cells[3].innerHTML);//cells属性为获得tr下面的td
 }
 }
 selectedTotal.innerHTML = selected;
 priceTotal.innerHTML = price.toFixed(2);//保留两位小数
 }
 for(var i=0;i<checkInputs.length;i++){
 checkInputs[i].onclick = function(){
 if(this.className === 'check-all check'){//如果点击的是全选按钮，则使所有按钮的状态和它相同
  for(var j=0;j<checkInputs.length;j++){
  checkInputs[j].checked = this.checked;
  }
 }
 if(this.checked == false){//如果其中一个变为未选中状态，则使全选按钮取消选中
  for(var i=0;i<checkAllInputs.length;i++){
  checkAllInputs[i].checked = false;
  }
 }
 getTotal();
 }
 }

</script>


<script src="js/wow.min.js"></script>
<script>
$(function(){

new WOW().init();
})
</script>
</body>
</html>

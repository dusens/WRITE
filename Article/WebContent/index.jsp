<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.ArticleService"%>
<% ArticleService articleService = new ArticleService(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="common/taglib.jsp"%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="static/js/jQuery.js"></script>
<link href="static/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--头部区域 -->
<%@include file="common/header.jsp" %>
	<!-- <div class="header">
		<div class="logo">原创文字</div>
		<ul>
			<li class="first"><a href="javascript:void(0)">首页</a></li>
			<li><a href="javascript:void(0)">原创故事</a></li>
			<li><a href="javascript:void(0)">热门专题</a></li>
			<li><a href="javascript:void(0)"> 欣赏美文</a></li>
			<li><a href="javascript:void(0)">赞助</a></li>
		</ul>
		<div class="login">
			<span><a href="javascript:void(0)">登陆</a></span>
			<span></span>
			<span><a href="javascript:void(0)">注册</a></span>
		</div>
	</div> -->
	
	
<!--banner区域  -->
	<div class="banner">
		<div class='content'>
        <ul>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/5.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/1.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/2.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/3.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/4.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/5.png"/>
                </a>
            </li>
            <li class='fl'>
                <a href="javascript:void(0)">
                    <img src="static/img/1.png"/>
                </a>
            </li>
        </ul>
        
        <span class='banner_left'><i class='btn_left'></i></span>
        <span class='banner_right'><i class='btn_right'></i></span> 
    </div>
</div>

<!-- 内容区域（待做） -->
<div style='border:1px solid #ccc'>
    <br/><br/>
    <div class='category'>
        <div class='title'>连载小说</div>
        <ul class='items'>
            <li class='item'>
            	<div class="item-banner">
            		<div class="item-header">生活中的那些过往</div>
            		<div class="item-name">那些错过了的爱情</div>
            		<div class="item-author">@鱼鱼鱼 著</div>
            	</div>
            	<div class="item-description">那些回忆，那些事情</div>
            </li>
            <li class='item'></li>
            <li class='item'></li>
            <div style='clear:both'></div>
        </ul>
    </div>
    <%
		//查询出编程代码类的相关文章
		List<Map<String,Object>>  articles2 = articleService.getArticlesByCategoryId(2, 0, 6);
		pageContext.setAttribute("articles2", articles2);
	%>
    <div class='category'>
		<div class='title'>编程代码类</div>
		<ul class='items'>
			<c:forEach items="${articles2}" var="item">
				<li class='item'>
					<div class='item-banner'>
						<div class='item-header'>${item.header}</div>
						<div class='item-name' title = "${item.name}">${item.name}</div>
						<div class='item-author'>@${item.author} 著</div>
					</div>
					<div class='item-description'>${item.description}</div>
				</li>
			</c:forEach>
			<div style='clear:both'></div>
		</ul>
	</div>
	
	<div class='category'>
		<div class='title'>干货分享</div>
		<ul class='items'>
			<li class='item'></li>
			<li class='item'></li>
			<li class='item'></li>
			<div style='clear:both'></div>
		</ul>
	</div>

</div>

	
<!-- 底部页面 -->
<%@include file="common/footer.jsp" %>
<script>
        var leftBtn = $('.btn_left').eq(0);//坐按钮
        var ul = $('.banner .content ul').eq(0);
        var rightBtn = $('.btn_right').eq(0);//右按钮
        var index = 0;
        var timer = null;

        var imgwidth = $('.banner .content ul li').width();  //获取轮播图片的宽度
        var len =  $('.banner .content ul li').length-2//获取总共的图片数量
        rightBtn.on('click',function(){
            clearTimeout(timer); //定时器清零
            timer = setTimeout(function(){
                index ++;
                movePicture();
            },500);

        });

        //上一张
        leftBtn.on('click',function(){
            clearTimeout(timer); //定时器清零
            timer = setTimeout(function(){
                index --;
                movePicture();
            },500);
        });

        //移动图片
        function movePicture(){
            $('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
                if(index == len){
                    $(this).css('margin-left',-imgwidth);
                    index = 0;
                }
                if(index == -1){
                    $(this).css('margin-left',-imgwidth * len);
                    index = len - 1;
                }
            });
        }

    </script>
</body>
</html>
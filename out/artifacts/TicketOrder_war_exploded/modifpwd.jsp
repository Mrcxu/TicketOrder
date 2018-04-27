<%@ page import="java.util.List" %>
<%@ page import="my.dao.TicketDao" %>
<%@ page import="my.model.UserModel" %>
<%@ page import="my.dao.UserDao" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>机票预订系统_修改密码</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>

<div class="site-bg"></div>
<div class="site-bg-overlay"></div>

<!-- TOP HEADER -->
<div class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <p class="phone-info"> 欢迎用户：<a class="show-5 " href="#"><%
                    request.setCharacterEncoding("utf-8");
                    String uuid =request.getParameter("uuid");
                    UserDao userDao=new UserDao();
                    UserModel userModel =userDao.userId(uuid);
                    String name =userModel.getName();
                    if(name==null){
                        response.sendRedirect("index.html");
                    }
                    out.print(name);
                %></a>登陆本站！<a href="index.html">退出登录</a></p>
            </div>
        </div>
    </div>
</div> <!-- .top-header -->

<div class="visible-xs visible-sm responsive-menu">
    <a href="#" class="toggle-menu">
        <i class="fa fa-bars"></i> Show Menu
    </a>
</div>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >免费模板</a></div>
<div class="container" id="page-content">
    <div class="row">
        <div class="col-md-12 col-sm-12 content-holder">
            <div id="menu-container">
                <div class="homepage home-section text-center">
                    <div class="welcome-text">
                        <h2><strong>---个人信息修改---</strong></h2>
                        <div class="row">
                            <form action="login.do?method=5&name=<%=name%>" method="post">
                                <input type="text" name="account" style="color:#9d9d9d;" placeholder="用户名" required value="<%=name%>"disabled="disabled">
                                <input type="password" name="pwd" id="pwd" placeholder="请输入修改密码.." required>
                                <input type="password" name="pwd1" id="pwd1" placeholder="请再次输入密码.." required >
                                <div class="send-button w3layouts agileits">

                                    &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
                                    <%--<a href="/modif.do?name=<%out.print(name);%>&id=<%=id%>&method=1"style="font-weight: bolder;font-size: larger;border: black">确认预定</a>--%>
                                    <input type="submit" value="确认修改" >
                                </div>
                                <br><br><a href="main.jsp?uuid=<%out.print(uuid);%>"style="font-weight: bolder;font-size: larger;border: black">返回查询</a>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div >
</div>
<!-- SITE-FOOTER -->
<div style="position: relative;
  z-index: 11;
  padding: 14px 0;
  background: rgba(0, 0, 0, 0.7);
  margin-top: 30%;" >
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <p>Copyright &copy; 2084 Company Name | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>
        </div>
    </div>
</div> <!-- .site-footer -->

<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>

</body>
</html>



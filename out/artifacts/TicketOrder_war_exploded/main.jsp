<%@ page import="my.dao.TicketDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="my.dao.UserDao" %>
<%@ page import="my.model.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>在线机票预订系统_TickOrderSystem</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <script type="text/javascript" src="js/calendar.js" charset="utf-8"></script>
</head>
<script>
    function ss()
    {
        if(document.form1.stime.value==""||document.form1.etime.value=="")
        {
            alert("请选择起飞时间和抵达时间！");
            return;
        }else{
            document.form1.submit();
        }
    }
</script>
<style>
    .aaaa a {
                 color: #fff;
                 -webkit-transition: all 150ms ease-in-out;
                 -moz-transition: all 150ms ease-in-out;
                 -ms-transition: all 150ms ease-in-out;
                 -o-transition: all 150ms ease-in-out;
                 transition: all 150ms ease-in-out;
                 text-decoration: none !important;
             }
    .aaaa a:hover {
        color: #5cb48e;
    }
    input[type="button"]:hover {
        background-color: #000;
        border: 1px solid #FFF;
        color: #FFF;
        transition:0.5s all;
        -webkit-transition:0.5s all;
        -moz-transition:0.5s all;
        -o-transition:0.5s all;
        -ms-transition:0.5s all;
        text-decoration: none;
    }
    input[type="button"] {
        width: 15%;
        padding: 10px 0;
        font-size: 16px;
        font-weight: 100;
        background-color: transparent;
        color: #5cb48e;
        border: 1px solid rgba(238, 238, 238, 0.41);
        border-width: thin;
        cursor: pointer;
        outline: none;
        transition:0.5s all;
        -webkit-transition:0.5s all;
        -moz-transition:0.5s all;
        -o-transition:0.5s all;
        -ms-transition:0.5s all;
        text-decoration: none;
    }

</style>
<%
    TicketDao ticketDao =new TicketDao();
    List list =ticketDao.getALLSPLACE();
%>
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
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-rss"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- .top-header -->

        <div class="visible-xs visible-sm responsive-menu">
            <a href="#" class="toggle-menu">
                <i class="fa fa-bars"></i> Show Menu
            </a>
            <div class="show-menu">
                <ul class="main-menu">
                    <li>
                        <a class="show-1 active homebutton" href="#"><i class="fa fa-map-marker"></i>航班查询</a>
                    </li>
                    <li>
                        <a class="show-2 aboutbutton" href="#"><i class="fa fa-paper-plane"></i>国内机票</a>
                    </li>
                    <li>
                        <a class="show-3 projectbutton" href="#"><i class="fa fa-paper-plane-o"></i>国际机票</a>
                    </li>
                    <li>
                        <a class="show-5 contactbutton" href="#"><i class="fa fa-user"></i>个人中心</a>
                    </li>
                </ul>
            </div>
        </div>
		<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >免费模板</a></div>
        <div class="container" id="page-content">
            <div class="row">
                <div class="col-md-9 col-sm-12 content-holder">
                    <div id="menu-container">
                        <div class="logo-holder logo-top-margin">
                            <a href="#" class="site-brand"><img src="images/logo.png" alt=""></a>
                        </div>
                        
                        
                        <div id="menu-1" class="homepage home-section text-center">
                            <div class="welcome-text">
                                <form action="info.jsp?uuid=<%out.print(uuid);%>" method="post" class="subscribe-form" name="form1">
                                    <h2><strong>---航班信息查询---</strong></h2>
                                    <div class="row">
                                                    <p style="float: left"><strong>飞行航线</strong></p>
                                                        <select name=splace class="email" style="color: black;float: right">
                                                        <%for(int i=0;i<list.size();i++){%>
                                                        <option value="<%=list.get(i).toString() %>"><%=list.get(i).toString() %></option>
                                                        <%} %>
                                                        </select>
                                            <br>
                                                    <p style="float: left"><strong>起飞时间</strong></p>

                                                        <input placeholder="点击选择时间..."style="color: black;float: right" class="email"maxLength=24 size=30 name=stime readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>
                                            <br>
                                                    <p style="float: left"><strong>抵达时间</strong></p>

                                                        <input placeholder="点击选择时间..."style="color: black;float: right" class="email" maxLength=24 size=30 name=etime readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>

                                    </div>
                                    <br>
                                    <input   type="button"  value="查询" onclick="return ss()">
                                    <p class="subscribe-text">Please subscribe your information!</p>
                                </form>
                            </div>
                        </div>

                        <div id="menu-2" class="content about-section">
                            <div class="welcome-text">
                                <h2><i class="fa fa-spinner fa-spin"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <strong>---国内航班信息---</strong>
                                </h2>
                                <div class="row">
                                    <table  cellSpacing=0 cellPadding=0 width="100%" border="5" style="font-weight: bolder;font-size: 14px">
                                        <tbody>
                                        <tr >
                                            <td width="5%" align="center">序号</td>
                                            <td  align="center">类型</td>
                                            <td  align="center">航线</td>
                                            <td  align="center">起飞时间</td>
                                            <td  align="center">到达时间</td>
                                            <td  align="center">航空公司</td>
                                            <td  align="center">成人票价</td>
                                            <td  align="center">儿童票价</td>
                                            <td  align="center">会员价格</td>
                                            <td  align="center">余票</td>
                                            <td  align="center">预定</td>
                                        </tr>
                                        <%
                                            String sql1="select * from plane where type='国内航线' order by id desc";
                                            List list1=ticketDao.getSHB(sql1);
                                            System.out.println(list1);
                                            if(!list1.isEmpty()){
                                                for(int i=0;i<list1.size();i++){
                                                    List listt=(List)list1.get(i);
                                        %>
                                        <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'">
                                            <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(1).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(2).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(3).toString()%></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(4).toString()%></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(5).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt.get(6).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(7).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(8).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt.get(9).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><a href="yuding.jsp?id=<%=listt.get(0).toString()%>&uuid=<%=uuid%>">预定</a></td>
                                        </tr>
                                        <%}} %>
                                        </tbody>
                                    </table>
                                    <br><br><div class="aaaa"><a href="main.jsp?uuid=<%out.print(uuid);%>"style="font-weight: bolder;font-size: 20px;border: black;margin: auto">返回查询</a></div>
                                </div>
                            </div>
                        </div>

                        <div id="menu-3" class="content gallery-section">
                            <div class="welcome-text">
                                <h2><i class="fa fa-spinner fa-spin"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <strong>---国际航班信息---</strong>
                                </h2>
                                <div class="row">
                                    <table  cellSpacing=0 cellPadding=0 width="100%" border="5"style="font-weight: bolder;font-size: 14px">
                                        <tbody>
                                        <tr >
                                            <td width="5%" align="center">序号</td>
                                            <td  align="center">类型</td>
                                            <td  align="center">航线</td>
                                            <td  align="center">起飞时间</td>
                                            <td  align="center">到达时间</td>
                                            <td  align="center">航空公司</td>
                                            <td  align="center">成人票价</td>
                                            <td  align="center">儿童票价</td>
                                            <td  align="center">会员价格</td>
                                            <td  align="center">余票</td>
                                            <td  align="center">预定</td>
                                        </tr>
                                        <%
                                            String sql2="select * from plane where type='国际航线' order by id desc";
                                            List list2=ticketDao.getSHB(sql2);
                                            System.out.println(list2);
                                            if(!list2.isEmpty()){
                                                for(int i=0;i<list2.size();i++){
                                                    List listt=(List)list2.get(i);
                                        %>
                                        <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'">
                                            <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(1).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(2).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(3).toString()%></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(4).toString()%></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(5).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt.get(6).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(7).toString() %></td>
                                            <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt.get(8).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt.get(9).toString() %></td>
                                            <td align="center"   style="border-bottom:1px dotted #ccc;"><a href="yuding.jsp?id=<%=listt.get(0).toString()%>&uuid=<%=uuid%>">预定</a></td>
                                        </tr>
                                        <%}} %>
                                        </tbody>
                                    </table>
                                    <br><br><div class="aaaa"><a href="main.jsp?uuid=<%out.print(uuid);%>"style="font-weight: bolder;font-size: 20px;border: black;margin: auto">返回查询</a></div>
                                </div>
                            </div>
                        </div>

                        <div id="menu-4" class="content contact-section">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="box-content">
                                        <h3 class="widget-title"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;预订管理</h3>
                                        <table  cellSpacing=0 cellPadding=0 width="100%" border="5" style="font-size: 12px">
                                            <tbody>
                                            <tr style="color: black;font-weight: bolder" >
                                                <td width="5%" align="center">序号</td>
                                                <td  align="center">类型</td>
                                                <td  align="center">航线</td>
                                                <td  align="center">起飞时间</td>
                                                <td  align="center">到达时间</td>
                                                <td  align="center">航空公司</td>
                                                <td  align="center">成人票价</td>
                                                <td  align="center">儿童票价</td>
                                                <td  align="center">会员票价</td>
                                                <td  align="center">购买票数</td>
                                                <td  align="center">购买时间</td>
                                                <td  align="center">修改</td>
                                                <td  align="center">退订</td>
                                            </tr>
                                            <%
                                                String sql3="select * from yuding where username='"+name+"' order by id desc";
                                                List list3=ticketDao.getTicket(sql3 );
                                                System.out.println(list3);
                                                if(!list3.isEmpty()){
                                                    for(int i=0;i<list3.size();i++){
                                                        List listt1=(List)list3.get(i);
                                            %>
                                            <tr   style="color: black;font-weight: bolder">
                                                <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(1).toString() %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(2).toString() %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(3).toString()%></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(4).toString()%></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(5).toString() %></td>
                                                <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt1.get(6).toString() %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(7).toString() %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(8).toString() %></td>
                                                <td align="center"  style="border-bottom:1px dotted #ccc;"><%=listt1.get(9).toString() %></td>
                                                <td align="center"   style="border-bottom:1px dotted #ccc;"><%=listt1.get(11).toString() %></td>
                                                <td align="center"   style="border-bottom:1px dotted #ccc;"><a href="modif.jsp?id=<%=listt1.get(0).toString()%>&uuid=<%=uuid%>">修改</a></td>
                                                <td align="center"   style="border-bottom:1px dotted #ccc;"><a href="/modif.do?id=<%=listt1.get(0).toString()%>&name=<%=name%>&method=3">退订</a></td>
                                            </tr>
                                            <%}} %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="box-content">
                                        <h3 class="widget-title"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;个人管理</h3>
                                        <br>
                                        <p style="text-align: left;font-weight: bolder;"><span class="fa fa-user-circle"></span>&nbsp;用户名:&nbsp;&nbsp;&nbsp;<span><%out.print(name);%></span></p>
                                        <br><br>
                                        <p style="text-align: left;font-weight: bolder;"><span class="fa fa-key"></span>&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;&nbsp;<span>******（已设置）</span></p>
                                        <br><br>
                                        <p style="text-align: left;font-weight: bolder;"><span class="fa fa-envelope-o"></span>&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;&nbsp;<span><%out.print(userModel.getEmail());%></span></p>
                                        <br><br>
                                        <p style="text-align: left;font-weight: bolder;"><span class="fa fa-phone"></span>&nbsp;手机号:&nbsp;&nbsp;&nbsp;<span><%out.print(userModel.getPhone());%></span></p>
                                        <br><br>
                                        <p style="text-align: center;"><a href="sendConfirmMail.jsp?uuid=<%=uuid%>" style="font-weight: bolder;">修改个人信息</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="col-md-3 hidden-sm">
                    
                    <nav id="nav" class="main-navigation hidden-xs hidden-sm">
                        <ul class="main-menu">
                            <li>
                                <a class="show-1 active homebutton" href="#"><i class="fa fa-map-marker"></i>航班查询</a>
                            </li>
                            <li>
                                <a class="show-2 aboutbutton" href="#"><i class="fa fa-paper-plane"></i>国内机票</a>
                            </li>
                            <li>
                                <a class="show-3 projectbutton" href="#"><i class="fa fa-paper-plane-o"></i>国际机票</a>
                            </li>
                            <li>
                                <a class="show-5 contactbutton" href="#"><i class="fa fa-user"></i>个人中心</a>
                            </li>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>

        <!-- SITE-FOOTER -->
        <div class="site-footer">
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
		<!-- templatemo 439 rectangle -->
    </body>
</html>
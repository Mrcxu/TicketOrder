<%@ page import="java.util.List" %>
<%@ page import="my.dao.TicketDao" %>
<%@ page import="my.dao.UserDao" %>
<%@ page import="my.model.UserModel" %><%--
  Created by IntelliJ IDEA.
  User: Iloved
  Date: 2018/1/5
  Time: 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>机票预订系统_查询结果</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

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
</div>


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
                            <h2><strong>---航班信息查询结果---</strong></h2>
                            <div class="row">
                    <table  cellSpacing=0 cellPadding=0 width="100%" border="5">
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
                            TicketDao ticketDao = new TicketDao();
                            String splace=request.getParameter("splace");
                            String stime=request.getParameter("stime");
                            String etime=request.getParameter("etime");
                            String sql="select * from plane where splace ='"+splace+"' and stime = '"+stime+"' and etime = '"+etime+"' order by id desc";
                            List list2=ticketDao.getSHB(sql);
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
                                <br><br><a href="main.jsp?uuid=<%out.print(uuid);%>"style="font-weight: bolder;font-size: larger;border: black">返回查询</a>
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



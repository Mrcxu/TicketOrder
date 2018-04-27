package my.servlet;

import my.connection.Database;
import my.dao.TicketDao;
import my.dao.UserDao;
import my.model.TicketModel;
import my.model.UserModel;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketServlet extends HttpServlet {
    private Connection connection;
    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int method = Integer.parseInt(req.getParameter("method"));
        if (method == 1) {

            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String id = req.getParameter("id");
            TicketDao ticketDao=new TicketDao();
            TicketModel ticketModel=ticketDao.ticket(id);
            int piaoshu = Integer.parseInt(req.getParameter("piaoshu"));
            int a[]=ticketDao.insertandUpdateTicket(ticketModel,piaoshu,name);
            PrintWriter out = resp.getWriter();
            System.out.println(piaoshu);
            if(piaoshu<ticketModel.getNum()){
                if(a[0]!=0&&a[1]!=0){
                    UserDao userDao =new UserDao();
                    UserModel userModel = userDao.user(name);
                    String uuid=userModel.getUuid();
                    out.print("<script language=javascript>alert('机票预定成功！');window.location.href='main.jsp?uuid="+uuid+"';</script>");
                }else if(a[0]!=0&&a[1]==0){
                    out.print("<script language=javascript>alert('修改异常，请重新操作！');history.go(-1);</script>");
                }else if(a[0]==0){
                    out.print("<script language=javascript>alert('插入异常，请重新操作！');history.go(-1);</script>");
                }
            }else {
                out.print("<script language=javascript>alert('余票不足，请重新操作！');history.go(-1);</script>");
            }
        }
        else  if (method == 2) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String id = req.getParameter("id");
            int piaoshu = Integer.parseInt(req.getParameter("piaoshu"));
            TicketDao ticketDao = new TicketDao();
            int buynum[]=ticketDao.getbuynum(id);
            int pid = buynum[1];
            int oldnum=buynum[0];
            int newnum=oldnum-piaoshu;
            TicketModel ticketModel = ticketDao.ticket(pid);
            PrintWriter out =resp.getWriter();
            if(piaoshu<ticketModel.getNum()){
                int a[]=ticketDao.updateandUpdateTicket(ticketModel,piaoshu,newnum,id);
                if(a[0]!=0&&a[1]!=0){
                    UserDao userDao =new UserDao();
                    UserModel userModel = userDao.user(name);
                    String uuid=userModel.getUuid();
                    out.print("<script language=javascript>alert('机票预订票数修改成功！');window.location.href='main.jsp?uuid="+uuid+"';</script>");
                }else if(a[0]!=0&&a[1]==0){
                    out.print("<script language=javascript>alert('修改异常，请重新操作！');history.go(-1);</script>");
                }else if(a[0]==0){
                    out.print("<script language=javascript>alert('修改异常，请重新操作！');history.go(-1);</script>");
                }
            }else {
                out.print("<script language=javascript>alert('余票不足，请重新操作！');history.go(-1);</script>");
            }


        }
        else if (method == 3) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String id = req.getParameter("id");
            System.out.println("退订");
            TicketDao ticketDao = new TicketDao();
            int num[] = ticketDao.getbuynum(id);
            int[] a = ticketDao.deleteandUpdateTicket(id,num[0],num[1]);
            PrintWriter out = resp.getWriter();
            if(a[0]!=0&&a[1]!=0){
                UserDao userDao =new UserDao();
                UserModel userModel = userDao.user(name);
                String uuid=userModel.getUuid();
                out.print("<script language=javascript>alert('机票退订成功！');window.location.href='main.jsp?uuid="+uuid+"';</script>");
            }else if(a[0]!=0&&a[1]==0){
                out.print("<script language=javascript>alert('修改异常，请重新操作！');history.go(-1);</script>");
            }else if(a[0]==0){
                out.print("<script language=javascript>alert('退订异常，请重新操作！');history.go(-1);</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

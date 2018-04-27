package my.servlet;

import my.dao.UserDao;
import my.model.UserModel;
import my.tool.SendMail;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int method = Integer.parseInt(req.getParameter("method"));
        if (method == 1) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("account");
            String password = req.getParameter("password");
            UserModel user = new UserModel();
            user.setName(name);
            user.setPassword(password);
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.userLogin(user);
            if (a == 0) {
                UserModel userModel = userDao.user(name);
                String uuid=userModel.getUuid();
                out.print("<script language=javascript>alert('用户登录成功！');window.location.href='main.jsp?uuid=" + uuid + "';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('您输入的用户不存在，请重新输入！');history.go(-1);</script>");
            } else if (a == 2) {
                out.print("<script language=javascript>alert('您输入的密码有误，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('登录异常，请重新输入！');history.go(-1);</script>");
            }
        } else if (method == 2) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String password = req.getParameter("pwd");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            UserModel user = new UserModel();
            user.setName(name);
            user.setPassword(password);
            user.setEmail(email);
            user.setPhone(phone);
            UUID uuid = UUID.randomUUID();
            String userid = uuid.toString().replaceAll("-", "");
            user.setUuid(userid);
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.userInsert(user);
            if (a == 0) {
                out.print("<script language=javascript>alert('用户注册成功！请重新登录！');window.location.href='index.html';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('注册异常，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('用户名已存在，请重新输入！');history.go(-1);</script>");
            }
        } else if (method == 3) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String password = req.getParameter("pwd");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            UserModel user = new UserModel();
            user.setName(name);
            user.setPassword(password);
            user.setEmail(email);
            user.setPhone(phone);
            System.out.println(name);
            System.out.println(password);
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.userUpdate(user);
            if (a == 0) {
                out.print("<script language=javascript>alert('用户数据修改成功！请重新登录！');window.location.href='index.html';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('修改异常，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('用户名已存在，请重新输入！');history.go(-1);</script>");
            }
        } else if (method == 4) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("account");
            String email = req.getParameter("email");
            UserModel user = new UserModel();
            user.setName(name);
            user.setEmail(email);
            System.out.println(user.getName() + user.getEmail() + "!!!!!!!!!!!!!!!!!");
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.confirmEmail(user);
            UserModel userModel = userDao.user(name);
            if (a == 0) {
                SendMail sendMail = new SendMail();
                sendMail.sendForgotPwd(userModel);
                out.print("<script language=javascript>alert('验证邮件已发往你的邮箱，请登录邮箱验证！');window.location.href='index.html';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('您输入的用户不存在，请重新输入！');history.go(-1);</script>");
            } else if (a == 2) {
                out.print("<script language=javascript>alert('您输入的邮箱有误，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('登录异常，请重新输入！');history.go(-1);</script>");
            }
        } else if (method == 5) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("name");
            String password = req.getParameter("pwd");
            String repassword =req.getParameter("pwd1");
            UserModel user = new UserModel();
            user.setName(name);
            user.setPassword(password);
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.changepwd(user);
            if (!password.equals(repassword)){
                out.print("<script language=javascript>alert('两次密码不一致，请重新输入！');history.go(-1);</script>");
                return;
            }
            if (a == 0) {
                out.print("<script language=javascript>alert('用户密码修改成功！请重新登录！');window.location.href='index.html';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('修改异常，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('用户名已存在，请重新输入！');history.go(-1);</script>");
            }
        } else if (method == 6) {
            resp.setContentType("text/html;charset=UTF-8");
            String name = req.getParameter("account");
            String email = req.getParameter("email");
            UserModel user = new UserModel();
            user.setName(name);
            user.setEmail(email);
            PrintWriter out = resp.getWriter();
            UserDao userDao = new UserDao();
            int a = userDao.confirmEmail(user);
            UserModel userModel = userDao.user(name);
            if (a == 0) {
                SendMail sendMail = new SendMail();
                sendMail.sendConfirmEmail(userModel);
                out.print("<script language=javascript>alert('验证邮件已发往你的邮箱，请登录邮箱验证！');window.location.href='index.html';</script>");
            } else if (a == 1) {
                out.print("<script language=javascript>alert('您输入的用户不存在，请重新输入！');history.go(-1);</script>");
            } else if (a == 2) {
                out.print("<script language=javascript>alert('您输入的邮箱有误，请重新输入！');history.go(-1);</script>");
            } else {
                out.print("<script language=javascript>alert('登录异常，请重新输入！');history.go(-1);</script>");
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

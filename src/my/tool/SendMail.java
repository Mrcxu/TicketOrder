package my.tool;

        import my.model.UserModel;

        import javax.mail.Authenticator;
        import javax.mail.PasswordAuthentication;
        import javax.mail.Session;
        import javax.mail.Transport;
        import javax.mail.internet.InternetAddress;
        import javax.mail.internet.MimeMessage;
        import java.util.Date;
        import java.util.Properties;


public class SendMail {

    private static final String FROM = "17326789365@163.com";

    public static void sendForgotPwd(UserModel user) {
        Session session = getSession();
        String title ="【在线机票预订_忘记密码】您好！客户："+user.getName()+"，验证邮箱成功！";
        String txt="<h1>【在线机票预订系统_TicketOrderSystem】</h1><h2>欢迎使用在线机票预订个人管理服务，您已成功验证了邮箱，请点击下方链接前往修改密码页面。</h2><br><p>http://localhost:8080/modifpwd.jsp?uuid="+user.getUuid()+"</p><br><span><b>如点击无法前往，请复制网址到地址栏前往！</b></span>";
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject(title);
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setContent(txt,"text/html;charset=utf-8");
            System.out.println(txt);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void sendConfirmEmail(UserModel user) {
        Session session = getSession();
        String title ="【在线机票预订_验证邮箱】您好！客户："+user.getName()+"，验证邮箱成功！";
        String txt="<h1>【在线机票预订系统_TicketOrderSystem】</h1><h2>欢迎使用在线机票预订个人管理服务，您已成功验证了邮箱，请点击下方链接前往修改个人信息页面。</h2><br><p>http://localhost:8080/modifuser.jsp?uuid="+user.getUuid()+"</p><br><span><b>如点击无法前往，请复制网址到地址栏前往！</b></span>";
        MimeMessage message = new MimeMessage(session);
        try {
            message.setSubject(title);
            message.setSentDate(new Date());
            message.setFrom(new InternetAddress(FROM));
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setContent(txt,"text/html;charset=utf-8");
            System.out.println(txt);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Session getSession() {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.163.com");
        props.setProperty("mail.smtp.port", "25");
        props.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, "EMMMMMM123");
            }

        });
        return session;
    }
}
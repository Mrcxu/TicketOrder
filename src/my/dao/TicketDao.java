package my.dao;

import my.connection.Database;
import my.model.TicketModel;
import sun.security.krb5.internal.Ticket;

import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class TicketDao {

    private Connection connection;
    private List list;
    public List getALLSPLACE(){
        String sql="select splace from plane order by id desc";
        connection = Database.getConnection();
        list =new ArrayList();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            while(rs.next()){
                list.add(rs.getString(1));
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return list;
        }finally{
            Database.releaseConnection(connection);
        }
    }
    public List getSHB(String sql){
        connection = Database.getConnection();
        list =new ArrayList();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            while(rs.next()){
                List list2=new ArrayList();
                list2.add(rs.getString(1));
                list2.add(rs.getString(2));
                list2.add(rs.getString(3));
                list2.add(rs.getString(4));
                list2.add(rs.getString(5));
                list2.add(rs.getString(6));
                list2.add(rs.getString(7));
                list2.add(rs.getString(8));
                list2.add(rs.getString(9));
                list2.add(rs.getString(10));
                list.add(list2);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return list;
        }finally{
            Database.releaseConnection(connection);
        }
    }
    public List getTicket(String sql){
        connection = Database.getConnection();
        list =new ArrayList();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            while(rs.next()){
                List list2=new ArrayList();
                list2.add(rs.getString(1));
                list2.add(rs.getString(2));
                list2.add(rs.getString(3));
                list2.add(rs.getString(4));
                list2.add(rs.getString(5));
                list2.add(rs.getString(6));
                list2.add(rs.getString(7));
                list2.add(rs.getString(8));
                list2.add(rs.getString(9));
                list2.add(rs.getString(10));
                list2.add(rs.getString(11));
                list2.add(rs.getString(12));
                list.add(list2);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return list;
        }finally{
            Database.releaseConnection(connection);
        }
    }

    public TicketModel ticket(String id){
        connection = Database.getConnection();
        String sql = "select * from plane where id='"+id+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            TicketModel ticket;
            rs.next();
            ticket =new TicketModel();
            ticket.setCompany(rs.getString("company"));
            ticket.setCprice(rs.getString("cprice"));
            ticket.setEtime(rs.getString("etime"));
            ticket.setId(rs.getString("id"));
            ticket.setMprice(rs.getString("mprice"));
            ticket.setNum(rs.getInt("num"));
            ticket.setSplace(rs.getString("splace"));
            ticket.setType(rs.getString("type"));
            ticket.setPid(rs.getInt("pid"));
            ticket.setStime(rs.getString("stime"));
            ticket.setPrice(rs.getString("price"));
            return ticket;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }
    public TicketModel ticket(int pid){
        connection = Database.getConnection();
        String sql = "select * from plane where pid='"+pid+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            TicketModel ticket;
            rs.next();
            ticket =new TicketModel();
            ticket.setCompany(rs.getString("company"));
            ticket.setCprice(rs.getString("cprice"));
            ticket.setEtime(rs.getString("etime"));
            ticket.setId(rs.getString("id"));
            ticket.setMprice(rs.getString("mprice"));
            ticket.setNum(rs.getInt("num"));
            ticket.setSplace(rs.getString("splace"));
            ticket.setType(rs.getString("type"));
            ticket.setPid(rs.getInt("pid"));
            ticket.setStime(rs.getString("stime"));
            ticket.setPrice(rs.getString("price"));
            return ticket;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }
    public  int[] getbuynum(String id){
        connection = Database.getConnection();
        String sql = "select * from yuding where id='"+id+"'";
        int a= 0;
        int b =0;
        int []num={a,b};
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            a = rs.getInt("buynum");
            b = rs.getInt("pid");
            num[0]=a;
            num[1]=b;
            return num;
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            Database.releaseConnection(connection);
        }
        return num;
    }

    public int[] deleteandUpdateTicket(String id,int num1,int num2) {
        connection = Database.getConnection();
        String sql1 = "delete from yuding where id='"+id+"'";
        String sql2 ="update plane set num=num+"+num1+" WHERE pid="+num2;
        int a= 0;
        int b =0;
        int[]c = {a,b};
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            a = ps.executeUpdate(sql1);
            b = ps.executeUpdate(sql2);
            c[0]=a;
            c[1]=b;
            return c;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            Database.releaseConnection(connection);
        }
    return c;
    }

    public int[] insertandUpdateTicket(TicketModel ticketModel,int num,String name) {
        connection = Database.getConnection();
        System.out.println(ticketModel.getCompany()+name);
        String sql1 = "INSERT INTO yuding(type,splace,stime,etime,company,price,cprice,mprice,buynum,username,buytime,pid) VALUES('"+ticketModel.getType()+"','"+ticketModel.getSplace()
                +"','"+ticketModel.getStime()+"','"+ticketModel.getEtime()+"','"+ticketModel.getCompany()+"','"+ticketModel.getPrice()+"','"+ticketModel.getCprice()+"','"+ticketModel.getMprice()
                +"','"+num+"','"+name+"',now(),'"+ticketModel.getPid()+"');";
        String sql2 ="update plane set num=num-"+num+" WHERE id="+ticketModel.getId();
        int a= 0;
        int b =0;
        int[]c = {a,b};
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            a = ps.executeUpdate(sql1);
            b = ps.executeUpdate(sql2);
            c[0]=a;
            c[1]=b;
            return c;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            Database.releaseConnection(connection);
        }
        return c;
    }
    public int[] updateandUpdateTicket(TicketModel ticketModel,int num,int newnum,String id) {
        connection = Database.getConnection();
        String sql1 = "UPDATE yuding set buynum="+num+" WHERE id="+id;
        String sql2 ="update plane set num=num+"+newnum+" WHERE id="+ticketModel.getId();
        int a= 0;
        int b =0;
        int[]c = {a,b};
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            a = ps.executeUpdate(sql1);
            b = ps.executeUpdate(sql2);
            c[0]=a;
            c[1]=b;
            return c;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return c;
    }




}

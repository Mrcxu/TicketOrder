package my.dao;

import my.connection.Database;
import my.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao{

    private Connection connection;
    public int userLogin(UserModel model) {
        connection = Database.getConnection();
        String sql = "select * from user where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getName());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(!rs.getString("password").equals(model.getPassword())){
                    return 2;
                }else {
                    return 0;
                }
            }else {
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return 3;
    }
    public int userInsert(UserModel model) {
        connection = Database.getConnection();
        String sql = "INSERT INTO user(username,password,email,phone,uuid) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getName());
            ps.setString(2,model.getPassword());
            ps.setString(3,model.getEmail());
            ps.setString(4,model.getPhone());
            ps.setString(5,model.getUuid());
            int  n= ps.executeUpdate();
            if(n!=0){
                return 0;
            }else {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return 2;
    }
    public UserModel user(String username){
        connection = Database.getConnection();
        String sql = "select * from user where username='"+username+"'";
        try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                UserModel userModel;
                rs.next();
                userModel =new UserModel();
                userModel.setName(rs.getString("username"));
                userModel.setPassword(rs.getString("password"));
                userModel.setPhone(rs.getString("phone"));
                userModel.setEmail(rs.getString("email"));
                userModel.setUuid(rs.getString("uuid"));
                return userModel;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            } finally {
                Database.releaseConnection(connection);
            }
    }
    public UserModel userId(String uuid){
        connection = Database.getConnection();
        String sql = "select * from user where uuid='"+uuid+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            UserModel userModel;
            rs.next();
            userModel =new UserModel();
            userModel.setUuid(rs.getString("uuid"));
            userModel.setPassword(rs.getString("password"));
            userModel.setPhone(rs.getString("phone"));
            userModel.setEmail(rs.getString("email"));
            userModel.setName(rs.getString("username"));
            return userModel;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }
    public int userUpdate(UserModel model) {
        connection = Database.getConnection();
        String sql = "Update user SET password=?,email=?,phone=? WHERE username=? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getPassword());
            ps.setString(2,model.getEmail());
            ps.setString(3,model.getPhone());
            ps.setString(4,model.getName());
            int  n= ps.executeUpdate();
            if(n!=0){
                return 0;
            }else {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return 2;
    }
    public int confirmEmail(UserModel model) {
        connection = Database.getConnection();
        String sql = "select * from user where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getName());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(!rs.getString("email").equals(model.getEmail())){
                    return 2;
                }else {
                    return 0;
                }
            }else {
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.releaseConnection(connection);
        }
        return 3;
    }

    public int changepwd(UserModel model) {
            connection = Database.getConnection();
            String sql = "Update user SET password=? WHERE username=? ";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1,model.getPassword());
                ps.setString(2,model.getName());
                int  n= ps.executeUpdate();
                if(n!=0){
                    return 0;
                }else {
                    return 1;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                Database.releaseConnection(connection);
            }
            return 2;
        }
    }


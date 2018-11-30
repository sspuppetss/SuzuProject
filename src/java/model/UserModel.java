/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Surya
 */
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import entity.Users;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserModel {
    Connection conn = null;
    public UserModel(){
        conn = (Connection) new Koneksi().getKoneksi();
    }
    public List<Users> getAll(){
        List<Users> listUser  = new ArrayList<Users>();
        try {
            String query = "SELECT * FROM tb_user order by username desc";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Users u  = new Users();
                u.setId_user(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                listUser.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUser;
    }
    
    public Users getDetail(int id){
        Users u  = new Users();
        try {
            String query = "SELECT * FROM tb_users WHERE id_user=?";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, id);
         
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setId_user(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

}
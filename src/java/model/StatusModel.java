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
import entity.Status;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatusModel {
    Connection conn = null;
    public StatusModel(){
        conn = (Connection) new Koneksi().getKoneksi();
    }
    public List<Status> getAll(){
        List<Status> listStatus  = new ArrayList<Status>();
        try {
            String query = "SELECT * FROM tb_status order by nama desc";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Status s  = new Status();
                s.setId_status(rs.getInt(1));
                s.setNama(rs.getString(2));
                listStatus.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listStatus;
    }
    
    public Status getDetail(int id){
        Status s  = new Status();
        try {
            String query = "SELECT * FROM tb_status WHERE id_status=?";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, id);
         
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s.setId_status(rs.getInt(1));
                s.setNama(rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
    
    public String insert(Status s){
        String info="";
        try {          
            String query="INSERT INTO tb_status VALUES(?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, s.getId_status());
            ps.setString(2, s.getNama());
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {
            info = ex.getMessage();
        }
        return info;
    }

    public String update(int id, Status s){
        String info = "";
        try {          
            String query="UPDATE tb_status SET id_status=?, nama=? WHERE id_status=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, s.getId_status());
            ps.setString(2, s.getNama());
            ps.setInt(3, id);
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {
            info = ex.getMessage();
        }
        return info;
    }
    
    public String delete(int id){
        String info = "";
        try {          
            String query="DELETE FROM tb_status WHERE id_status=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {            
            info = ex.getMessage();
        }
        return info;
    }
}
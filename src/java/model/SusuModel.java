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
import entity.Susu;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SusuModel {
    Connection conn = null;
    public SusuModel(){
        conn = (Connection) new Koneksi().getKoneksi();
    }
    public List<Susu> getAll(){
        List<Susu> listSusu  = new ArrayList<Susu>();
        try {
            String query = "SELECT * FROM tb_susu order by nama desc";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Susu s  = new Susu();
                s.setId_susu(rs.getInt(1));
                s.setNama(rs.getString(2));
                s.setVol_liter(rs.getInt(3));
                s.setHarga(rs.getInt(4));
                listSusu.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSusu;
    }
    
    public Susu getDetail(int id){
        Susu s  = new Susu();
        try {
            String query = "SELECT * FROM tb_susu WHERE id_susu=?";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, id);
         
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                s.setId_susu(rs.getInt(1));
                s.setNama(rs.getString(2));
                s.setVol_liter(rs.getInt(3));
                s.setHarga(rs.getInt(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
    
    public String insert(Susu s){
        String info="";
        try {          
            String query="INSERT INTO tb_susu VALUES(?,?,?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, s.getId_susu());
            ps.setString(2, s.getNama());
            ps.setInt(3, s.getVol_liter());
            ps.setInt(4, s.getHarga());
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {
            info = ex.getMessage();
        }
        return info;
    }

    public String update(int id, Susu s){
        String info = "";
        try {          
            String query="UPDATE tb_susu SET id_susu=?, nama=?, vol_liter=?, harga=? WHERE id_susu=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, s.getId_susu());
            ps.setString(2, s.getNama());
            ps.setInt(3, s.getVol_liter());
            ps.setInt(4, s.getHarga());
            ps.setInt(5, id);
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
            String query="DELETE FROM tb_susu WHERE id_susu=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {            
            info = ex.getMessage();
        }
        return info;
    }
    public int jmldata(){
        int x  = 0;
        try {
            String query = "SELECT count(*) FROM tb_susu";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                x=rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
}
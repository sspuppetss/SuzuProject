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
import entity.Paket;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaketModel {
    Connection conn = null;
    public PaketModel(){
        conn = (Connection) new Koneksi().getKoneksi();
    }
    public List<Paket> getAll(){
        List<Paket> listPaket  = new ArrayList<Paket>();
        try {
            String query = "SELECT * FROM tb_paket inner join tb_susu on tb_paket.id_susu = tb_susu.id_susu order by tb_paket.nama desc";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Paket p  = new Paket();
                p.setId_paket(rs.getInt(1));
                p.setNama(rs.getString(2));
                p.setId_susu(rs.getInt(3));
                p.setJml_susu(rs.getInt(4));
                p.setHarga(rs.getInt(5));
                p.setNama_susu(rs.getString(7));
                listPaket.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listPaket;
    }
    
    public Paket getDetail(int id){
        Paket p  = new Paket();
        try {
            String query = "SELECT * FROM tb_paket inner join tb_susu on tb_paket.id_susu = tb_susu.id_susu WHERE id_paket=?";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, id);
         
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                p.setId_paket(rs.getInt(1));
                p.setNama(rs.getString(2));
                p.setId_susu(rs.getInt(3));
                p.setJml_susu(rs.getInt(4));
                p.setNama_susu(rs.getString(7));
                p.setHarga(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
    public String insert(Paket p){
        String info="";
        try {          
            String query="INSERT INTO tb_paket VALUES(?,?,?,?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, p.getId_paket());
            ps.setString(2, p.getNama());
            ps.setInt(3, p.getId_susu());
            ps.setInt(4, p.getJml_susu());
            ps.setInt(5, p.getHarga());
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {
            info = ex.getMessage();
        }
        return info;
    }

    public String update(int id, Paket p){
        String info = "";
        try {          
            String query="UPDATE tb_paket SET id_paket=?, nama=?, id_susu=?, jml_susu=?,harga=? WHERE id_paket=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, p.getId_paket());
            ps.setString(2, p.getNama());
            ps.setInt(3, p.getId_susu());
            ps.setInt(4, p.getJml_susu());
            ps.setInt(5, p.getHarga());
            ps.setInt(6, id);
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
            String query="DELETE FROM tb_paket WHERE id_paket=?";
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
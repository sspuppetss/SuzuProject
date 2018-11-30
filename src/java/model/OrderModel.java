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
import entity.Order;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderModel {
    Connection conn = null;
    public OrderModel(){
        conn = (Connection) new Koneksi().getKoneksi();
    }
    public List<Order> getAll(){
        List<Order> listOrder  = new ArrayList<Order>();
        try {
            String query = "SELECT * FROM tb_order order by no_order desc";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
         
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Order o  = new Order();
                o.setId_order(rs.getInt(1));
                o.setNo_order(rs.getInt(2));
                o.setId_paket(rs.getInt(3));
                o.setTgl_order(rs.getDate(4));
                o.setId_status(rs.getInt(5));
                o.setTot_harga(rs.getInt(6));
                listOrder.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listOrder;
    }
    
    public Order getDetail(int id){
        Order o  = new Order();
        try {
            String query = "SELECT * FROM tb_order WHERE id_order=?";
            PreparedStatement ps =(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, id);
         
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                o.setId_order(rs.getInt(1));
                o.setNo_order(rs.getInt(2));
                o.setId_paket(rs.getInt(3));
                o.setTgl_order(rs.getDate(4));
                o.setId_status(rs.getInt(5));
                o.setTot_harga(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }
    
    public String insert(Order o){
        String info="";
        try {          
            String query="INSERT INTO tb_order VALUES(?,?,?,?,?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareCall(query);
            ps.setInt(1, o.getId_order());
            ps.setInt(2, o.getNo_order());
            ps.setInt(3, o.getId_paket());
            ps.setDate(4, (Date) o.getTgl_order());
            ps.setInt(5, o.getId_status());
            ps.setInt(6, o.getTot_harga());
            ps.executeUpdate();
            info = "success";
        } catch (SQLException ex) {
            info = ex.getMessage();
        }
        return info;
    }

    public String update(int id, Order o){
        String info = "";
        try {          
            String query="UPDATE tb_order SET id_order=?, no_order=?, id_paket=?, tgl_order=?, id_status=?, tot_harga=? WHERE id_order=?";
            java.sql.PreparedStatement ps= conn.prepareCall(query);
            ps.setInt(1, o.getId_order());
            ps.setInt(2, o.getNo_order());
            ps.setInt(3, o.getId_paket());
            ps.setDate(4, (Date) o.getTgl_order());
            ps.setInt(5, o.getId_status());
            ps.setInt(6, o.getTot_harga());
            ps.setInt(7, id);
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
            String query="DELETE FROM tb_order WHERE id_order=?";
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
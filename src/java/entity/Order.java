/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Surya
 */
public class Order {
    private int id_order;
    private int no_order;
    private int id_paket;
    private Date tgl_order;
    private int id_status;
    private int tot_harga;
    private String nama_status;

    public String getNama_status() {
        return nama_status;
    }

    public void setNama_status(String nama_status) {
        this.nama_status = nama_status;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getNo_order() {
        return no_order;
    }

    public void setNo_order(int no_order) {
        this.no_order = no_order;
    }

    public int getId_paket() {
        return id_paket;
    }

    public void setId_paket(int id_paket) {
        this.id_paket = id_paket;
    }

    public Date getTgl_order() {
        return tgl_order;
    }

    public void setTgl_order(Date tgl_order) {
        this.tgl_order = tgl_order;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public int getTot_harga() {
        return tot_harga;
    }

    public void setTot_harga(int tot_harga) {
        this.tot_harga = tot_harga;
    }

    public void setNama(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}

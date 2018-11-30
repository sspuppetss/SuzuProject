/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Surya
 */
public class Paket {
    private int id_paket;
    private String nama;
    private int id_susu;
    private int jml_susu;
    private String nama_susu;
    private int harga;

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }
    
    public String getNama_susu() {
        return nama_susu;
    }

    public void setNama_susu(String nama_susu) {
        this.nama_susu = nama_susu;
    }

    public int getId_paket() {
        return id_paket;
    }

    public void setId_paket(int id_paket) {
        this.id_paket = id_paket;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getId_susu() {
        return id_susu;
    }

    public void setId_susu(int id_susu) {
        this.id_susu = id_susu;
    }

    public int getJml_susu() {
        return jml_susu;
    }

    public void setJml_susu(int jml_susu) {
        this.jml_susu = jml_susu;
    }
    
}

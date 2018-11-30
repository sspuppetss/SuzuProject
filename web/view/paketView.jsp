<%@page import="entity.Paket"%>
<%@page import="entity.Susu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_layout/_meta.jsp"%>     
        <%@include file="_layout/_css.jsp"%>     
        <% String title = (String) request.getAttribute("t"); %>
        <title><% out.println(title);%></title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="_layout/_nav.jsp"%> 
            <%@include file="_layout/_sidebar.jsp"%>             
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>&nbsp;&nbsp;<% out.println(title);%></h2>   
                        </div>
                    </div>              
                    <hr /> 
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                        <a href="PaketInsert" style="margin-bottom: 10px;" class="btn btn-primary">Add Paket</a>
                            <table id="example" class="table table-striped table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nama</th>
                                    <th class="text-center">Susu</th>
                                    <th class="text-center">Jumlah Susu</th>
                                    <th class="text-center">Harga</th>
                                    <th class="text-center">Ubah</th>
                                    <th class="text-center">Hapus</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%!int i = 0;%>          
                                <%
                                Object obj=request.getAttribute("listPaket");
                                List<Paket> listPaket=(List)obj;
                                for(Paket p : listPaket){%>
                                    <tr>
                                        <td><%= ++i %></td>
                                        <td><%=p.getId_paket() %></td>
                                        <td><%=p.getNama() %></td>
                                        <td><%=p.getNama_susu() %></td>
                                        <td><%=p.getJml_susu() %></td>
                                        <td><%=p.getHarga() %></td>
                                        <td><a href="PaketEdit?id=<%=p.getId_paket()%>">Ubah</a></td>
                                        <td><a href="PaketDelete?id=<%=p.getId_paket()%>">Hapus</a></td>
                                    </tr>
                                <%}%>
                            </tbody>
                            <tfoot>                                
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nama</th>
                                    <th class="text-center">Susu</th>
                                    <th class="text-center">Jumlah Susu</th>
                                    <th class="text-center">Harga</th>
                                    <th class="text-center">Ubah</th>
                                    <th class="text-center">Hapus</th>
                                </tr>
                            </tfoot>
                            </table>
                        </div>
                    </div>                        
                    <%@include file="_layout/_footer.jsp"%> 
                </div>
            </div>
        </div>
        <%@include file="_layout/_js.jsp"%> 
        <%@include file="_layout/_jsDT.jsp"%> 
    </body>
</html>
        
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
                            <a href="SusuInsert" style="margin-bottom: 10px;" class="btn btn-primary">Add Susu</a>
                            <table id="example" class="table table-striped table-bordered table-hover text-center">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nama</th>
                                    <th class="text-center">Volume (Liter)</th>
                                    <th class="text-center">Harga</th>
                                    <th class="text-center">Ubah</th>
                                    <th class="text-center">Hapus</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%!int i = 0;%>
                                <%
                                Object obj=request.getAttribute("listSusu");
                                List<Susu> listSusu=(List)obj;
                                for(Susu s : listSusu){%>
                                    <tr>
                                        <td><%= ++i %></td>
                                        <td><%=s.getId_susu() %></td>
                                        <td><%=s.getNama() %></td>
                                        <td><%=s.getVol_liter() %></td>
                                        <td><%=s.getHarga() %></td>
                                        <td><a href="SusuEdit?id=<%=s.getId_susu()%>">Ubah</a></td>
                                        <td><a href="SusuDelete?id=<%=s.getId_susu()%>">Hapus</a></td>
                                    </tr>
                                    <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nama</th>
                                    <th class="text-center">Volume (Liter)</th>
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
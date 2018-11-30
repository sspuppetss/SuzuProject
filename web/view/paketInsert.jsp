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
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                        <form class="form" action="PaketInsert" method="POST">
                            <table class="form-group">
                                <tr>
                                    <td class="col-md-1">
                                        <label>ID</label>
                                    </td>
                                    <td>
                                        <input type="text" name="id" class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Nama</label>
                                    </td>
                                    <td>
                                        <input type="text" name="nama" class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Susu</label>
                                    </td>
                                    <td>
                                        <select style="margin-bottom: 15px;" id="susu" name="id_susu" onchange="t()" class="form-control">
                                    <%
                                    Object ls=request.getAttribute("listSusu");
                                    List<Susu> listSusu=(List)ls;
                                    for(Susu s : listSusu){
                                        out.println("<option value=\""+s.getId_susu()+"\">"+s.getNama()+"</option>");
                                    };%>
                                        </select>                                        
                                        <select hidden id="h" name="id_susu">
                                            <%
                                    for(Susu s : listSusu){
                                        out.println("<option value=\""+s.getId_susu()+"\">"+s.getHarga()+"</option>");
                                    };%>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1" >
                                        <label>Jumlah</label>
                                    </td>
                                    <td>
                                        <input id="jml" type="text" name="jml_susu" class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1" >
                                        <label>Harga</label>
                                    </td>
                                    <td>
                                        <input id="hrg" type="text" name="harga" class="form-control" disabled required/><br/>
                                    </td>
                                </tr>         
                                    <script>
                                        function t(){ 
                                        $("#susu").change(function(){
                                            $("#h").val($("#susu").val());    
                                            var p = $("#h option:selected").text()*$("#jml").val();
                                            $("#hrg").val(p);                                   
                                        });
                                        $("#jml").change(function(){
                                            $("#h").val($("#susu").val());    
                                            var p = $("#h option:selected").text()*$("#jml").val();
                                            $("#hrg").val(p);                                   
                                        });
                                    }
                                        </script>
                                <tr>
                                    <td colspan="2" class="text-right">
                                        <input type="submit" value="Tambah" class="btn btn-primary"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        </div>
                    </div>   
                    <%@include file="_layout/_footer.jsp"%> 
                </div>
            </div>
        </div>
        <%@include file="_layout/_js.jsp"%> 
    </body>
</html>
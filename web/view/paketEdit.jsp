<%@page import="entity.Susu"%>
<%@page import="java.util.List"%>
<%@page import="entity.Paket"%>
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
    <%
    String id = request.getParameter("id").toString();
    Object obj = request.getAttribute("p");
    Paket p = (Paket)obj;
    %>
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
                    <hr/>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                        <form action="PaketEdit?id=<%= id %>" class="form form-group" method="POST">
                            <table>
                                <tr>
                                    <td class="col-md-1">
                                        <label>ID</label>
                                    </td>
                                    <td>
                                        <input type="text" name="idBaru" value="<%= p.getId_paket()%>" class="form-control" onkeypress="return pronim(event)" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                <td class="col-md-1">
                                    <label>Nama</label>
                                </td>
                                    <td>
                                        <input type="text" name="namaBaru" value="<%= p.getNama() %>" class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Susu</label>
                                    </td>
                                    <td>
                                        <select style="margin-bottom: 15px;" id="susu" onchange="t()" name="susuBaru" class="form-control">
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
                                    <td class="col-md-1">
                                        <label>Jumlah Susu</label>
                                    </td>
                                    <td>
                                        <input type="text" onchange="t()" id="jml" name="jmlBaru" value="<%= p.getJml_susu() %>"class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Harga</label>
                                    </td>
                                    <td>
                                        <input type="text" id="hrg" name="hargaBaru" value="<%= p.getHarga() %>" class="form-control" disabled/><br/>
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
                                        <input type="submit" value="Simpan" class="btn btn-primary"/>
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
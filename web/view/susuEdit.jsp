<%@page import="entity.Susu"%>
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
    Object obj = request.getAttribute("s");
    Susu s = (Susu)obj;
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
                        <form action="SusuEdit?id=<%= id %>" class="form form-group" method="POST">
                            <table>
                                <tr>
                                    <td class="col-md-1">
                                        <label>ID</label>
                                    </td>
                                    <td>
                                        <input type="text" name="idBaru" value="<%= s.getId_susu()%>" class="form-control" onkeypress="return pronim(event)" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                <td class="col-md-1">
                                    <label>Nama</label>
                                </td>
                                    <td>
                                        <input type="text" name="namaBaru" value="<%= s.getNama() %>" class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Volume(Liter)</label>
                                    </td>
                                    <td>
                                        <input type="text" name="volBaru" value="<%= s.getVol_liter()%>"class="form-control" required/><br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-1">
                                        <label>Harga</label>
                                    </td>
                                    <td>
                                        <input type="text" name="hargaBaru" value="<%= s.getHarga()%>"class="form-control" required/><br/>
                                    </td>
                                </tr>
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
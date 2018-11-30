<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="_layout/_meta.jsp" %>
        <link href="css/login.css" rel="stylesheet" />
        <title>Login</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form">             
                <form action="Login" method="post">
                    <div class="login-form">
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="login-form">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <div>
                        <input class="button" type="submit" value="Login">
                    </div>
                </form>
                <p class="message"><a href="Dashboard">Kembali</a></p>
            </div>
        </div>
    </body>
</html>
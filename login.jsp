

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PSAS | Login</title>
    </head>
    <body>
        <a href="index.html">Home</a>
        <h2>Login</h2>
        <form name="loginForm" method="POST" action="j_security_check">
            <p>Username: <input type="text" name="j_username" size="20"/></p>
            <p>Password: <input type="password" size="20" name="j_password"/></p>
            <p><input type="submit" value="Submit"/></p>
        </form>
    </body>
</html>

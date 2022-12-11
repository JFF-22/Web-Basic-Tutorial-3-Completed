

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PSAS | Login</title>
    </head>
    <body>
        <h1>You have successfully logged-in</h1>
        <%= request.getRemoteUser() %>
        <%
        if (request.isUserInRole("administrator")){
            response.sendRedirect("administrator.jsp");
        }
        %>
    </body>
</html>


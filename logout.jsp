<%-- 
Mini Project 
Yeo Ewe Wen 20DDT20F1016
Ngu Ming Henn 20DDT20F1006
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PSAS</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
         %>
    </body>
</html>

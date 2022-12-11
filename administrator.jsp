

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "PSAS";
            String userid = "root";
            String password = "";
            
            try{
                Class.forName(driver);
            }
            catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PSAS | Administrator</title>
    </head>
    <body>
        <a href="index.html">Home</a><br>
        <a href="logout.jsp">Log Out</a>
        <h1>PSAS | Administrator</h1>
        <table border="1">
            <tr>
                <td>No.</td>
                <td>Name</td>
                <td>IC Number</td>
                <td>Registration Number</td>
                <td>Address</td>
                <td>Education Institution</td>
                <td>Mother Name</td>
                <td>Mother IC Number</td>
                <td>Father Name</td>
                <td>Father IC Number</td>
                <td>Monthly Income</td>
                <td colspan="2">Action</td>
            </tr>
            <%
                try{
                    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM PerantiSiswa where status = 'Pending' ";
                    resultSet = statement.executeQuery(sql);
                    int i = 1;
                    while (resultSet.next()){%>
                        <tr>
                            <td><%=i %></td>
                            <td><%=resultSet.getString("Name") %></td>
                            <td><%=resultSet.getString("IC") %></td>
                            <td><%=resultSet.getString("RegNum") %></td>
                            <td><%=resultSet.getString("Address") %></td>
                            <td><%=resultSet.getString("Edu_Institution") %></td>
                            <td><%=resultSet.getString("M_Name") %></td>
                            <td><%=resultSet.getString("M_IC") %></td>
                            <td><%=resultSet.getString("F_Name") %></td>
                            <td><%=resultSet.getString("F_IC") %></td>
                            <td><%=resultSet.getString("Income") %></td>
                            <td>
                                <a href="action.jsp?ID=<%=resultSet.getString("ID") %>&AMP;Name=<%=resultSet.getString("Name") %>
                                      &AMP;IC=<%=resultSet.getString("IC") %> &AMP;RegNum=<%=resultSet.getString("RegNum") %>
                                      &AMP;Address=<%=resultSet.getString("Address") %>&AMP;Edu_Institution=<%=resultSet.getString("Edu_Institution") %>
                                      &AMP;M_Name=<%=resultSet.getString("M_Name") %>&AMP;M_IC=<%=resultSet.getString("M_IC") %>
                                      &AMP;F_Name=<%=resultSet.getString("F_Name") %>&AMP;F_IC=<%=resultSet.getString("F_IC") %>&AMP;Income=<%=resultSet.getString("Income") %>
                                      &AMP;status=Success">Approve</a>
                            </td>
                            <td>
                                <a href="action.jsp?ID=<%=resultSet.getString("ID") %>&AMP;Name=<%=resultSet.getString("Name") %>
                                      &AMP;IC=<%=resultSet.getString("IC") %> &AMP;RegNum=<%=resultSet.getString("RegNum") %>
                                      &AMP;Address=<%=resultSet.getString("Address") %>&AMP;Edu_Institution=<%=resultSet.getString("Edu_Institution") %>
                                      &AMP;M_Name=<%=resultSet.getString("M_Name") %>&AMP;M_IC=<%=resultSet.getString("M_IC") %>
                                      &AMP;F_Name=<%=resultSet.getString("F_Name") %>&AMP;F_IC=<%=resultSet.getString("F_IC") %>&AMP;Income=<%=resultSet.getString("Income") %>
                                      &AMP;status=Rejected">Reject</a>
                            </td>
                        </tr>
                        <%
                            i++;
                            }
                            connection.close();
                        }
                            catch (Exception e){
                                    e.printStackTrace();
                            }
                        %>
        </table>
    </body>
</html>


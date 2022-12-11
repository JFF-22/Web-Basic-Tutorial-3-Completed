<%-- 
Mini Project 
Yeo Ewe Wen 20DDT20F1016
Ngu Ming Henn 20DDT20F1006
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/PSAS";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String ID = request.getParameter("ID");
String Name = request.getParameter("Name");
String IC = request.getParameter("IC");
String RegNum = request.getParameter("RegNum");
String Address = request.getParameter("Address");     
String Edu_Institution = request.getParameter("Edu_Institution");
String M_Name = request.getParameter("M_Name");
String M_IC = request.getParameter("M_IC");
String F_Name = request.getParameter("F_Name");
String F_IC = request.getParameter("F_IC");
String Income = request.getParameter("Income");
String status = request.getParameter("status");

if(ID != null){
    Connection con = null;
    PreparedStatement ps = null;
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(url,user,psw);
        String sql="UPDATE PerantiSiswa SET ID=?, Name=?, IC=?, RegNum=?, Address=?, Edu_Institution=?, M_Name=?, M_IC=?, F_Name=?, F_IC=?, Income=?, Status=? WHERE id="+ID;
        ps = con.prepareStatement(sql);
        ps.setString(1,ID);
        ps.setString(2, Name);
        ps.setString(3, IC);
        ps.setString(4, RegNum);
        ps.setString(5, Address);
        ps.setString(6, Edu_Institution);
        ps.setString(7, M_Name);
        ps.setString(8, M_IC);
        ps.setString(9, F_Name);
        ps.setString(10, F_IC);
        ps.setString(11, Income);
        ps.setString(12, status);
        int i = ps.executeUpdate();
        if (i > 0){
            out.println("SUCCESS");
            out.println("<!DOCTYPE html><html><head>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Status Updated');");
            out.println("location='administrator.jsp';");
            out.println("</script>");
            out.println("</head><body></body></html>");
        } 
        else {
            out.println("FAILED");
            out.println("<!DOCTYPE html><html><head>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Something went wrong');");
            out.println("location='administrator.jsp';");
            out.println("</script>");
            out.println("</head><body></body></html>");
        }

    }
    catch(SQLException sql) {
    request.setAttribute("error", sql);
    out.println(sql);
    }
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Asociere</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image:
     url('https://thumbs.dreamstime.com/b/blue-digital-data-network-connection-triangle-lines-spheres-futuristic-technology-concept-white-background-d-134825324.jpg')
    ; background-size: cover;">
        <%
            String[] s = request.getParameterValues("primarykey");
        if(s!=null){
            jb.connect();
            jb.stergeDateTabela(s, "asociere", "idasociere");
            jb.disconnect();}
         
        %>
         
        <p align="center">
            <b>Proiect sters din baza de date</b>
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

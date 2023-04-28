<%-- 
    Document   : sterge_Pacient
    Created on : Nov 14, 2016, 1:32:42 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Autori</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
     <body style="background-image: url('https://i0.pickpik.com/photos/1023/137/88/white-paper-texture-background-preview.jpg')
    ; background-size: cover;">
        <%
            String[] s = request.getParameterValues("primarykey");
           if(s!=null){
            jb.connect();
            jb.stergeDateTabela(s, "autori", "idautori");
            jb.disconnect();}
        %>
        <p align="center">
            <b>Autor sters din baza de date</b>
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

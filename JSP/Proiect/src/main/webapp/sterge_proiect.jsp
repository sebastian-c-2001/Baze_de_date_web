<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Proiecte</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image: url('https://media.istockphoto.com/photos/many-stacks-of-educational-books-at-home-preparing-for-exams-on-a-picture-id1216984103?k=6&m=1216984103&s=170667a&w=0&h=2oXRsxpOftwbKHMp1jThO7SiguJ8FjuPoV21UmIpdcc=')
    ; background-size: cover;">
    
        <%  
            String[] s = request.getParameterValues("primarykey");
            if(s!=null){
        	jb.connect();
            jb.stergeDateTabela(s, "proiecte", "idproiecte");
            jb.disconnect();}
        %>
        <p align="center">
            <b>Proiect sters din baza de date</b>
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

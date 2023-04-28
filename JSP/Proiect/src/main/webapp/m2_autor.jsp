<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Autori</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image: url('https://i0.pickpik.com/photos/1023/137/88/white-paper-texture-background-preview.jpg')
    ; background-size: cover;">
        <h1 align="center"> Tabela Autori:</h1>
        <br/>
        <p align="center"><a href="nou_autori.jsp"><b>Adauga un nou autor.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idautori"));
            String Nume = request.getParameter("nume");
            String Prenume = request.getParameter("prenume");
            String Adresa = request.getParameter("adresa");
            String Varsta = request.getParameter("varsta");
            
            String[] valori = {Nume, Prenume, Adresa, Varsta};
            String[] campuri = {"nume", "prenume", "adresa","varsta"};
            jb.modificaTabela("autori", "idautori", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

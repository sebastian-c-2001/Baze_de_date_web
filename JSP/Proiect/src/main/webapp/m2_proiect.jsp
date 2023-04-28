<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Proiecte</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image: url('https://media.istockphoto.com/photos/many-stacks-of-educational-books-at-home-preparing-for-exams-on-a-picture-id1216984103?k=6&m=1216984103&s=170667a&w=0&h=2oXRsxpOftwbKHMp1jThO7SiguJ8FjuPoV21UmIpdcc=')
    ; background-size: cover;">
        <h1 align="center"> Tabela Proiecte:</h1>
        <br/>
        <p align="center"><a href="nou_proiect.jsp"><b>Adauga un nou proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idproiecte"));
            String Denumire = request.getParameter("denumire");
            String Tematica = request.getParameter("tematica");
            String Termen_limita = request.getParameter("termen_limita");

            String[] valori = {Denumire, Tematica, Termen_limita};
            String[] campuri = {"denumire", "tematica", "termen_limita"};
            jb.modificaTabela("proiecte", "idproiecte", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

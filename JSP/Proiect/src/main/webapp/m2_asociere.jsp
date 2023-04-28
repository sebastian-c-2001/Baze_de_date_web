<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Asociere</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image:
     url('https://thumbs.dreamstime.com/b/blue-digital-data-network-connection-triangle-lines-spheres-futuristic-technology-concept-white-background-d-134825324.jpg')
    ; background-size: cover;">
        <h1 align="center"> Tabela Asociere:</h1>
        <br/>
        <p align="center"><a href="nou_asociere.jsp"><b>Adauga o noua asociere.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idasociere"));
            String idautori = request.getParameter("idautori");
            String idproiecte = request.getParameter("idproiecte");

            String[] valori = {idautori, idproiecte};
            String[] campuri = {"idautori", "idproiecte"};
            jb.modificaTabela("asociere", "idasociere", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

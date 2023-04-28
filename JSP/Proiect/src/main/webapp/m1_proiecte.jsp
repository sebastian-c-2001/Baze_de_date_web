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
        <h1 align="center">Tabela Proiecte:</h1>
        <br/>
        <p align="center"><a href="nou_proiect.jsp"><b>Adauga un nou Proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("proiecte", "idproiecte", aux);
            rs.first();
            String Denumire = rs.getString("denumire");
            String Tematica = rs.getString("tematica");
            String Termen_limita = rs.getString("termen_limita");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_proiect.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdProiect:</td>
                    <td> <input type="text" name="idproiecte" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="denumire" size="30" value="<%= Denumire%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tematica:</td>
                    <td> <input type="text" name="tematica" size="30" value="<%= Tematica%>"/></td>
                </tr>
                <tr>
                    <td align="right">Termen_limita:</td>
                    <td> <input type="text" name="termen_limita" size="30" value="<%= Termen_limita%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

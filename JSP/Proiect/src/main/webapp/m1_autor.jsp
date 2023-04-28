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
        <h1 align="center">Tabela Autori:</h1>
        <br/>
        <p align="center"><a href="nou_autor.jsp"><b>Adauga un nou autor.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("autori", "idautori", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Prenume = rs.getString("prenume");
            String Adresa = rs.getString("adresa");
            String Varsta = rs.getString("varsta");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_autor.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdAutor:</td>
                    <td> <input type="text" name="idautori" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" value="<%= Adresa%>"/></td>
                </tr>
                <tr>
                    <td align="right">Varsta:</td>
                    <td> <input type="text" name="varsta" size="30" value="<%= Varsta%>"/></td>
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

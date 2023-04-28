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
        <h1 align="center"> Tabela Proiecte:</h1>
        <br/>
        <p align="center"><a href="nou_proiect.jsp"><b>Adauga un nou proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_proiecte.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdProiect:</b></td>
                    <td><b>Denumire:</b></td>
                    <td><b>Tematica:</b></td>
                    <td><b>Termen_limita:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("proiecte");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idproiecte");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("denumire")%></td>
                    <td><%= rs.getString("tematica")%></td>
                    <td><%= rs.getString("termen_limita")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

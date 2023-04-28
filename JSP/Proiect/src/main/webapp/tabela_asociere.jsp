
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela de Asociere</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image:
     url('https://thumbs.dreamstime.com/b/blue-digital-data-network-connection-triangle-lines-spheres-futuristic-technology-concept-white-background-d-134825324.jpg')
    ; background-size: cover;">
        <h1 align="center"> Tabela Asociere:</h1>
        <br/>
        <p align="center"><a href="nou_asociere.jsp"><b>Adauga o noua asociere.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_asociere.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdAsociere:</b></td>
                    <td><b>IdAutor:</b></td>
                    <td><b>Nume_Autor:</b></td>
                    <td><b>Prenume_Autor:</b></td>
                    <td><b>Varsta:</b></td>
                    <td><b>IdProiect:</b></td>
                    <td><b>Denumire_Proiect:</b></td>
                    <td><b>Tematica_Proiect:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeAsociere();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idasociere");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idautori_asociere")%></td>
                    <td><%= rs.getString("Nume_Autor")%></td>
                    <td><%= rs.getString("Prenume_Autor")%></td>
                    <td><%= rs.getString("Varsta")%></td>
                  	<td><%= rs.getInt("idproiecte_asociere")%></td>
                    <td><%= rs.getString("Denumire_Proiect")%></td>
                    <td><%= rs.getString("Tematica_Proiect")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

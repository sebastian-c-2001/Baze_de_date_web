<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Medic</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
   <body style="background-image: url('https://media.istockphoto.com/photos/many-stacks-of-educational-books-at-home-preparing-for-exams-on-a-picture-id1216984103?k=6&m=1216984103&s=170667a&w=0&h=2oXRsxpOftwbKHMp1jThO7SiguJ8FjuPoV21UmIpdcc=')
    ; background-size: cover;">
        <%
            String denumire = request.getParameter("denumire");
            String tematica = request.getParameter("tematica");
            String termen_limita = request.getParameter("termen_limita");
            if (denumire != null) {
                jb.connect();
                jb.adaugaProiecte(denumire, tematica, termen_limita);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Proiecte.</h1>
        <form action="nou_proiect.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Denumire Proiect:</td>
                    <td> <input type="text" name="denumire" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Tematica Proiect:</td>
                    <td> <input type="text" name="tematica" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Termen limita:</td>
                    <td> <input type="text" name="termen_limita" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga proiectul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

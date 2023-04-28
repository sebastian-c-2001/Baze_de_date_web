<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga pacient</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
     <body style="background-image: url('https://i0.pickpik.com/photos/1023/137/88/white-paper-texture-background-preview.jpg')
    ; background-size: cover;">
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String adresa = request.getParameter("adresa");
            String varsta = request.getParameter("varsta");
      
            if (nume != null) {
                jb.connect();
                jb.adaugaAutor(nume, prenume, adresa, varsta);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Autori.</h1>
        <form action="nou_autor.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Autor:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Autor:</td>
                    <td> <input type="text" name="prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Varsta:</td>
                    <td> <input type="text" name="varsta" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga autor" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

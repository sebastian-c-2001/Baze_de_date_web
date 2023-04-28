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
        <h1 align="center">Tabela Asociere:</h1>
        <br/>
        <p align="center"><a href="nou_asociere.jsp"><b>Adauga o noua asociere.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String numeautor, prenumeautor, varstaautor,denumire, tematica;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceAsociereId(aux);
            rs.first();
            int id1 = rs.getInt("idautori_asociere");
            int id2 = rs.getInt("idproiecte_asociere");

            numeautor = rs.getString("Nume_Autor");
            prenumeautor = rs.getString("Prenume_Autor");
            varstaautor = rs.getString("Varsta");
            denumire = rs.getString("Denumire_Proiect");
            tematica = rs.getString("Tematica_Proiect");

            ResultSet rs1 = jb.vedeTabela("autori");
            ResultSet rs2 = jb.vedeTabela("proiecte");
            int idautori, idproiecte;


        %>
        <form action="m2_asociere.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdAsociere:</td>
                    <td> <input type="text" name="idasociere" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdAutori:</td>
                    <td> 
                        <SELECT NAME="idautori">
                            <%
                                while (rs1.next()) {
                                    idautori = rs1.getInt("idautori");
                                    numeautor = rs1.getString("nume");
                                    prenumeautor = rs1.getString("prenume");
                                    varstaautor = rs1.getString("varsta");
                                    if (idautori != id1) {
                            %>
                            <OPTION VALUE="<%= idautori%>"><%= idautori%>, <%= numeautor%>, <%= prenumeautor%>, <%= varstaautor%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idautori%>"><%= idautori%>, <%= numeautor%>, <%= prenumeautor%>, <%= varstaautor%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">IdProiecte:</td>
                    <td> 
                        <SELECT NAME="idproiecte">
                            <%
                                while (rs2.next()) {
                                    idproiecte = rs2.getInt("idproiecte");
                                    denumire = rs2.getString("denumire");
                                    tematica = rs2.getString("tematica");
                                   
                            if (idproiecte != id2) {
                            %>
                            <OPTION VALUE="<%= idproiecte%>"><%= idproiecte%>, <%= denumire%>, <%= tematica%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes"VALUE="<%= idproiecte%>"><%= idproiecte%>, <%= denumire%>, <%= tematica%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>

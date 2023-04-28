<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga asocierea</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-image:
     url('https://thumbs.dreamstime.com/b/blue-digital-data-network-connection-triangle-lines-spheres-futuristic-technology-concept-white-background-d-134825324.jpg')
    ; background-size: cover;">
        <%
            int idautori, idproiecte;
            String id1, id2, numeautor,prenumeautor,varsta, denumireproiect,tematicaproiect;
            //aci
            id1 = request.getParameter("idautori_asociere");
            id2 = request.getParameter("idproiecte_asociere");
            if (id1 != null && id2 !=null ) {
                jb.connect();
                jb.adaugaAsociere(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } 
            else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("autori");
        ResultSet rs2 = jb.vedeTabela("proiecte");
        %>
        <h1> Suntem in tabela asocieri.</h1>
        <form action="nou_asociere.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdAutor:</td>
                    <td> 
                        Selectati autorul:
			<SELECT NAME="idautori_asociere">
                                <%
                                    while(rs1.next()){
                                        idautori = rs1.getInt("idautori");
                                        numeautor = rs1.getString("nume");
                                        prenumeautor = rs1.getString("prenume");
                                        varsta = rs1.getString("varsta");
                                %>
                                    <OPTION VALUE="<%= idautori%>"><%= idautori%>,<%=numeautor%>,<%=prenumeautor%>,<%=varsta%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdProiect:</td>
                    <td> 
                        Selectati proiectul:
			<SELECT NAME="idproiecte_asociere">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idproiecte = rs2.getInt("idproiecte");
                                        denumireproiect = rs2.getString("denumire");
                                        tematicaproiect = rs2.getString("tematica");
                                        
                                %>
                                    <OPTION VALUE="<%= idproiecte%>"><%= idproiecte%>,<%= denumireproiect%>,<%=tematicaproiect%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
            </table>
            <input type="submit" value="Creeaza Asocierea" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

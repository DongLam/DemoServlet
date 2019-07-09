<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form Processing</title>
</head>
<body>
  <h3>Parameter values:</h3>
  <%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String gender = request.getParameter("gender");
    String sothich=request.getParameter("like");
    String cannang=request.getParameter("cannang");
    String file = request.getParameter("file");
    String txt = "";
    BufferedReader br = null;

        try {   
            br = new BufferedReader(new FileReader(file));       
            String textInALine;

            while ((textInALine = br.readLine()) != null) {
                txt = txt + textInALine;
                textInALine = br.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    String[] addresses = request.getParameterValues("diachi");      
  
  %>
  
  User Name: <%=userName %> <br>
  Password: <%=password %> <br>
  First Name: <%=firstName %> <br>
  Last Name: <%=lastName %> <br>
  Gender: <%=gender %> <br>
  SoThich: <%=sothich %><br>
  Select: <%=cannang %><br>
  File:<%=txt %><br>
  
  <% if (addresses!= null)  {
       for(String address: addresses)  {
      %>
 
     Address: <%=address %> <br>
  
  <% } } %>
  
</body>
</html>
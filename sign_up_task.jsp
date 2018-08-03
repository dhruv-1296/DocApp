<%@page import="com.docapp.dao.UserDAO"%>
<jsp:useBean id="user" class="com.docapp.model.User" scope="request"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<%
   if(UserDAO.saveUser(user))
   {
     %>
     <script>
         alert('Registratin Success');
         window.location.href="home.jsp";
         
     </script>
     <%
   }
   else
   {
     
   }
%>
<%@page import="com.docapp.dao.UserDAO"%>
<jsp:useBean id="user" class="com.docapp.model.User" scope="request"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>

<%
  if(UserDAO.aunticateUser(user, session))
  {
      session.setAttribute("current_email",user.getEmail());
      response.sendRedirect("home.jsp");
  }
  else
  {
  
  }
%>
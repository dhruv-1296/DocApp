<%@page import="java.util.Iterator"%>
<%@page import="com.docapp.model.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.docapp.dao.CityDAO"%>
<%
  String data="";  
  int sid = Integer.parseInt(request.getParameter("sid"));
  ArrayList<City>al = CityDAO.getCityByState(sid);

  Iterator<City>itr = al.iterator();
  while(itr.hasNext())
  {
    City c = itr.next();
    data = data+"<option value='"+c.getCity_id()+"'>"+c.getCity_name()+"</option>";
  }
  out.print(data);
%>
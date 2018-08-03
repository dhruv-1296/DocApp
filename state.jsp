<%@page import="java.util.Iterator"%>
<%@page import="com.docapp.model.State"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.docapp.dao.StateDAO"%>
<%
  int cid = Integer.parseInt(request.getParameter("cid"));
  ArrayList<State> al = StateDAO.getStateByCountry(cid);
  String data="";
  Iterator<State>itr = al.iterator();
  while(itr.hasNext())
  {
   State s = itr.next();
   data = data+"<option value='"+s.getState_id()+"'>"+s.getState_name()+"</option>";
  }
  out.print(data);
%>
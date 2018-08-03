<%@page import="com.docapp.dao.UserDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%

DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

List<FileItem>list  = upload.parseRequest(request);
Iterator<FileItem>itr = list.iterator();
String fileName = "";
while(itr.hasNext())
{
   FileItem item = itr.next();
   if(item.isFormField())
   {
   
   }
   else
   {
     fileName = System.currentTimeMillis()+item.getName();
     String filePath = getServletContext().getRealPath("/")+"profile_images/"+fileName;
     item.write(new File(filePath));
   }
}
if(UserDAO.updateProfile(fileName, session))
{
  session.setAttribute("current_user_profile", fileName);
  response.sendRedirect("home.jsp");
}
else
{

}
%>
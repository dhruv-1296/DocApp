<%@page import="com.docapp.dao.PostDAO"%>
<%@page import="com.docapp.model.Post"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
  DiskFileItemFactory factory = new DiskFileItemFactory();
  ServletFileUpload upload = new ServletFileUpload(factory);
 
  List<FileItem>list = upload.parseRequest(request);
  Iterator<FileItem>itr = list.iterator();
  String post_text = "";
  String post_image = "";
  while(itr.hasNext())
  {
    FileItem fileItem = itr.next();
    String name = fileItem.getFieldName();
    if(fileItem.isFormField())
    {
      if(name.equals("post_text"))
        post_text = fileItem.getString();
    }
    else
    {
        post_image =System.currentTimeMillis()+fileItem.getName();
        String filePath = getServletContext().getRealPath("//")+"post_content//"+post_image;
        fileItem.write(new File(filePath));
    }
  }
  
  Post post = new Post();
  int doc_id = Integer.parseInt(session.getAttribute("current_user_id").toString());
  String date = Long.toString(System.currentTimeMillis());
  post.setDoc_id(doc_id);
  post.setDate(date);
  post.setPost_text(post_text);
  post.setPost_image(post_image);
  if(PostDAO.savePost(post))
  {
   %>
   <script>
       //alert("Post Uploaded..");
       window.location.href="home.jsp";
   </script>
   <%
  }
  else
  {
    // error.jsp
  }
%>
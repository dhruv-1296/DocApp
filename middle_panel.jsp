<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.docapp.model.Post"%>
<%@page import="com.docapp.dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">what are you feeling....</h6>
             
                 <form method="post" enctype="multipart/form-data" action="post_task.jsp">
                  <input type="file" name="post_image"/>
                  <br>
                  <br>
                  <textarea rows="3" cols="30" name="post_text"></textarea>   
                  <br><br>
                  <button type="submit" class="w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Post</button> 
             </form>
            </div>
          </div>
        </div>
      </div>
     <%
      ArrayList<Post>al = PostDAO.getAllPost();
      for(Post post : al)
      {
        String date = post.getDate();
        SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy hh-mm");
        date = sd.format(new Date(Long.parseLong(date)));
     %> 
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
          <img src="profile_images/<%=post.getUserprofile()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity"><%=date%></span>
        <h4><%=post.getUsername()%></h4><br>
        <hr class="w3-clear">
        <p><%=post.getPost_text()%></p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
                <img src="post_content/<%=post.getPost_image()%>" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            </div>
           
        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Comment</button> 
      </div>
      
      <%
       }
      %>
    <!-- End Middle Column -->
    </div>
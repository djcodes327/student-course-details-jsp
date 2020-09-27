<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<%
    if(request.getParameter("submit")!= null) {
        //Database URL
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
        //Parameters
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        PreparedStatement ps = connection.prepareStatement("insert into studentrecords(name,course,fee)values(?,?,?)");
        ps.setString(1,name);
        ps.setString(2,course);
        ps.setString(3,fee);
        ps.executeUpdate();
        
        %>
            <script>   
                alert("Record Addded Successfully");     
            </script> 
    
        <%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Manager</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </head>
    <body>
        
        <h1>Student Management System</h1>
        <br>
        <div class="row">
            
            <!-- Student form-->

            <div class="col-sm-4">
                <form action="#" method="POST" >
                    
                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required >
                     </div>
                         
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required >
                     </div>
                         
                     <div align="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required >
                     </div>
                         </br>
                         
                     <div align="left">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
            
            <!-- Student List-->

            <div class="col-sm-8">
                
                <div class="panel-body">
                    
                    <table width="100%" id="tb1-student" class="table table-bordered" cellspacing="0" cellpadding="0">
                        
                        <thead class="thead-dark">
                            <!--Table Heading-->
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fees</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <!--Getting Records-->
                            <%
                                //Database URL
                                Connection connection;
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
                                Statement st = connection.createStatement();
                                ResultSet rs = st.executeQuery("select * from studentrecords");
                                
                                while(rs.next()) {
                                    String id = rs.getString("id");
                        
                            %>
                            <tr>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>
                            <% } %>
                            
                        </thead>
                    </table>
                    
                </div>
                
            </div>
        
        
        </div>
        
    </body>
</html>

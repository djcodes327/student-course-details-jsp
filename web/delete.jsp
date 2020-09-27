<%@page import="java.sql.*" %> 
 <!--Delete Student Data-->
<%
     
        Connection connection;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","");
        //Parameters
        String id = request.getParameter("id");
       
        PreparedStatement ps = connection.prepareStatement("delete from studentrecords  where id = ?");
        ps.setString(1,id);
        ps.executeUpdate();
        
        %>
            <script>   
                alert("Record Deleted Successfully");     
            </script> 

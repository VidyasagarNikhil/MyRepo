<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page errorPage="err.jsp" %> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Screen</title>
<script type="text/javascript">

function checkAll(ele) {
    var checkboxes = document.getElementsByTagName('input');
    if (ele.checked) {
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = true;
            }
        }
    } else {
        for (var i = 0; i < checkboxes.length; i++) {
            console.log(i)
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = false;
            }
        }
    }
}

	
	function Validate(){
		   if(!validateForm()){
		       alert("You must check atleast one of the checkboxes");
		       return false;
		   }
		  var c= ValidateSelect()
		return c
		}	
	function ValidateSelect(){
	select = document.getElementById('status'); 
	if (select.value=='Select Option') {
		alert("Please select status");
	  return false;
	}
	return true;
	
	}
		function validateForm()
		{
		    var c=document.getElementsByTagName('input');
		    for (var i = 0; i<c.length; i++){
		        if (c[i].type=='checkbox')
		        {
		            if (c[i].checked){return true}
		        }
		    }
		    return false;
		}
	
		function AfterSubmit(){
			var a=confirm("Are you sure want to update status?");
			return a;
		}
		
</script>
<style>
table.table1 {
    width:80%;
    height:800px;
    height:100%;
    table-layout: auto;
   
    background-color:lime;
    border-radius:25px;
   
}
table.table1 th {
   height: 40px;
    border-collapse: collapse;
    border-bottom: 2px solid #ddd;
    border-bottom-color: black;
    	
}
 table.table1 th, td {
  padding: 8px;
    text-align: left;
   
    }
   table.table1 td{
    border-bottom: 1px solid #ddd;
     border-bottom-color: black;
   }
   #submit {
background: #015ABC;

color: #fff;

border: 2px solid #eee;

border-radius: 30px;
width:100px;
height:25px;
 
}
</style>
</head>

<body style="background-color: yellow;">

<form  action="/WorkitemClosue/backend" onsubmit="return (Validate() && AfterSubmit())" method="post">


<div style="overflow-x:auto;">
<table class="table1"  align="center"; cellpadding="20";cellspacing="1000"; >
<tr>
<tr>
 <th style="text-align:center;color:blue;width:100px"><input type="checkbox" onchange="checkAll(this)" name="queue"/>Select All</th>
 <th><u>Work item ID</u></th>
    <th><u>Status</u></th> 
    <th><u>Queue Name</u></th>
<tr>

<%
try
{
	
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/bancs-ca-prod";
String username="root";
String password="vidya@123";
String query="select * from workitem where wk_id="+session.getAttribute("id");
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();

ResultSet rs=stmt.executeQuery(query);

	
while(rs.next())
{
%>

 <tr >
   <br>
 <input type="hidden" name="id" value="<%=rs.getInt("wk_id")%>">
   <td style="text-align:center;width:100px"> <input  class="checkbox" type="checkbox" id="myCheck"  name="queue" value="<%=rs.getString("queue")%>"></td>
    <td><%=rs.getInt("wk_id")%></td>
    <td><%=rs.getString("status") %></td>
    <td><%=rs.getString("queue") %></td>
    
 
   </tr>
   

<%
}
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>

 </table>
 </div>
 <table class="table2" align="center">
 <tr><td>
 <br><br><br>
<h3><b>Workitem Status:
<select style="border-radius: 5px; border-color:blue;background-color:fuchsia; ;" name="status" id="status" required="">
<option disabled="" selected="">Select Option</option>
             <option value="open">open</option>
             <option value="closed">closed</option>
              <option value="Under Review">Under Review</option>
             </select></b></h3>
   </td></tr>   
 <tr><td>
 <br><br>
&emsp;&emsp;&emsp;<input type="submit" value="update" id="submit">
  </form>
   <tr><td>
<h4 align="left"> <a  href="select.html"  target="_self" ><u><<<< Event ID Input</u></a></h4>
  </td></tr> 
</table>
</body>
</html>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Todo List</title>
<style type="text/css">
table {
	width: 80%;
	margin: auto;
	border-collapse: collapse;
}
th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}
th {
	background-color: #f4f4f4;
}
</style>
</head>
<body>
<h1 style="text-align: center;">Todo List</h1>
<table>
<thead>
<tr>
 <th>User ID</th>
 <th>ID</th>
 <th>Title</th>
 <th>Completed</th>
 </tr>
 </thead>
 <tbody>
 <% 
 String urlString="https://jsonplaceholder.typicode.com/todos";
 URL url=new URL(urlString);
 HttpsURLConnection connection=(HttpsURLConnection) url.openConnection();
 connection.setRequestMethod("GET");
 connection.connect();
 
 BufferedReader reader= new BufferedReader(new InputStreamReader(connection.getInputStream()));
 StringBuilder rs=new StringBuilder();
 String line;
 while((line= reader.readLine())!=null){
	 rs.append(line);
	 
 }
 reader.close();
 
 JSONArray todosArray = new JSONArray(rs.toString());
 
 for (int i=0; i< 10; i++){
	 JSONObject todo=todosArray.getJSONObject(i);
	 int userId=todo.getInt("userId");
	 int id= todo.getInt("id");
	 String title= todo.getString("title");
	 boolean completed= todo.getBoolean("completed");
 %>
 <tr>
 <td><%= userId %></td>
 <td><%= id %></td>
 <td><%= title %></td>
<td><%= completed ? "Yes" : "No" %> </td>
</tr>
<%
 }
%>
 </tbody>
</table>
</body>
</html>
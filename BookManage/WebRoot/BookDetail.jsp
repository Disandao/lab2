<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8" %>
<%@ page import="DAO.BookDao" %>
<%@ page import="DAO.AuthorDao" %>
<%@ page import="ActionFromat.BookFromat" %>
<%@ page import="ActionFromat.AuthorFormat" %>
<%@ page import="java.util.*"%>
<html>
<%
BookFromat bookForm=(BookFromat)request.getAttribute("bookDetail");
AuthorFormat authorForm=(AuthorFormat)request.getAttribute("authorDetail");
%>
<head>
<style type="text/css"> 
body{ 
    background-image:url(back.jpg);
    background-repeat:no-repeat;
} 
</style>
<title>图书管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFCC99">
  <tr>
    <td valign="top" bgcolor="#FFCC99"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;" bgcolor="#FFCC99"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
    
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
<%  
  	String ISBN="";
  	String Title="";
  	int AuthorID=0;
  	String Publisher="";
  	String PublishData="";
 	 Float price;
 	 String Name =authorForm.getName();
 	 int Age = authorForm.getAge();
 	 String Country = authorForm.getCountry();
	ISBN=bookForm.getISBN();
	Title=bookForm.getTitle();
	AuthorID=bookForm.getAuthorID();
	Publisher=bookForm.getPublisher();
	PublishData=bookForm.getPublishDate();
	price=bookForm.getPrice();
  %>
	<table width="600" height="200"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
	<tr>
        <td width="173" height="30" align="center"style="font-size:22px;font-family:Microsoft YaHei">图书信息：</td>
        <br>
      </tr>
        <br>
      <tr>
      <br>
        <td width="173" height="30" align="center">ISBN：</td>
        <td height=""><input name="name" type="text" value="<%=ISBN%>"size=50 ></td>
      </tr>
      <tr>
        <td width="173" height="35" align="center">图书名称：</td>
        <td>
          <input name="name" type="text" value="<%=Title%>"size=50 > </td>
      </tr>
      <tr>
        <td height="30" align="center">AuthorID：</td>
        <td><input name="AuthorID" type="text" id="AuthorID" value="<%=AuthorID%>"size=50></td>
      </tr>
      <tr>
        <td height="30" align="center">出版社：</td>
        <td><input name="Publisher" type="text" id="Publisher" value="<%=Publisher%>" size=50></td>
      </tr>
      <tr>
        <td height="30" align="center">出版时间：</td>
        <td><input name="PublishData" type="text" id="PublishData" value="<%=PublishData%>" size=50></td>
      </tr>
     
      <tr>
        <td height="30" align="center">价格：</td>
        <td><input name="paperNO" type="text" id="paperNO" value="<%=price%>"size=50>
          (元)</td>
      </tr>
      


    </table>
    <br>
      <br>
        <br>
    <table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
    <tr>
        <td width="173" height="30" align="center" style="font-size:22px;font-family:Microsoft YaHei">作者信息：</td>
        
      </tr>
        
      <tr>
        <td width="173" height="30" align="center">作者：</td>
        <td height="35"><input name="name" type="text" value="<%=Name%>" size=50></td>
      </tr>
      <tr>
        <td width="173" height="30" align="center">AuthorID：</td>
        <td width="427" height="39">
          <input name="name" type="text" value="<%=AuthorID%>" size=50> </td>
      </tr>
      <tr>
        <td height="30" align="center">Age：</td>
        <td><input name="AuthorID" type="text" id="AuthorID" value="<%=Age%>"size=50></td>
      </tr>
      <tr>
        <td height="30" align="center">Country：</td>
        <td><input name="Publisher" type="text" id="Publisher" value="<%=Country%>"size=50></td>
      </tr>
      
      <tr>
        <td align="center">&nbsp;</td>
        <td>
&nbsp;
<input name="Submit2"  style="font-size:22px;font-family:Microsoft YaHei" type="button" class="btn_grey" value="返回" onClick="history.back()"></td>
      </tr>
    </table>
	</td>
  </tr>
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>

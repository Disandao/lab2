<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="UTF-8"%>
<%@ page import="DAO.BookDao" %>
<%@ page import="ActionFromat.BookFromat" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("book");
%>
<head>
<title>图书管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<style type="text/css"> 
body{ 
    background-image:url(back.jpg);
    background-repeat:no-repeat;
} 
</style>
<body onLoad="clockon(bgclock)">

        <td align="center" valign="top"><%
if(coll==null || coll.isEmpty()){
%>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"><tr><td align="center" valign="middle">
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="middle" align="center" style="font-size:42px;color:red;font-family:Microsoft YaHei" bgcolor="#FFCC99">
暂无图书信息
</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#FFCC99">
  <tr>
    <td style="font-size:22px;color:red;font-family:Microsoft YaHei" 	align="center">
      <a href="AddBook.jsp">添加图书信息</a> </td>
  </tr>
</table>
</td></tr></table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  String ISBN="";
  String Title="";
  int AuthorID=0;
  String Publisher="";
  String PublishData="";
  Float price;
  %>
  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"><tr><td align="center" valign="middle">
 <table width="98%"  height="7%"border="0" cellspacing="0" cellpadding="0" bgcolor="#FFCC99">
  <tr>
   
    <td width="50%" align="center" style="font-size:22px;color:red;font-family:Microsoft YaHei"> <a href="AuthorQuery.jsp">查询图书信息</a>      </td>
    
<td width="50%" align="center">
     
      <a href="AddBook.jsp" style="font-size:22px;color:red;font-family:Microsoft YaHei">添加图书信息</a></td>	  
  </tr>
</table>  
  <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF" bgcolor="#FFCC99"  >
  <tr align="center" bgcolor="#e3F4F7">
    <td width="8%" bgcolor="#F9D16B">ISBN</td>  
    <td width="26%" bgcolor="#F9D16B">图书名称</td>
    <td width="15%" bgcolor="#F9D16B">作者ID</td>
    <td width="14%" bgcolor="#F9D16B">出版社</td>
    <td width="12%" bgcolor="#F9D16B">出版日期</td>
     <td width="12%" bgcolor="#F9D16B">价格</td>
    <td width="9%" bgcolor="#F9D16B">修改</td>
    <td width="10%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){
    BookFromat bookForm=(BookFromat)it.next();
	ISBN=bookForm.getISBN();
	Title=bookForm.getTitle();
	AuthorID=bookForm.getAuthorID();
	Publisher=bookForm.getPublisher();
	PublishData=bookForm.getPublishDate();
	price=bookForm.getPrice();
	%> 
  <tr>
    <td style="padding:5px;"  name= ISBN align="center">&nbsp;<%=ISBN%></td>  
    
   <td style="padding:5px;" align="center"><a href="BookDetail?ISBN=<%=ISBN%>&AuthorID=<%=AuthorID %>"><%=Title%></a></td>
    <td style="padding:5px;" align="center">&nbsp;<%=AuthorID%></td>  
    <td style="padding:5px;" align="center">&nbsp;<%=Publisher%></td>  
    <td style="padding:5px;" align="center">&nbsp;<%=PublishData%></td>
    <td style="padding:5px;" align="center">&nbsp;<%=price%></td>  
	
    <td align="center" ><a href="ModifyBook?ISBN=<%=ISBN%>">修改</a></td>
    <td align="center" ><a href="DeleteBook?ISBN=<%=ISBN%>">删除</a></td>
  </tr>
<%
  }
}
%>  
</table></td>
</td></tr></table>
</body>
</html>

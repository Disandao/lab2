<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8" %>
<%@ page import="DAO.BookDao" %>
<%@ page import="ActionFromat.BookFromat" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("ifbook");
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

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFCC99">
  <tr>
    <td valign="top" bgcolor="#FFCC99"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC99" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;" bgcolor="#FFCC99"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
     
      <tr>
        <td align="center" valign="top">
	<form action="Query" method="post" name="form1">  
 <table width="98%" height="38"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder_gray">
  <tr>
    <td align="center" bgcolor="#F9D16B">


    <td bgcolor="#F9D16B">请选择查询依据：
      <select name="select" class="wenbenkuang" id="f">
        <option value="book">书名</option>
        <option value="author"selected>作者</option>
        <option value="authorID"selected>作者ID</option>
                  </select>
      <input name="key" type="text" id="key" size="50">
      <input name="Submit" type="submit" class="btn_grey" value="查询"><input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()"></td>
      </td>
  </tr>
</table>
<%
if(coll==null || coll.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center" style="font-size:22px;color:red;font-family:Microsoft YaHei">暂无图书信息！</td>
            </tr>
          </table>
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
  <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="17%" bgcolor="#F9D16B">ISBN</td>  
    <td width="31%" bgcolor="#F9D16B">图书名称</td>
    <td width="18%" bgcolor="#F9D16B">AuthorID</td>
    <td width="19%" bgcolor="#F9D16B">出版社</td>
    <td width="15%" bgcolor="#F9D16B">出版时间</td>
     <td width="15%" bgcolor="#F9D16B">价格</td>
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
    <td style="padding:5px;" align="center">&nbsp;<%=ISBN%></td>  
    <td style="padding:5px;" align="center"><a href="BookDetail?ISBN=<%=ISBN%>&AuthorID=<%=AuthorID %>"><%=Title%></a></td>
    <td style="padding:5px;" align="center">&nbsp;<%=AuthorID%></td>  
    <td style="padding:5px;" align="center">&nbsp;<%=Publisher%></td>  
    <td style="padding:5px;" align="center">&nbsp;<%=PublishData%></td>
    <td style="padding:5px;" align="center">&nbsp;<%=price%></td>    
    </tr>
<%
  }
}
%>  
</table>
	</form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>

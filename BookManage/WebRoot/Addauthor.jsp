<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8" %>
<%@ page import="DAO.BookDao" %>
<%@ page import="ActionFromat.BookFromat" %>
<%@ page import="java.util.*"%>
<html>
<head>
<style type="text/css"> 
body{ 
    background-image:url(back.jpg);
    background-repeat:no-repeat;
} 
</style>
<script type="text/JavaScript">
         function check(form) {
		
          if(document.getElementsByName("form.AuthorID")[0].value==''||document.getElementsByName("form.AuthorID")[0].value==null) {
                alert("请输入AuthorID!");
                document.getElementsByName("form.AuthorID")[0].focus();
                return false;
           }
       if(document.getElementsByName("form.Name")[0].value==''||document.getElementsByName("form.Name")[0].value==null){
                alert("请输入作者名字!");
                document.getElementsByName("form.Name")[0].focus();
                return false;
         }
          if(isNaN(document.getElementsByName("form.AuthorID")[0].value))
			{
    			alert("作者ID必须是数字!");
                document.getElementsByName("form.AuthorID")[0].focus();
                return false;
			}
         return true;
         }
</script>
<%
BookFromat coll=(BookFromat)request.getAttribute("book");
String ISBN = coll.getISBN();
String Title = coll.getTitle();
int AuthorID = coll.getAuthorID();
String Publisher = coll.getPublisher();
String PublishDate = coll.getPublishDate();
Float Price = coll.getPrice();

	
%>
<title>作者添加</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFCC99">
  <tr>
    <td valign="top" bgcolor="#FFCC99"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC99" class="tableBorder_gray">
  <tr>
  <tr>
    <td align="center" style="font-size:22px;color:red;font-family:Microsoft YaHei" >该作者不存在！请填写作者信息！</td>
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
     
      <tr>
        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
	<form name="form1" method="post" action="Addauthor">
	<input name="coll.ISBN" type="hidden" id="id" value="<%=ISBN%>">
<input name="coll.authorID" type="hidden" id="id" value="<%=AuthorID%>">
<input name="coll.Title" type="hidden" id="id" value="<%=Title%>">
<input name="coll.publisher" type="hidden" id="id" value="<%=Publisher%>">
<input name="coll.publishDate" type="hidden" id="id" value="<%=PublishDate%>">
<input name="coll.price" type="hidden" id="id" value="<%=Price%>">

	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
      <tr>
        <td width="173" align="center">AuthorID：</td>
        <td width="427" height="65">
          <input name="form.AuthorID" type="text" id="barcode">
          *必须填数字</td>
      </tr>
      <tr>
        <td align="center" width="173">Name：</td>
        <td width="427" height="65"><input name="form.Name" type="text" id="bookName" size="50">
          * </td>
      </tr>

      <tr>
        <td align="center">Age：</td>
        <td width="427" height="65"><input name="form.Age" type="text" id="author" size="40"></td>
      </tr>
      <tr>
        <td align="center">Country：</td>
        <td width="427" height="65"><input name="form.Country" type="text" id="translator" size="40"></td>
      </tr>
      
      
      <tr>
        <td align="center">&nbsp;</td>
        <td><input name="Submit" style="font-size:22px;font-family:Microsoft YaHei" type="submit" class="btn_grey" value="保存" onclick="return check(this.form)"">
&nbsp;
<input name="Submit2" style="font-size:22px;font-family:Microsoft YaHei" type="button" class="btn_grey" value="返回" onClick="history.back()"></td>
      </tr>
    </table>
	</form>
	</td>
  </tr>
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table>
  </tr>
</table>

</body>
</html>

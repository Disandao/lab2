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
		
          if(document.getElementsByName("form.ISBN")[0].value==''||document.getElementsByName("form.ISBN")[0].value==null) {
                alert("请输入ISBN!");
                document.getElementsByName("form.ISBN")[0].focus();
                return false;
           }
       if(document.getElementsByName("form.Title")[0].value==''||document.getElementsByName("form.Title")[0].value==null){
                alert("请输入图书名称!");
                document.getElementsByName("form.Title")[0].focus();
                return false;
         }
          if(document.getElementsByName("form.authorID")[0].value==0||document.getElementsByName("form.authorID")[0].value==null){
                alert("请输入作者ID!");
                document.getElementsByName("form.authorID")[0].focus();
                return false;
         }
          if(document.getElementsByName("form.price")[0].value==''||document.getElementsByName("form.price")[0].value==null){
                alert("请输入价格!");
                document.getElementsByName("form.price")[0].focus();
                return false;
         }
         if(isNaN(document.getElementsByName("form.authorID")[0].value))
			{
    			alert("作者ID必须是数字!");
                document.getElementsByName("form.authorID")[0].focus();
                return false;
			}
			if(isNaN(document.getElementsByName("form.price")[0].value))
			{
    			alert("价格必须是数字!");
                document.getElementsByName("form.price")[0].focus();
                return false;
			}
         
         return true;
         }
</script>
<title>图书管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">

<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFCC99" >
  <tr >
    <td valign="middle" bgcolor="#FFCC99"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC99" class="tableBorder_gray">
  <tr>
    <td height="510" valign="middle" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
     
      <tr>
        <td align="center" valign="middle"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle">
	<form name="form1" method="post" action="AddBook">
	<table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFCC99">
      <tr>
        <td width="173" align="center">ISBN&nbsp;&nbsp;：</td>
        <td width="427" height="39">
          <input  name="form.ISBN" type="text" id="isbn">
 
          *</td>
      </tr>
      <tr>
        <td align="center">图书名称：</td>
        <td height="39"><input name="form.Title" type="text" id="bookName" size="50">
          * </td>
      </tr>

      <tr>
        <td align="center">AuthorID：</td>
        <td><input name="form.authorID" type="text" id="author" size="40">*必须填数字</td>
      </tr>
      <tr>
        <td align="center">出版社：</td>
        <td><input name="form.publisher" type="text" id="translator" size="40"></td>
      </tr>
      <tr>
        <td align="center">出版时间：</td>
        <td><input name="form.publishDate" type="text" id="translator" size="40"></td>

      </tr>
      <tr>
        <td align="center">价格：</td>
        <td><input name="form.price" type="text" id="price"> 
          (元) *必须填数字 </td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td><input name="Submit" style="font-size:22px;font-family:Microsoft YaHei" type="submit" class="btn_grey" value="保存" onclick="return check(this.form)" >
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

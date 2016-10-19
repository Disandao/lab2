package DAO;
import java.sql.*;
import java.util.*;

import ActionFromat.BookFromat;

public class BookDao {
    private static DBCon conn=new DBCon();
//列举数据
public static Collection list(){
BookFromat bookForm=new BookFromat();
Collection bookColl=new ArrayList();
String sql="select * from app_lab2bookmanage.book";
System.out.println("图书查询时的SQL："+sql);
ResultSet rs=conn.executeQuery(sql);
try {
    while (rs.next()) {
        bookForm=new BookFromat();
        bookForm.setISBN(rs.getString(1));       
        bookForm.setTitle(rs.getString(2));
        bookForm.setAuthorID(rs.getInt(3));
        bookForm.setPublisher(rs.getString(4));
        bookForm.setPublishDate(rs.getString(5));
        bookForm.setPrice(Float.valueOf(rs.getString(6)));  //此处必须进行类型转换
        bookColl.add(bookForm);
    }
} catch (SQLException ex) {
	ex.printStackTrace();
}
conn.close();
return bookColl;
}
//细节展示
public static BookFromat queryM(BookFromat bookForm1){
BookFromat bookForm=null;
String sql="SELECT * FROM app_lab2bookmanage.book WHERE ISBN='"+bookForm1.getISBN()+"'";
System.out.println("细节的SQL："+sql);
ResultSet rs=conn.executeQuery(sql);
try {
    while (rs.next()) {
    	 bookForm=new BookFromat();
         bookForm.setISBN(rs.getString(1));       
         bookForm.setTitle(rs.getString(2));
         bookForm.setAuthorID(rs.getInt(3));
         bookForm.setPublisher(rs.getString(4));
         bookForm.setPublishDate(rs.getString(5));
         bookForm.setPrice(Float.valueOf(rs.getString(6)));  //此处必须进行类型转
    }
} catch (SQLException ex) {
}
conn.close();
return bookForm;
}

//添加数据
public static int insert(BookFromat bookForm){
	int falg = 0;
	if(bookForm != null)
	{
		//System.out.println(bookForm.getISBN()+"++++++++++++++++++++");
		String sql1="SELECT * FROM app_lab2bookmanage.book WHERE ISBN='"+bookForm.getISBN()+"' or Title='"+bookForm.getTitle()+"'";
		ResultSet rs = conn.executeQuery(sql1);
		String sql = "";
		try 
		{
			if (rs.next()) 
			{
				falg = 2;
			} 
			else 
			{
				sql ="Insert into app_lab2bookmanage.book (ISBN,Title,AuthorID,Publisher,PublishDate,Price) values('"+bookForm.getISBN()+"','"+bookForm.getTitle()+"',"+bookForm.getAuthorID()+",'"+bookForm.getPublisher()+"','"+bookForm.getPublishDate()+"',"+bookForm.getPrice()+")";
				falg = conn.executeUpdate(sql);
				System.out.println("添加图书的SQL：" + sql);
				conn.close();
			}
		} 
		catch (SQLException ex) 
		{
			falg = 0;
		}
		System.out.println("******insertbook！falg:"+falg);
	}
	return falg;
}

//修改数据
public static int update(BookFromat bookForm){
String sql="Update app_lab2bookmanage.book set AuthorID="+bookForm.getAuthorID()+",Publisher='"+bookForm.getPublisher()+"',PublishDate='"+bookForm.getPublishDate()+"',Price="+bookForm.getPrice()+" where ISBN='"+bookForm.getISBN()+"'";
int falg=conn.executeUpdate(sql);
System.out.println("修改数据时的SQL："+sql);
conn.close();
return falg;
}
//删除数据
public static int delete(BookFromat bookForm){
String sql="delete from app_lab2bookmanage.book where ISBN='"+bookForm.getISBN()+"'";
int falg=conn.executeUpdate(sql);
System.out.println("删除时的SQL："+sql);
return falg;
}
//条件查询
public static Collection query(String key,String select)
{
BookFromat bookForm=new BookFromat();
Collection bookColl=new ArrayList();
String sql="";
ResultSet rs=null;
ResultSet bs=null;
if(select.equals("book"))
{
	sql="select * from app_lab2bookmanage.book where Title='"+key+"'";
	rs=conn.executeQuery(sql);
}
else if(select.equals("authorID"))
{
	sql="select * from app_lab2bookmanage.book where authorID='"+key+"'";
	rs=conn.executeQuery(sql);
}
else
{
	sql="select * from app_lab2bookmanage.author where Name='"+key+"'";
	rs=conn.executeQuery(sql);
	try {
		while(rs.next())
		{
			int authorid =rs.getInt(1);
			sql="select * from app_lab2bookmanage.book where AuthorID="+authorid+"";
			bs=conn.executeQuery(sql);
			while (bs.next()) {
		        bookForm=new BookFromat();
		        bookForm.setISBN(bs.getString(1));       
		        bookForm.setTitle(bs.getString(2));
		        bookForm.setAuthorID(bs.getInt(3));
		        bookForm.setPublisher(bs.getString(4));
		        bookForm.setPublishDate(bs.getString(5));
		        bookForm.setPrice(Float.valueOf(bs.getString(6)));  //此处必须进行类型转换
		        bookColl.add(bookForm);
		    }
		}
		rs =null;
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
	
System.out.println("图书查询时的SQL："+sql);

try {
	if(rs!=null){
    while (rs.next()) {
        bookForm=new BookFromat();
        bookForm.setISBN(rs.getString(1));       
        bookForm.setTitle(rs.getString(2));
        bookForm.setAuthorID(rs.getInt(3));
        bookForm.setPublisher(rs.getString(4));
        bookForm.setPublishDate(rs.getString(5));
        bookForm.setPrice(Float.valueOf(rs.getString(6)));  //此处必须进行类型转换
        bookColl.add(bookForm);
    }}
} catch (SQLException ex) {
	ex.printStackTrace();
}
conn.close();
return bookColl;
}
//判断作者存在不存在
public static int addquery(int authorID){
	int falg = 0;
	String sql1="SELECT * FROM app_lab2bookmanage.author WHERE AuthorID="+authorID+"";
		ResultSet rs = conn.executeQuery(sql1);
		String sql = "";
		try 
		{
			if (rs.next()) 
			{
				falg = 1;
			} 
			else 
			{
				falg = 2;
			}
		} 
		catch (SQLException ex) 
		{
			falg = 0;
		}
		System.out.println("*****查询作者在不在的！！！！falg:"+falg);
		System.out.println("*****查询作者在不在！！！！sql:"+sql1);
		conn.close();
	return falg;
}





}

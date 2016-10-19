package DAO;
import java.sql.*;
import java.util.*;

import ActionFromat.BookFromat;
import ActionFromat.AuthorFormat;
public class AuthorDao {
    private static DBCon conn=new DBCon();
//列举数据
//细节展示
public static AuthorFormat queryM(AuthorFormat bookForm1){
	
String sql="SELECT * FROM app_lab2bookmanage.author WHERE AuthorID="+bookForm1.getAuthorID()+"";
//System.out.println("修改时的SQL："+sql);
ResultSet rs=conn.executeQuery(sql);
AuthorFormat authorForm = new AuthorFormat();
try {
    while (rs.next()) {
    	 authorForm.setAuthorID(rs.getInt(1));       
    	 authorForm.setName(rs.getString(2));
    	 authorForm.setAge(rs.getInt(3));
    	 authorForm.setCountry(rs.getString(4));
    }
} catch (SQLException ex) {
}
conn.close();
return authorForm;
}

//添加作者
public static int insert(AuthorFormat authorForm) throws SQLException{
	int falg = 0;
	if(authorForm != null)
	{
		String sql ="Insert into app_lab2bookmanage.author (AuthorID,Name,Age,Country) values("+authorForm.getAuthorID()+",'"+authorForm.getName()+"',"+authorForm.getAge()+",'"+authorForm.getCountry()+"')";

		falg = conn.executeUpdate(sql);
		System.out.println("添加作者的SQL：" + sql);
		conn.close();
		System.out.println("*****inserauthorfalg:"+falg);
	}
	return falg;
}







}

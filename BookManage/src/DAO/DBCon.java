package DAO;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBCon {
	  public Connection conn = null;
	  public Statement stmt = null;
	  public ResultSet rs = null;
	  private static String dbClassName ="com.mysql.jdbc.Driver";
	  private static String dbUrl =
	      "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_lab2bookmanage?user=05o1z00m3l&password=jhmil0i52hmw4321h0i2x1j223k55mkxm5z340j2&useUnicode=true";
	  public static Connection getConnection() {
	    Connection conn = null;
	    try {
	      Class.forName(dbClassName).newInstance();
	     
	      //conn = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_lab2bookmanage", "05o1z00m3l", "jhmil0i52hmw4321h0i2x1j223k55mkxm5z340j2");
	      conn = DriverManager.getConnection(dbUrl);
	    }
	    catch (Exception ee) {
	    	
	      ee.printStackTrace();
	    }
	    if (conn == null) {
	      System.err.println(
	          "����: DbConnectionManager.getConnection() ������ݿ�����ʧ��.\r\n\r\n��������:" +
	          dbClassName + "\r\n����λ��:" + dbUrl);
	    }
	    return conn;
	  }

	/*
	 * ���ܣ�ִ�в�ѯ���
	 */
	public ResultSet executeQuery(String sql) {
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			
			
			rs = stmt.executeQuery(sql);
			
		} catch (SQLException ex) {
			System.err.println(ex.getMessage());
		}
		return rs;
	}

	/*
	 * ����:ִ�и��²���
	 */
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = getConnection();					//����getConnection()��������Connection�����һ��ʵ��conn
			System.out.println("���ݿ����ӳ¹�����������������������������������������");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			System.out.println("��ʼ���²�������������������������������������������");
			result = stmt.executeUpdate(sql);		//ִ�и��²���
			System.out.println("���³ɹ���������������������������������������"+result);
		} catch (SQLException ex) {
			result = 0;
		}
		return result;
	}

	/*
	 * ����:�ر����ݿ������
	 */
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}

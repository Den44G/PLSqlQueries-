package com.bankTrust.addImgaeToSR;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddImage {

	static String url = "jdbc:oracle:thin:@10.44.4.10:1521:SRBANK";
	  static String username = "SR_BANK";
	  static String password = "hkjghj";
	  
	  
	  private static java.sql.Date getCurrentDate() {
		    java.util.Date today = new java.util.Date();
		    return new java.sql.Date(today.getTime());
		}

	  public static void main(String[] args) throws Exception {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection conn = DriverManager.getConnection(url, username, password);
	    conn.setAutoCommit(false);

	    String sql = "INSERT INTO TRUST_OUTCOME_SC_MAIL (ID,NP,MAIL_DATE,SHORT_CONTEN,ADD_DATA) VALUES ( ?, ?, ?, ?, ?)";
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, 29);
	    stmt.setInt(2, 11);
	    stmt.setDate(3, getCurrentDate());
	    stmt.setString(4, "Test string");

	    File image = new File("D:\\dog.png");
	    FileInputStream   fis = new FileInputStream(image);
	    stmt.setBinaryStream(5, fis, (int) image.length());
	    stmt.execute();

	    conn.commit();
	    fis.close();
	    conn.close();
	  }
	 
	
	
}

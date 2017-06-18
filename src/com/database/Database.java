package com.database;

import java.sql.*;
public class Database{
  private String ip = "";
  private String port = "";
  private String url = "";
  private String user = "";
  private String password = "";
  private String db = "";
  private String driver = "com.mysql.jdbc.Driver";
  private Connection con = null;
  private Statement stmt = null;
  private ResultSet rs = null;
  private Connection con1 = null;
  private Statement stmt1 = null;
  private ResultSet rs1 = null;
  private Connection con2 = null;
  private Statement stmt2 = null;
  private ResultSet rs2 = null;
  private Connection con3 = null;
  private Statement stmt3 = null;
  private ResultSet rs3 = null;

  public Database() {
  }

  public void connectDB() {
    try {
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url, user, password);
      stmt = con.createStatement();
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }
  
  public void connectDB1() {
	  try {
		  url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
	      Class.forName(driver);
	      con1 = DriverManager.getConnection(url, user, password);
	      stmt1 = con1.createStatement();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void connectDB2() {
	  try {
		  url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
	      Class.forName(driver);
	      con2 = DriverManager.getConnection(url, user, password);
	      stmt2 = con2.createStatement();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void connectDB3() {
	  try {
		  url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
	      Class.forName(driver);
	      con3 = DriverManager.getConnection(url, user, password);
	      stmt3 = con3.createStatement();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void closeDB() {
	  try {
		  stmt.close();
		  rs.close();
		  con.close();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void closeDB1() {
	  try {
		  stmt1.close();
		  rs1.close();
		  con1.close();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void closeDB2() {
	  try {
		  stmt2.close();
		  rs2.close();
		  con2.close();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void closeDB3() {
	  try {
		  stmt3.close();
		  rs3.close();
		  con3.close();
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }

  public void query(String sql) {
    try {
      rs = stmt.executeQuery(sql);
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }
  
  public void query1(String sql) {
	  try {
		  rs1 = stmt1.executeQuery(sql);
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void query2(String sql) {
	  try {
		  rs2 = stmt2.executeQuery(sql);
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }
  
  public void query3(String sql) {
	  try {
		  rs3 = stmt3.executeQuery(sql);
	  } catch(Exception ex) {
		  System.out.println(ex);
	  }
  }

  	//product_cates
	public void addProductCate(String name) {
		try {
			String sql = "INSERT INTO product_cates (name) VALUES (?)";
			PreparedStatement ps = con.prepareStatement(sql);
		    ps.setString(1, name);
		    int a = ps.executeUpdate();
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	public void modProductCate(String id, String name) {
		try {
			String sql = "UPDATE product_cates SET name = ? WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	public void delProductCate(String id) {
		try {
			String sql = "DELETE FROM product_cates WHERE id = " + id;
			int a = stmt.executeUpdate(sql);
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	//products
	public void addProduct(String name, String image, String description, String price, String firmID, String cateID) {
		try {
			//String sql = "INSERT INTO products (name, description, price, firm_id, cate_id) VALUES (?, ?, ?, ?, ?)";
			String sql = "INSERT INTO products (name, image, description, price, firm_id, cate_id) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
		    ps.setString(1, name);
		    ps.setString(2, image);
		    ps.setString(3, description);
		    ps.setString(4, price);
		    ps.setString(5, firmID);
		    ps.setString(6, cateID);
		    int a = ps.executeUpdate();
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	public void modProduct(String id, String name, String image, String description, String price) {
		try {
			String sql = "UPDATE products SET name = ?, image = ?, description = ?, price = ? WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, image);
			ps.setString(3, description);
			ps.setString(4, price);
			ps.setString(5, id);
			ps.executeUpdate();
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	public void delProduct(String name) {
		
	}


  public void deleteData(String id) {
    try {
      String sql = "DELETE FROM users WHERE id = " + id + ";";
      int a = stmt.executeUpdate(sql);
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public Connection getCon() {
    return con;
  }
  public ResultSet getRS() {
    return rs;
  }
  public ResultSet getRS1() {
	  return rs1;
  }
  public ResultSet getRS2() {
	  return rs2;
  }
  public ResultSet getRS3() {
	  return rs3;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public void setPort(String port) {
    this.port = port;
  }
  public void setUrl(String ip, String port) {
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName) {
    this.db = dbName;
  }
  public void setUser(String username) {
    this.user = username;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public void setDriver(String driver) {
    this.driver = driver;
  }
}

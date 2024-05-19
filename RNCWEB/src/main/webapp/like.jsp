<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;
    int likeCount = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:rncdb", "gocian", "1234");
        
        // Get current like count
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT CNT FROM CNT WHERE SEQ = 1");

        if (rs.next()) {
            likeCount = rs.getInt("CNT");
        }

        // Increment like count
        likeCount++;

        // Update like count in database
        pstmt = conn.prepareStatement("UPDATE CNT SET CNT = ? WHERE SEQ = 1");
        pstmt.setInt(1, likeCount);
        pstmt.executeUpdate();

        // Return new like count
        out.print(likeCount);
    } catch (Exception e) {
       e.printStackTrace(new java.io.PrintWriter(out));  // Print stack trace for debugging
    } finally {
       try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(new java.io.PrintWriter(out)); }
       try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(new java.io.PrintWriter(out)); }
       try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(new java.io.PrintWriter(out)); }
       try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(new java.io.PrintWriter(out)); }
    }
%>
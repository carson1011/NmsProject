package com.example.demo.handler;

import com.example.demo.domain.DevHisVO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JavemysqlHandler {

    public static Connection getConnection() throws SQLException{
        Connection conn = null;
        String jdbcUrl = "jdbc:log4jdbc:mysql://localhost:3307/c_nms_iot?characterEncoding=UTF-8&serverTimezone=UTC";
        String user = "root";
        String password = "mysql6805";
        conn = DriverManager.getConnection(jdbcUrl,user,password);

        return conn;
    }

    public void insert_rcvData(DevHisVO cmtdata) throws SQLException {
        int resultCnt = 0;
        Connection conn = getConnection();
        try {
            String sql = "insert into tb_apc_his(mac,incnt,outcnt,stempture_r,imapid) " +
                    "values (?,?,?,?,(" +
                    "select iid from tb_apc_dev where mac=?));";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,cmtdata.getMac());
            pstmt.setInt(2,cmtdata.getIncnt());
            pstmt.setInt(3,cmtdata.getOutcnt());
            pstmt.setString(4,cmtdata.getStempture_r());
            pstmt.setString(5,cmtdata.getMac());
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            /*System.out.println("insert_rcvDate : "+resultCnt);*/
        }
    }



    /*public void upsert_CntArea() throws SQLException{
        int resultCnt = 0;
        Connection conn = getConnection();
        try {
            String sql = "insert into tb_cnt_area(imapid, incnt, outcnt, occucnt, iparentid) " +
                    "values (" +
                    "(select imapid, sum),?,?,?," +
                    "(select iparent from tb_map where iid = ?))" +
                    "ON Duplicate KEY UPDATE incnt = ?, outcnt = ?, occucnt = ?;";
            *//*PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,cmtdata.getMac());
            pstmt.setInt(2,cmtdata.getIncnt());
            pstmt.setInt(3,cmtdata.getOutcnt());
            pstmt.setString(4,cmtdata.getStempture_r());*//*
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            System.out.println("insert_rcvDate : "+resultCnt);
        }
    }*/
}

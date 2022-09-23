package com.example.demo.handler;

import com.example.demo.domain.CntAreaVO;
import com.example.demo.domain.DevHisVO;
import com.example.demo.domain.DeviceVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.ConsoleHandler;

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
    public boolean preinsert_getdev(String mac) throws SQLException{
        System.out.println("preinsert_getdev.do");
        boolean bexist = false;
        Connection conn = getConnection();
        try {
            String sql = "select exists (select mac from tb_apc_dev where mac = ?) as b;;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,mac);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                bexist = (rs.getInt("b") != 0);
            }
            pstmt.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {

        }
        return bexist;
    }

    public List<CntAreaVO> getinstalled_imapid(String stDate) throws SQLException{
        List<CntAreaVO> cntAreaVOArrayList = new ArrayList<>();

        Connection conn = getConnection();
        try {
            /*시간 비교해서 검색*/
            /*select imapid,sum(incnt) as incnt, sum(outcnt) as outcnt, (sum(incnt) - sum(outcnt)) as occucnt from tb_apc_his
                where DATE_FORMAT(stDateTime,'%y-%m-%d %H') > date_format(now(),'%y-%m-%d 01')
                group by imapid*/
            String sql = "select imapid, sum(incnt) as incnt, sum(outcnt) as outcnt, (sum(incnt) - sum(outcnt)) as occucnt from tb_apc_his " +
                    "where DATE_FORMAT(stDateTime,'%y-%m-%d')=date_format(now(),'%y-%m-%d') " +
                    "group by imapid ;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                CntAreaVO cntAreaVO = new CntAreaVO();
                cntAreaVO.setImapid(rs.getInt("imapid"));
                cntAreaVO.setIncnt(rs.getInt("incnt"));
                cntAreaVO.setOutcnt(rs.getInt("outcnt"));
                cntAreaVO.setOccucnt(rs.getInt("occucnt"));
                cntAreaVOArrayList.add(cntAreaVO);
            }
            pstmt.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {

        }
        return cntAreaVOArrayList;
    }

    public void upsert_CntArea(CntAreaVO cmtdata) throws SQLException{
        int resultCnt = 0;
        Connection conn = getConnection();
        try {
            String sql = "insert into tb_cnt_area(imapid, incnt, outcnt, occucnt, iparentid) " +
                    "values (?,?,?,?," +
                    "(select iparent from tb_map where iid = ?))" +
                    "ON Duplicate KEY UPDATE incnt = ?, outcnt = ?, occucnt = ?;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cmtdata.getImapid());
            pstmt.setInt(2,cmtdata.getIncnt());
            pstmt.setInt(3,cmtdata.getOutcnt());
            pstmt.setInt(4,cmtdata.getOccucnt());
            pstmt.setInt(5,cmtdata.getImapid());
            pstmt.setInt(6,cmtdata.getIncnt());
            pstmt.setInt(7,cmtdata.getOutcnt());
            pstmt.setInt(8,cmtdata.getOccucnt());
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            System.out.println("insert_rcvDate : "+resultCnt);
        }
    }
}

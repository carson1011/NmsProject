package com.example.demo.config;

import com.ctc.wstx.util.StringUtil;
import com.example.demo.controller.DeviceController;
import com.example.demo.domain.DevHisVO;
import com.example.demo.handler.JavemysqlHandler;
import com.sun.xml.internal.ws.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UdpServer implements ApplicationListener<ContextRefreshedEvent> {

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        udpServer();
    }

    private static void udpServer() {

        JavemysqlHandler javemysqlHandler = new JavemysqlHandler();
        DevHisVO devHisVO = new DevHisVO();


        try {

            // 상대방이 연결할수 있도록 UDP 소켓 생성
            DatagramSocket dsoc = new DatagramSocket(13834);
            // 전송받은 데이터를 지정할 바이트 배열선언
            byte[] data = new byte[255];

            // UDP 통신으로 전송을 받을 packet 객체생성
            DatagramPacket dp = new DatagramPacket(data, data.length);

            System.out.println("데이터 수신 준비 완료....");
            while (true) {
                // 데이터 전송 받기
                dsoc.receive(dp);
                // 데이터 보낸곳 확인
                // 보낸 데이터를 Utf-8에 문자열로 변환
                String dev_IpAddress = dp.getAddress().toString();
                dev_IpAddress = dev_IpAddress.replace("/","");
                String msg = new String(dp.getData(), "UTF-8");
                String[] tmp_array = msg.split(";");
                String[] array_data = tmp_array[0].split(",");
                System.out.println(" 송신 IP : " + dev_IpAddress);
                System.out.println("보내 온 내용  : " + msg);
                /*String eM = "", eI = "", eO = "", eT = "";*/
                for (String element : array_data) {
                    String[] eq_array = element.split("=");
                    /*System.out.println("element : "+element);
                    System.out.println("eq_array[0] : "+eq_array[0]);
                    System.out.println("eq_array[1] : "+eq_array[1]);*/
                    if (eq_array[0].equals("M")){
                        devHisVO.setMac(eq_array[1]);
                        /*System.out.println("eM : "+eM);*/
                    }
                    else if (eq_array[0].equals("I")){
                        devHisVO.setIncnt(Integer.parseInt(eq_array[1]));
                        /*System.out.println("eI : "+eI);*/
                    }
                    else if (eq_array[0].equals("O")){
                        devHisVO.setOutcnt(Integer.parseInt(eq_array[1]));
                        /*System.out.println("eO : "+eO);*/
                    }
                    else if (eq_array[0].equals("T")){
                        devHisVO.setStempture_r(eq_array[1]);
                       /* System.out.println("eT : "+eT);*/
                    }
                }
                /*insert 가능 조건 설정*/
                if(javemysqlHandler.preinsert_getdev(devHisVO.getMac()) &&
                        (devHisVO.getIncnt() != 0 || devHisVO.getOutcnt() != 0)){
                    javemysqlHandler.insert_rcvData(devHisVO);
                    javemysqlHandler.update_devip(dev_IpAddress,devHisVO.getMac());
                }
                else
                    ;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

package org.project.media_comment.domain;

import java.util.Date;

/**
 * Created by pose2 on 2017-09-02.
 */
public class PercentMapVO {

    private int percentMapId;
    private int mapOrder; // 나중에 연산을위해 몇번째 갱신된 맵인지 확인하기위한 변수
    private int reply_id;
    private double[][] map;
    private String mapStr;

    public PercentMapVO(){};

    public PercentMapVO(int reply_id, String mapStr) {
        this.reply_id = reply_id;
        this.mapStr = mapStr;
    }

    public PercentMapVO(int percentMapId, int mapOrder, int reply_id, double[][] map, String mapStr) {
        this.percentMapId = percentMapId;
        this.mapOrder = mapOrder;
        this.reply_id = reply_id;
        this.map = map; // [731][431] 짜리로해야함 상대좌표 맥스값임.
        this.mapStr = mapStr;
    }

    public PercentMapVO(int percentMapId, int mapOrder, int reply_id, String mapStr) {
        this.percentMapId = percentMapId;
        this.mapOrder = mapOrder;
        this.reply_id = reply_id;
        this.mapStr = mapStr;
    }
    public String getMapStr() {
        return mapStr;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public int getPercentMapId() {
        return percentMapId;
    }

    public void setMapStr(String mapStr) {this.mapStr = mapStr;}

    public void setPercentMapId(int percentMapId) {
        this.percentMapId = percentMapId;
    }

    public int getMapOrder() {
        return mapOrder;
    }

    public void setMapOrder(int mapOrder) {
        this.mapOrder = mapOrder;
    }

    public double[][] getMap() {
        return map;
    }

    public void setMap(double[][] map) {
        this.map = map;
    }
}

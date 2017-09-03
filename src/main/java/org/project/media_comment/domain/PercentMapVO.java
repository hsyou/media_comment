package org.project.media_comment.domain;

import java.util.Date;

/**
 * Created by pose2 on 2017-09-02.
 */
public class PercentMapVO {

    private int percentMapId;
    private int mapOrder; // 나중에 연산을위해 몇번째 갱신된 맵인지 확인하기위한 변수
    private double[][] map;
    private Date validTime; // 이 퍼센트 맵이 유효한 시간 저장.(시간대별로 댓글이 달라지므로)

    public PercentMapVO(int percentMapId, int mapOrder, double[][] map, Date validTime) {
        this.percentMapId = percentMapId;
        this.mapOrder = mapOrder;
        this.map = map;
        this.validTime = validTime;
    }

    public int getPercentMapId() {
        return percentMapId;
    }

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

    public Date getValidTime() {
        return validTime;
    }

    public void setValidTime(Date validTime) {
        this.validTime = validTime;
    }
}

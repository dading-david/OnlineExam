package com.sise.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class TestPaper{
    private Integer tpId;
    private Integer teacherId;
    private String tpName;
    private Date tpStartTime;
    private String tpTimeLength;
    private String tpType;
    /*一对多映射，一套试卷，对应很多题目*/
    private List<Single> single;

    public Integer getTpId() {
        return tpId;
    }

    public void setTpId(Integer tpId) {
        this.tpId = tpId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTpName() {
        return tpName;
    }

    public void setTpName(String tpName) {
        this.tpName = tpName;
    }

    public Date getTpStartTime() {
        return tpStartTime;
    }

    public void setTpStartTime(Date tpStartTime) {
        this.tpStartTime = tpStartTime;
    }

    public String getTpTimeLength() {
        return tpTimeLength;
    }

    public void setTpTimeLength(String tpTimeLength) {
        this.tpTimeLength = tpTimeLength;
    }

    public String getTpType() {
        return tpType;
    }

    public void setTpType(String tpType) {
        this.tpType = tpType;
    }

    public List<Single> getSingle() {
        return single;
    }

    public void setSingle(List<Single> single) {
        this.single = single;
    }

    @Override
    public String toString() {
        return "TestPaper{" +
                "tpId=" + tpId +
                ", teacherId=" + teacherId +
                ", tpName='" + tpName + '\'' +
                ", tpStartTime=" + tpStartTime +
                ", tpTimeLength='" + tpTimeLength + '\'' +
                ", tpType='" + tpType + '\'' +
                ", single=" + single +
                '}';
    }
}

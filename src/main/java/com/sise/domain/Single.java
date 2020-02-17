package com.sise.domain;

/**
 * 单选题题库
 */
public class Single {
    private int singleId;             //题目id
    private int tpId;                   //试卷id
    private String singleTitle;       //题目标题
    private String singleA;           //A选项
    private String singleB;           //B选项
    private String singleC;           //C选项
    private String singleD;           //D选项
    private String singleAnswer;      //正确答案
    private String singleAnalyze;     //试题分析


    public int getSingleId() {
        return singleId;
    }

    public void setSingleId(int singleId) {
        this.singleId = singleId;
    }

    public int getTpId() {
        return tpId;
    }

    public void setTpId(int tpId) {
        this.tpId = tpId;
    }

    public String getSingleTitle() {
        return singleTitle;
    }

    public void setSingleTitle(String singleTitle) {
        this.singleTitle = singleTitle;
    }

    public String getSingleA() {
        return singleA;
    }

    public void setSingleA(String singleA) {
        this.singleA = singleA;
    }

    public String getSingleB() {
        return singleB;
    }

    public void setSingleB(String singleB) {
        this.singleB = singleB;
    }

    public String getSingleC() {
        return singleC;
    }

    public void setSingleC(String singleC) {
        this.singleC = singleC;
    }

    public String getSingleD() {
        return singleD;
    }

    public void setSingleD(String singleD) {
        this.singleD = singleD;
    }

    public String getSingleAnswer() {
        return singleAnswer;
    }

    public void setSingleAnswer(String singleAnswer) {
        this.singleAnswer = singleAnswer;
    }

    public String getSingleAnalyze() {
        return singleAnalyze;
    }

    public void setSingleAnalyze(String singleAnalyze) {
        this.singleAnalyze = singleAnalyze;
    }

    @Override
    public String toString() {
        return "Single{" +
                "singleId=" + singleId +
                ", tpId=" + tpId +
                ", singleTitle='" + singleTitle + '\'' +
                ", singleA='" + singleA + '\'' +
                ", singleB='" + singleB + '\'' +
                ", singleC='" + singleC + '\'' +
                ", singleD='" + singleD + '\'' +
                ", singleAnswer='" + singleAnswer + '\'' +
                ", singleAnalyze='" + singleAnalyze + '\'' +
                '}';
    }
}

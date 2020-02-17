package com.sise.domain.student;

import org.springframework.stereotype.Component;

@Component(value = "studentExam")
public class StudentExam {
    private int stuId;
    private int tpId;
    private double examScore;
    private String examAnswer;
    private String examTime;

    public int getStuId() {
        return stuId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public int getTpId() {
        return tpId;
    }

    public void setTpId(int tpId) {
        this.tpId = tpId;
    }

    public double getExamScore() {
        return examScore;
    }

    public void setExamScore(double examScore) {
        this.examScore = examScore;
    }

    public String getExamAnswer() {
        return examAnswer;
    }

    public void setExamAnswer(String examAnswer) {
        this.examAnswer = examAnswer;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }
}

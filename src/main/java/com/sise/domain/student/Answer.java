package com.sise.domain.student;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//接受ajax请求，临时存放答案
@Component(value = "answer")
public class Answer {
    public Map maps(int totalCount){
        Map<Integer,String> maps = new HashMap<>();
        for (int i = 1; i <= totalCount ; i++) {
            maps.put(i,"i");
        }
        return maps;
    }
    public List lists(int totalCount){
        List<String> lists = new ArrayList<>();
        for (int i = 0; i <= totalCount ; i++) {
            lists.add(i,"i");
        }
        return lists;
    }
}

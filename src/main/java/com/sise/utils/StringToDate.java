package com.sise.utils;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.Nullable;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDate implements Converter<String,Date>{
    @Nullable
    @Override
    public Date convert(String s) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return df.parse(s);
        } catch (Exception e) {
            throw new RuntimeException("转换出现错误");
        }
    }
}

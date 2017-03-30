package com.yr.demo.test;

import com.google.gson.Gson;
import com.yr.demo.bean.Student;
import org.junit.Test;

import java.util.*;

/**
 * Created by Administrator on 2016/11/25.
 */
public class TestGson {
    @Test
    public void test01(){
        //创建一个Student对象
        Student student = new Student("问亚兵","男",23,"北京市丰台区");
        //创建Gson对象
        Gson gson = new Gson();

        //将java对象转换为json
        String JSON = gson.toJson(student);
        System.out.println(JSON);
        //将json字符串转换为java对象
        Student stu = gson.fromJson(JSON,Student.class);
        System.out.println(stu.getName());
    }
    @Test
    public void test02(){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("name","问亚兵");
        map.put("gender","男");
        map.put("age",24);
        map.put("address","北京市丰台区");
        Gson gson = new Gson();
        //将map对象转为json字符串
        String JSON = gson.toJson(map);
        System.out.println(JSON);
        //将json字符串转换为map
        Map<String,Object> tem = gson.fromJson(JSON,Map.class);
        System.out.println(tem);
        for(String key:tem.keySet()){
            System.out.println(key+"---"+map.get(key));
        }
    }
    @Test
    public void test03(){
        List list = new ArrayList();
        list.add(new Student("李雷","男",18,"北京"));
        list.add(new Student("韩梅梅","女",18,"上海"));
        list.add(new Student("Lucy","女",19,"广州"));
        list.add(new Student("Jack","男",19,"深圳"));
        //将list转为json字符串
        Gson gson = new Gson();
        String JSON = gson.toJson(list);
        System.out.println(JSON);
        //将json字符串转为list对象
        List stuList = gson.fromJson(JSON,list.getClass());
        System.out.println(stuList);
        for (Object student:stuList){
            System.out.println(student);
        }
    }
}

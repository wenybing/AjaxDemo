package com.yr.demo.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/23.
 */
public class AJAXServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //向控制台输出一段话
        System.out.println("报告，已收到ajax发送的GET请求，OVER");
        resp.getWriter().print("Hello AJAX!");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决响应乱码
        resp.setContentType("text/xml;charset=utf-8");
        //向控制台输出一段话
        System.out.println("报告，已收到ajax发送的POST请求，OVER");
        String userName = req.getParameter("username");
        System.out.println(userName);
        //返回一个响应信息
//        resp.getWriter().print("你好 AJAX!");
        //XML数据格式的数据
//        String XMLData = "<student><name>问亚兵</name><gender>男</gender><age>23</age><address>北京市丰台区</address></student>";
//        resp.getWriter().print(XMLData);

        //创建一个JSON字符串
        String json = "{\"name\":\"孙悟空\",\"age\":18,\"gender\":\"男\",\"address\":\"花果山\"}";

        //返回一个json字符串
        resp.getWriter().print(json);
    }
}

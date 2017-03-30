<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/24
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; ISO-8859-1ml;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <script type="text/javascript">
    window.onload = function(){
      var button01 = document.getElementById("btn01");
      //获取btn01
      var buttn01 = document.getElementById("btn01");
      //为按钮绑定单机响应函数
      buttn01.onclick = function(){
        //创建xmlHttpRequest对象
        var xhr = new XMLHttpRequest();
        //设置请求信息
        //xhr的open用来设置请求信息，它需要如下几个参数
        /*
         method:指定请求的方式 get或post，需要一个字符串
         url:发送请求的地址，该地址由浏览器解析，所以设置绝对路径时需要加上项目名
         async:发送的请求是否是异步请求，需要一个布尔值，默认值是true，一般不设置。
         username，password:当访问需要提供用户名密码的地址需要设置，一般不设置
         */
        //IE浏览器向相同的地址发送请求时，会自动使用缓存
        xhr.open("get","/AJAXDemo/AJAXServlet?t="+Math.random());
        //发送请求信息
        //send方法用来发送请求，方法需要一个参数，用来设置请求体
        //post请求可以通过它来设置请求参数，get请求没有请求体，可以不传参数
        xhr.send();
        //获取请求的状态
        /*
         0: 请求未初始化 ,xhr对象刚刚创建
         1: 服务器连接已建立 ,请求信息已设置,请求还未发送到服务器
         2: 请求已接收
         3: 请求处理中
         4: 请求已完成，且响应已就绪
         */
        //4.接收响应
        //我们需要在xhr的readyState为4时，才去获取响应
        //onreadystatechange这个事件，会在每次readyState值改变时触发
        xhr.onreadystatechange = function(){
          if(xhr.readyState==4 && xhr.status == 200){
            var text = xhr.responseText;
            alert(text);
          }
        }
      };

      var button02 = document.getElementById("btn02");
      button02.onclick = function(){
        //创建XMLHttpRequest对象
        var xhr = new XMLHttpRequest();
        //设置请求信息
        xhr.open("post","/AJAXDemo/AJAXServlet?t="+Math.random());
        //发送请求信息
        //在发送post请求时，我们为他设置一个请求头
        //setRequestHeader()用来设置请求头
        // xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        /*
         需要两个参数：
         1.请求头的名字
         2.请求头的值
         Content-type:application/x-www-form-urlencoded
         这个头表示请求体中的内容将会使用url编码。
         */
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("username=wenyabing");
        //接收响应信息
        xhr.onreadystatechange = function(){
          if(xhr.readyState == 4 && xhr.status == 200){
            var result = xhr.responseText;
            alert(result);
          }
        }
      }


        var button03 = document.getElementById("btn03");
        button03.onclick = function(){
            //创建XMLHttpRequest对象
            var xhr = new XMLHttpRequest();
            //设置请求信息
            xhr.open("post","/AJAXDemo/AJAXServlet?t="+Math.random());
            //发送请求信息
            //在发送post请求时，我们为他设置一个请求头
            //setRequestHeader()用来设置请求头
            // xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            /*
             需要两个参数：
             1.请求头的名字
             2.请求头的值
             Content-type:application/x-www-form-urlencoded
             这个头表示请求体中的内容将会使用url编码。
             */
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send("username=wenyabing");
            //接收响应信息
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    debugger;
                    var result = xhr.responseXML;
                    var elements = result.getElementsByTagName("name");
                    alert(elements);
                }
            }
        }

        var button04 = document.getElementById("btn04");
        button04.onclick = function(){
            //创建XMLHttpRequest对象
            var xhr = new XMLHttpRequest();
            //设置请求信息
            xhr.open("post","/AJAXDemo/AJAXServlet?t="+Math.random());
            //发送请求信息
            //在发送post请求时，我们为他设置一个请求头
            //setRequestHeader()用来设置请求头
            // xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            /*
             需要两个参数：
             1.请求头的名字
             2.请求头的值
             Content-type:application/x-www-form-urlencoded
             这个头表示请求体中的内容将会使用url编码。
             */
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send("username=wenyabing");
            //接收响应信息
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    //获取响应信息
                    var text = xhr.responseText;
                    //将text转换为js对象
                    var obj = JSON.parse(text);
                    alert(obj.address);
                    //将js对象转换为字符串
                    var str = JSON.stringify(obj);
                    alert(str);
                }
            }
        }
    };
  </script>
</head>
<body>
    <button id="btn01">发送GET请求</button><br/><br/>
    <button id="btn02">发送POST请求</button><br/><br/>
    <button id="btn03">获取XML格式的数据</button><br/><br/>
    <button id="btn04">获取JSON格式的数据</button><br/><br/>
</body>
</html>

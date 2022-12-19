let xhr=new XMLHttpRequest();
xhr.onreadystatechange = function(){
  if (xhr.readyState == 4){//已接收到全部的相应数据
    if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304){//304表示请求的资源没被改，直接用浏览器的缓存
        alert(xhr.responseText);
    } else {
        alert("Request was unsuccessful: " + xhr.status);
    }
  }
};
xhr.open("get", "example.txt", true);//是否异步 true异步 false同步
xhr.send(null);
``
默认情况下，在发送XHR 请求的同时，还会发送下列头部信息。
 Accept：浏览器能够处理的内容类型。
 Accept-Charset：浏览器能够显示的字符集。
 Accept-Encoding：浏览器能够处理的压缩编码。
 Accept-Language：浏览器当前设置的语言。
 Connection：浏览器与服务器之间连接的类型。
 Cookie：当前页面设置的任何Cookie。
 Host：发出请求的页面所在的域 。
 Referer：发出请求的页面的URI。注意，HTTP 规范将这个头部字段拼写错了，而为保证与规
范一致，也只能将错就错了。（这个英文单词的正确拼法应该是referrer。）
 User-Agent：浏览器的用户代理字符串。
虽然不同浏览器实际发送的头部信息会有所不同，但以上列出的基本上是所有浏览器都会发送的。
经常设置的请求头是

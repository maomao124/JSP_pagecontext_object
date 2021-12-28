<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSP_pagecontext_object
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2021/12/28
  Time(创建时间)： 13:52
  Description(描述)：
  pageContext 是 javax.servlet.jsp.PageContext 的实例对象。pageContext 对象表示整个 JSP 页面，可以获取或删除以下对象的任意属性：
page
request
session
application
pageContext 常用的方法如下：
pageContext 常用的方法
方  法	说  明
Object findAttribute (String AttributeName)	按 page、request、session、application 的顺序查找指定的属性，并返回对应的属性值。如果没有相应的属性，则返回 NULL
Object getAttribute (String AttributeName, int Scope)	在指定范围内获取属性值。与 findAttribute 不同的是，getAttribute 需要指定查找范围
void removeAttribute(String AttributeName, int Scope)	在指定范围内删除某属性
void setAttribute(String AttributeName, Object AttributeValue, int Scope)	在指定范围内设置属性和属性值
Exception getException()	返回当前页的 Exception 对象
ServletRequest getRequest()	返回当前页的 request 对象
ServletResponse getResponse()	返回当前页的 response 对象
ServletConfig getServletConfig()	返回当前页的 ServletConfig 对象
HttpSession getSession()	返回当前页的 session 对象
Object getPage()	返回当前页的 page 对象
ServletContext getServletContext()	返回当前页的 application 对象
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("info", "request范围的值");
    session.setAttribute("info", "session范围的值");
    application.setAttribute("info", "application范围的值");
%>
利用 pageContext 取出以下范围内各值(方法一)：
<br> request 设定的值：<%=pageContext.getRequest().getAttribute("info")%>
<br> session 设定的值：<%=pageContext.getSession().getAttribute("info")%>
<br> application 设的值：<%=pageContext.getServletContext().getAttribute("info")%>
<hr>
利用pageContext取出以下范围内各值(方法二)：
<br> 范围1(page)内的值：<%=pageContext.getAttribute("info", 1)%>
<br> 范围2(request)内的值：<%=pageContext.getAttribute("info", 2)%>
<br> 范围3(session)内的值：<%=pageContext.getAttribute("info", 3)%>
<br> 范围4(application)内的值：<%=pageContext.getAttribute("info", 4)%>
<hr>
利用 pageContext 修改或删除某个范围内的值：
<%
    pageContext.setAttribute("info", "修改request范围的值", 2);
%>
<br> 修改 request 设定的值：
<br>
<%=pageContext.getRequest().getAttribute("info")%>
<br>
<%
    pageContext.removeAttribute("info");
%>
删除 session 设定的值：<%=session.getAttribute("info")%>
</body>
</html>

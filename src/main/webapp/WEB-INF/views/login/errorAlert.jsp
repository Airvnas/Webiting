<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%-- isErrorPage="ture"를 주자 (주면 exception내장객체 사용 가능) --%>
<%
	response.setStatus(200);
%>
<script>
	alert('<%=exception.getMessage()%>')
	history.back();
</script>
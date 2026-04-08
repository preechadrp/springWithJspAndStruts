<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input</title>
</head>
<body>

<h2>Form Test</h2>

<s:form action="submit" method="post">
    <s:textfield name="username" label="Username"/>
    <s:password name="password" label="Password"/>
    <s:submit value="Submit"/>
</s:form>

</body>
</html>
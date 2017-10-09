<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><fmt:message code="registration.title"/></title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js" type="text/javascript"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function checkForm() {
            var buttonSubmit = document.getElementById("btnSubmit");
            var mEmail = document.getElementById("errorEmail");
            var mPassLen = document.getElementById("errorPasswordLen");
            var mPassMatch = document.getElementById("errorPasswordMatch");
            var mName = document.getElementById("errorName");
            var iEmail = document.getElementById("inputEmail");
            var iPass1 = document.getElementById("inputPassword1");
            var iPass2 = document.getElementById("inputPassword2");
            var iName = document.getElementById("inputName");
            buttonSubmit.disabled = true;
            mEmail.hidden = true;
            mPassLen.hidden = true;
            mPassMatch.hidden = true;
            var emailCheck = (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(iEmail.value));
            var passLenCheck = iPass1.value.length > 7 && iPass1.value.length < 16;
            var passCheck = iPass1.value === iPass2.value;
            var nameCheck = iName.value.length > 2;
            buttonSubmit.disabled = !(passCheck && emailCheck && passLenCheck && nameCheck);
            mEmail.hidden = emailCheck;
            mPassLen.hidden = passLenCheck || !emailCheck;
            mPassMatch.hidden = passCheck || !passLenCheck || !emailCheck;
            mName.hidden = nameCheck || !passCheck || !passLenCheck || !emailCheck;
        }
    </script>
</head>
<body style="padding: 25px;">
<div class="container">
    <form class="form-signin" id="formRegister" action="register" method="post"
          style="max-width: 320px; margin: 0 auto; font-size: larger;">
        <h3 class="form-signin-heading" align="center">CRM "CRIUS"</h3>
        <h4 class="form-signin-heading" align="center"><fmt:message code="registration.header"/></h4>
        <div class="form-group">
            <label for="inputEmail" class="sr-only">Email</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="<fmt:message code="registration.email.address"/>" name="email"
                   required autofocus style="z-index: 2;" onchange="checkForm()">
            <h5 id="errorEmail" style="color: red" align="center" hidden><fmt:message code="registration.error.email"/></h5>
        </div>
        <div class="form-group">
            <label for="inputPassword1" class="sr-only"><fmt:message code="registration.password.password"/></label>
            <input type="password" id="inputPassword1" class="form-control" placeholder="<fmt:message code="registration.password.password"/>" name="password"
                   required onchange="checkForm()">
            <label for="inputPassword2" class="sr-only"><fmt:message code="registration.password.verification"/></label>
            <input type="password" id="inputPassword2" class="form-control" placeholder="<fmt:message code="registration.password.verification"/>"
                   name="password2" required onchange="checkForm()">
            <h5 id="errorPasswordMatch" style="color: red" align="center" hidden><fmt:message code="registration.error.password.match"/></h5>
            <h5 id="errorPasswordLen" style="color: red" align="center" hidden><fmt:message code="registration.error.password.length"/></h5>
        </div>
        <div class="form-group">
            <label for="inputName" class="sr-only"><fmt:message code="registration.name"/></label>
            <input type="text" id="inputName" class="form-control" placeholder="<fmt:message code="registration.name"/>" name="name"
                   required maxlength="100" onchange="checkForm()">
            <h5 id="errorName" style="color: red" align="center" hidden><fmt:message code="registration.error.name"/></h5>
        </div>
        <div class="form-group">
            <label for="inputLanguage" class="sr-only"><fmt:message code="registration.language"/></label>
            <select class="form-control" id="inputLanguage" name="language" required>
                <c:forEach var="language" items="${requestScope.languageList}">
                    <option value="<c:out value="${language.id}"/>"><c:out value="${language.name}"/></option>
                </c:forEach>
            </select>
            <c:forEach var="entry" items="${requestScope.serviceMessageMap.entrySet()}">
                <h5 style="color: red" align="center"><fmt:message code="${entry.getKey()}"/>: ${entry.getValue()}</h5>
            </c:forEach>
        </div>
        <button class="btn btn-primary btn-block" id="btnSubmit" type="submit" disabled><fmt:message code="registration.account"/></button>
        <br><a class="hyperlink" href="login"><fmt:message code="registration.login.page"/></a>
    </form>
</div>
</body>
</html>

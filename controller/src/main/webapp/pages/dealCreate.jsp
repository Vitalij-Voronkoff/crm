<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title><fmt:message code="new.deal.title.page"/></title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/bootstrapValidator.min.css"/>
    <script src="/resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/resources/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="/resources/js/dealCreate.js" type="text/javascript"></script>
</head>
<body onload="onBodyLoad()">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <jsp:include page="menu.jsp"/>
        </div>
        <div class="col-md-10" style="padding-left: 45px">
            <form class="form-horizontal" id="formDeal" name="formDeal" role="form" method="post" enctype="multipart/form-data">
                <fieldset id="fieldset_deal">
                    <legend><fmt:message code="new.deal.title.header"/></legend>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="deal_name"><fmt:message code="new.deal.name"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="deal_name" name="dealName" placeholder="<fmt:message code="new.deal.name"/>" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="deal_tags"><fmt:message code="new.deal.tags"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="deal_tags" name="dealTags" placeholder="<fmt:message code="new.deal.tags"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="deal_user_id"><fmt:message code="new.deal.responsible"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="deal_user_id" name="dealUserId" title="<fmt:message code="new.deal.responsible"/>" required>
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="user" items="${requestScope.userList}">
                                    <option value="<c:out value="${user.id}"/>"><c:out value="${user.name}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="deal_budget"><fmt:message code="new.deal.budget"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="number" min="0" step="0.01" id="deal_budget" name="dealBudget" placeholder="<fmt:message code="new.deal.budget"/>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="deal_stage"><fmt:message code="new.deal.stage"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" id="deal_stage" name="dealStage" list="stage_options" placeholder="<fmt:message code="new.deal.stage"/>" required>
                            <datalist id="stage_options">
                                <c:forEach var="stage" items="${requestScope.stageList}">
                                    <c:choose>
                                        <c:when test="${stage.id < 7}">
                                            <option value="<fmt:message code="${stage.name}"/>"></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="<c:out value="${stage.name}"/>"></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </datalist>
                        </div>
                    </div>

                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <fieldset id="fieldset_note">
                    <legend><fmt:message code="new.deal.note"/></legend>
                    <div class="form-group">
                        <div class="col-md-3"></div>
                        <div class="col-md-9">
                            <textarea class="form-control" id="note_text" name="noteText" placeholder="<fmt:message code="new.deal.note"/>" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <fieldset id="fieldset_file">
                    <legend><fmt:message code="new.deal.file"/></legend>
                    <div class="form-group">
                        <div class="col-md-3"></div>
                        <div class="col-md-9">
                            <input class="form-control" type="file" id="file_file" name="fileFile">
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <fieldset id="fieldset_contact">
                    <legend><fmt:message code="new.deal.contact.title"/></legend>
                    <div class="form-group" align="center">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="radio-inline">
                                <input type="radio" name="contactNew" value="0" onchange="contactNewChange(false)"><fmt:message code="new.deal.contact.choose.exist"/></label>
                        </div>
                        <div class="col-md-5">
                            <label class="radio-inline">
                                <input type="radio" name="contactNew" value="1" onchange="contactNewChange(true)" checked><fmt:message code="new.deal.contact.choose.new"/></label>
                        </div>
                    </div>
                    <div class="form-group contactExist" hidden>
                        <label class="control-label col-md-3" for="contact_id"><fmt:message code="new.deal.contact.contactExist"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="contact_id" name="contactId" title="<fmt:message code="new.deal.contact.contactExist"/>">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="contact" items="${requestScope.contactList}">
                                    <option value="<c:out value="${contact.id}"/>"><c:out value="${contact.name}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group contactNew">
                        <label class="control-label col-md-3" for="contact_name"><fmt:message code="new.deal.contact.name"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="contact_name" name="contactName" placeholder="<fmt:message code="new.deal.contact.name"/>">
                        </div>
                    </div>
                    <div class="form-group contactNew">
                        <label class="control-label col-md-3" for="contact_company_id"><fmt:message code="new.deal.contact.company"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="contact_company_id" name="contactCompanyId" title="<fmt:message code="new.deal.contact.companyName"/>">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="company" items="${requestScope.companyList}">
                                    <option value="<c:out value="${company.id}"/>"><c:out value="${company.name}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group contactNew">
                        <label class="control-label col-md-3" for="contact_position"><fmt:message code="new.deal.contact.position"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="contact_position" name="contactPosition" placeholder="<fmt:message code="new.deal.contact.position"/>">
                        </div>
                    </div>
                    <div class="form-group contactNew">
                        <div class="col-md-3">
                            <select class="form-control" name="contactTypePhone" title="<fmt:message code="new.deal.contact.typePhone"/>" style="font-weight: bold; text-align-last: right; -moz-text-align-last: right;">
                                <c:forEach var="typePhone" items="${requestScope.typeOfPhoneArray}">
                                    <option value="<c:out value="${typePhone.id}"/>"><fmt:message code="phones.${typePhone}"/>:</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-9">
                            <input class="form-control" type="tel" name="contactPhone" placeholder="<fmt:message code="new.deal.contact.phone"/>">
                        </div>
                    </div>
                    <div class="form-group contactNew">
                        <label class="control-label col-md-3" for="contact_email"><fmt:message code="new.deal.contact.email"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="email" id="contact_email" name="contactEmail" placeholder="<fmt:message code="new.deal.contact.email"/>">
                        </div>
                    </div>
                    <div class="form-group contactNew">
                        <label class="control-label col-md-3" for="contact_skype"><fmt:message code="new.deal.contact.skype"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="contact_skype" name="contactSkype" placeholder="<fmt:message code="new.deal.contact.skype"/>">
                        </div>
                    </div>

                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <fieldset id="fieldset_company">
                    <legend><fmt:message code="new.deal.company.title"/></legend>
                    <div class="form-group" align="center">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <label class="radio-inline">
                                <input type="radio" name="companyNew" value="0" onchange="companyNewChange(false)"><fmt:message code="new.deal.company.choose.exist"/></label>
                        </div>
                        <div class="col-md-5">
                            <label class="radio-inline">
                                <input type="radio" name="companyNew" value="1" onchange="companyNewChange(true)" checked><fmt:message code="new.deal.company.choose.new"/></label>
                        </div>
                    </div>
                    <div class="form-group companyExist" hidden>
                        <label class="control-label col-md-3" for="company_id"><fmt:message code="new.deal.company.companyExist"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="company_id" name="companyId" title="<fmt:message code="new.deal.company.companyExist"/>">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="company" items="${requestScope.companyList}">
                                    <option value="<c:out value="${company.id}"/>"><c:out value="${company.name}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group companyNew">
                        <label class="control-label col-md-3" for="company_name"><fmt:message code="new.deal.company.name"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="text" id="company_name" name="companyName" placeholder="<fmt:message code="new.deal.company.name"/>">
                        </div>
                    </div>
                    <div class="form-group companyNew">
                        <label class="control-label col-md-3" for="company_phone"><fmt:message code="new.deal.company.phone"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="tel" id="company_phone" name="companyPhone" placeholder="<fmt:message code="new.deal.company.phone"/>">
                        </div>
                    </div>
                    <div class="form-group companyNew">
                        <label class="control-label col-md-3" for="company_email"><fmt:message code="new.deal.company.email"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="email" id="company_email" name="companyEmail" placeholder="<fmt:message code="new.deal.company.email"/>">
                        </div>
                    </div>
                    <div class="form-group companyNew">
                        <label class="control-label col-md-3" for="company_web"><fmt:message code="new.deal.company.website"/>:</label>
                        <div class="col-md-9">
                            <input class="form-control" type="url" id="company_web" name="companyWeb" placeholder="<fmt:message code="new.deal.company.website"/>">
                        </div>
                    </div>
                    <div class="form-group companyNew">
                        <label class="control-label col-md-3" for="company_address"><fmt:message code="new.deal.company.address"/>:</label>
                        <div class="col-md-9">
                            <textarea class="form-control" id="company_address" name="companyAddress" rows="2" placeholder="<fmt:message code="new.deal.company.address"/>"></textarea>
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <fieldset id="fieldset_task">
                    <legend><fmt:message code="new.deal.task.title"/></legend>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="task_period"><fmt:message code="new.deal.task.dateTime.label"/>:</label>
                        <div class="col-md-3">
                            <select class="form-control" id="task_period" title="<fmt:message code="new.deal.task.dateTime.title"/>" onchange="taskPeriodChange()">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="period" items="${requestScope.typeOfPeriodArray}">
                                    <option value="<c:out value="${period.id}"/>"><fmt:message code="task.time.${period}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3" style="padding-left: 0; padding-right: 0;">
                            <input class="form-control" type="date" id="task_date" name="taskDate" title="<fmt:message code="new.deal.task.dateTime.date"/>" style="font-weight: bold; text-align: center; padding-left: 6px; padding-right: 6px;"/>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="task_time" name="taskTime" title="<fmt:message code="new.deal.task.dateTime.time"/>" style="font-weight: bold; text-align-last: center; padding-left: 6px; padding-right: 6px;">
                                <c:forEach var="taskTime" varStatus="status" items="${requestScope.taskTimeList}">
                                    <c:choose>
                                        <c:when test="${status.index > 0}">
                                            <option value="<c:out value="${status.index}"/>"><c:out value="${taskTime}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="<c:out value="${status.index}"/>"><fmt:message code="${taskTime}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="task_responsible_user_id"><fmt:message code="new.deal.task.responsible"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="task_responsible_user_id" name="taskUserId" title="<fmt:message code="new.deal.task.responsible"/>">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="user" items="${requestScope.userList}">
                                    <option value="<c:out value="${user.id}"/>"><c:out value="${user.name}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="task_type"><fmt:message code="new.deal.task.type"/>:</label>
                        <div class="col-md-9">
                            <select class="form-control" id="task_type" name="taskType" title="<fmt:message code="new.deal.task.type"/>">
                                <option disabled selected value style="display: none"></option>
                                <c:forEach var="taskType" items="${requestScope.taskTypeList}">
                                    <option><c:out value="${taskType}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="task_text"><fmt:message code="new.deal.task.text"/>:</label>
                        <div class="col-md-9">
                            <textarea class="form-control" id="task_text" name="taskText" rows="2" placeholder="<fmt:message code="new.deal.task.text"/>"></textarea>
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <input class="btn btn-default fieldReset" type="button" value="<fmt:message code="new.deal.button.reset.name"/>" title="<fmt:message code="new.deal.button.reset.title"/>">
                    </div>
                </fieldset>

                <div class="form-group" align="right">
                    <div class="btn-group">
                        <input class="btn btn-default" type="submit" value="<fmt:message code="new.deal.button.save.name"/>" title="<fmt:message code="new.deal.button.save.title"/>">
                        <input class="btn btn-default" type="reset" value="<fmt:message code="new.deal.button.resetAll.name"/>" title="<fmt:message code="new.deal.button.resetAll.title"/>" onclick="onResetAllClick()">
                        <input class="btn btn-default" type="reset" value="<fmt:message code="new.deal.button.cancel.name"/>" title="<fmt:message code="new.deal.button.cancel.title"/>" onclick="history.go(-1);">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:hidden value="%{id}" name="appid"></s:hidden>
<s:hidden value="%{assessment.id}" name="asmtid"></s:hidden>
<section class="content-header" style="text-align: center; margin-top:-35px;">
<h1>
 <i class="glyphicon glyphicon-th-list"></i>&nbsp;&nbsp;&nbsp;検査
  <b><s:property value="assessment.appId"/> - <s:property value="assessment.name"/></b>
  <small>
  <s:if test="!assessment.Finalized">
  	<button class="btn btn-default" style="z-index:999999" onClick="location.href='EditAssessment?action=get&aid=${assessment.id}&back=assessment'">編集</button>
  </s:if>
  <s:if test="assessment.InPr"> <span class="text-warning fa fa-eye"></span><b class="text-warning"> (査読中)</b></s:if>
  <s:if test="assessment.prComplete"> <span class="text-success fa fa-eye"></span><b class="text-success"> (査読完了)</b></s:if>
  <s:if test="notowner"> <span class="text-warning fa fa-warning"></span><b  class="text-warning"> (責任者)</b></s:if>
  <s:if test="assessment.Finalized"> <span class="text-primary fa fa-check"></span><b  class="text-primary"> 検査完了</b></s:if>
  </small>
</section>
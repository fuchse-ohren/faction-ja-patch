<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>

<bs:row>
	<bs:inputgroup name="App ID:" id="search_appid" colsize="2" ></bs:inputgroup>
	<bs:inputgroup name="検査対象名:" id="search_appname" colsize="2" ></bs:inputgroup>
	 <bs:select name="Assessor:" colsize="2" id="search_assessorid">
	 		<option value="">&nbsp;</option>
		 	<s:iterator value="users">
                      <option value="<s:property value="id"/>"><s:property value="fname"/> <s:property value="lname"/></option>
            </s:iterator>
	</bs:select>
</bs:row>
<br>
<bs:row>
	<bs:button size="md" color="primary" text="検索" id="searchBtn" colsize="2"></bs:button>
</bs:row>
<br>
<bs:row>
<div class="col-xs-12">
	<bs:datatable columns="App Id,名称,検査者,検査種別,開始日,検査終了日,完了日,報告書,編集,削除" classname="box-primary" id="searchResults"></bs:datatable>
</div>
</bs:row>


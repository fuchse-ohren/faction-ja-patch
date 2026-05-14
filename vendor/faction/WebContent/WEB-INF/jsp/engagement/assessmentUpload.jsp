<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>

<bs:row>
	     <bs:mco colsize="12">
	     <div class="form-group">
	     	<label>検査計画を送信</label>
	    	<input id="assessmentFiles" type="file"  name="file_data"/>
	     </div>
	     </bs:mco>
</bs:row>
<bs:row>
<bs:mco colsize="12">
 <a href="../assessments.csv">検査計画の雛型をダウンロード</a>
</bs:mco>
 </bs:row>
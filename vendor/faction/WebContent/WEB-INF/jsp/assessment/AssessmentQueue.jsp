<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fs" uri="/WEB-INF/UtilHandlers.tld" %>
<jsp:include page="../header.jsp" />
    <script src="../dist/js/assessment_queue.js"></script>
<style>
.circle {
	border-radius: 50%;
	padding:3px;
	font-size: small;
}
.circle2 {
	border-radius: 50%;
	width: 20px;
	height: 20px; 
	padding: 5px;
	font-size: x-small;
}
.text-warning{
color:#f39c12;
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="glyphicon glyphicon-th-list"></i> 検査一覧
       <s:if test="acengagement"><span class="text-warning fa fa-warning"></span><b  class="text-warning"> (責任者)</b>
      	<small>すべての検査を表示中</small>
      	</s:if>
      	<s:else>
      	<small>自分に割り当てられた検査</small>
      	</s:else>
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">



<div class="row">
            <div class="col-xs-12">
              <div class="box box-primary">
                <div class="box-body">
                  <table id="assessment_queue" class="table table-striped table-hover dataTable">
                    <thead class="theader">
                      <tr >
                        <th >AppId</th>
                        <th width="300px">名称</th>
                        <th width="300px">検査者</th>
                        <th>開始</th>
                        <th>終了</th>
                        <th width="300px">検出数</th>
                        <th width="120px">状態</th>
                        <th width="120px"></th>
                      </tr>
                    </thead>
                    <tbody >
					 <s:iterator  value="assessments" status="stat" var="asmt">
					 	<tr id="app<s:property value="id" />" onClick="goTo(${id })" class="tnoborder">
						<td><s:property value="appId"/></td>
						<td><s:property value="name"/></td>
						<td>
							<s:iterator value="assessor" status="stat">
								<s:if test="#stat.index > 0">,&nbsp;</s:if>
								<s:property value="fname"/>&nbsp;<s:property value="lname"/>
							</s:iterator>
						</td>
						<td><s:date name="start" format="yyy-MM-dd"/></td>
						<td><s:date name="end" format="yyy-MM-dd"/></td>
						<td>
							<fs:vulncount asmt="${asmt}" levels="${levels }"></fs:vulncount>
						</td>
						<td>
							<s:property value="status"/>
						</td>
						<td id="status<s:property value="id"/>">
								<span class="circle2 glyphicon glyphicon-book bg-gray circle2" title="報告書生成済"></span>
								<span class="circle2 glyphicon glyphicon-comment bg-gray" title="報告書査読中" ></span>
								<span class="circle2 glyphicon glyphicon-ok bg-gray" title="査読完了"></span>
							</td>
						</tr>
					</s:iterator>
					</tbody>
                    <tfoot>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
       </div>
 </div>
              
              


<jsp:include page="../footer.jsp" />
<!--<script src="../dist/js/app.js" ></script>-->
  </body>
</html>
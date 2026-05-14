<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>

<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="../plugins/iCheck/all.css">
<link rel="stylesheet" href="../plugins/ice.css">
<link href="../dist/css/throbber.css" media="all" rel="stylesheet" type="text/css" />
<script src="../plugins/ice_patched.js"></script>
<style>
.rating{
padding-left:0px;
}
.text-header{
	background: lightgray;
    color: black;
    padding-left: 10px;
    height: 20px;
}
.questions table {
	width: "100%";
}
.acceptGreen{
	color:green !important;
}
.rejectRed{
	color:red !important;
}
.lockUser{
	color:black
}
.disabled{
	background: lightgray;
}
.box-title u{
font-size: xx-large;
}
.meta {
font-weight: bold;
}
.catName {
color:white;
}
.scoreBody {
	background-color: lightGray;
	border-radius: 9px;
	text-align: center;
	padding-bottom: 5px;
	margin-bottom: 40px;
	width: 150px;
}

.scoreBody h3 {
	font-size: xxx-large;
	color: lightgray;
	border-top-right-radius: 9px;
	border-top-left-radius: 9px;
	margin-top: 0px;
}

.scoreBody span {
	font-size: large;
	font-weight: bold;
}
h3.None {
	background-color: #00a65a;
}

span.None {
	color: #00a65a;
}

h3.Low {
	background-color: #39cccc;
}

span.Low {
	color: #39cccc;
}

h3.Medium {
	background-color: #00c0ef;
}

span.Medium {
	color: #00c0ef;
}

h3.High {
	background-color: #f39c12;
}

span.High {
	color: #f39c12;
}

h3.Critical {
	background-color: #dd4b39;
}

span.Critical {
	color: #dd4b39;
}

h3.Recommended {
	background-color: #39cccc;
}

span.Recommended {
	color: #39cccc;
}

h3.Informational {
	background-color: #39cccc;
}

span.Informational {
	color: #39cccc;
}


</style>
<style>

    input[type='radio'] { transform: scale(2); margin-left: 20px;padding: 40px;}
    </style>
<link href="../plugins/jquery-confirm/css/jquery-confirm.css" media="all" rel="stylesheet" type="text/css" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="glyphicon glyphicon-eye-open"></i> 査読中: <b>[${asmt.appId}] -  ${asmt.name }</b> - <i>${asmt.assessor[0].fname} ${asmt.assessor[0].lname}</i>
      <small></small>
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">
  
  
<bs:row>
	<bs:mco colsize="12">
 <div class="nav-tabs-custom">
   <ul class="nav nav-tabs">
     <li class="active"><a href="#overview" data-toggle="tab">概要</a></li>
     <s:iterator value="sections" var="section">
		 <s:if test="#section == 'Default'">
			 <li><a href="#default" data-toggle="tab">脆弱性</a></li>
		 </s:if>
		 <s:else>
			 <li><a href="#<s:property value="section"/>" data-toggle="tab"><s:property value="#section.replace('_', ' ')"/> 脆弱性</a></li>
		 </s:else>
	</s:iterator>
     <li><a href="#tabfiles" data-toggle="tab">ファイル</a></li>
     <s:iterator value="checklists" var="cl">
     	<li><a href="#tabcl_${key}" data-toggle="tab"><s:property value="value[0].checklist"/> チェックリスト</a></li>
     </s:iterator>
   </ul>
   <div class="tab-content">
     <div class="tab-pane active" id="overview">
			  <bs:row>
				<bs:mco colsize="12">
			    <bs:box title="概要" type="primary">
					<bs:row>
					<bs:mco colsize="7">
					<div class="text-header" id="summary_header"></div>
			  		<textarea id="appsum" style="width: 100%" ><s:property value="replaceNewline(asmt.summary)" escapeHtml="false"/></textarea>
			  		</bs:mco>
			  		<bs:mco colsize="4">
						<div class="text-header">査読ノート <span id="summary_notes_header"></span></div>
			  			<textarea id="appsum_notes" style="width: 100%"><s:property value="asmt.pr_sum_notes"/></textarea>
			  		</bs:mco>
			  		<bs:mco colsize="1" style="padding-right:30px">
			  					<bs:row>
				  					<button class="btn btn-danger complete col-md-12" <s:if test="!showComplete">disabled</s:if>><i class="fa fa-check"></i> 査読完了</button><br><br>
				  				</bs:row>
			  		</bs:mco>
			  		</bs:row>
			  	</bs:box>
			  	</bs:mco>
			  </bs:row>
			   <bs:row>
				<bs:mco colsize="12">
			    <bs:box title="詳細 / 脅威分析 / 対象範囲" type="primary">
					<bs:row>
					<bs:mco colsize="7">
					<div class="text-header" id="risk_header"></div>
			  		<textarea id="risk" style="width: 100%" <s:if test="!showComplete">readOnly</s:if>><s:property value="replaceNewline(asmt.riskAnalysis)" escapeHtml="false"/></textarea>
			  		</bs:mco>
			  		<bs:mco colsize="4">
						<div class="text-header">査読ノート <span id="risk_notes_header"></span></div>
			  			<textarea id="risk_notes" style="width: 100%"><s:property value="asmt.pr_risk_notes"/></textarea>
			  		</bs:mco>
			  		<bs:mco colsize="1" style="padding-right: 30px">
			  					<bs:row>
				  					<button class="btn btn-danger complete col-md-12" <s:if test="!showComplete">disabled</s:if>><i class="fa fa-check"></i> 査読完了</button><br><br>
				  				</bs:row>
			  		</bs:mco>
			  		</bs:row>
			  	</bs:box>
			  	</bs:mco>
			  </bs:row>
		</div>
     <s:iterator value="sections" var="section">
		 <s:if test="#section == 'Default'">
			<div class="tab-pane" id="default">
		 </s:if>
		 <s:else>
			<div class="tab-pane" id="<s:property value="section"/>">
		 </s:else>
		 <!-- Begin -->
			  <s:iterator value="asmt.vulns" status="stat" var="v">
			  	${v.updateRiskLevels()}
			  	<s:if test="#v.section == #section || (#v.section == '' && #section == 'Default')">
				   <bs:row>
					<bs:mco colsize="12">
					<div id='' class='box box-warning'>
						<div class='box-header with-border'>
							<h3 class='box-title'><b style='color:lightgray'><u><s:property value="name"/></u></b></h3>
							</div>
							<div class='box-body'>
								<bs:row>
									<s:if test="asmt.type.cvss31 || asmt.type.cvss40">
									<bs:mco colsize="1" style="width: 170px">
										<div class="scoreBody" style="margin-top:5px">
											<h3 class="scoreBox <s:property value="overallStr"/>" id="score"> <s:property value="cvssScore"/></h3>
											<span class="severityBox <s:property value="overallStr"/>" id="severity"><s:property value="overallStr"/></span>
										</div>
									</bs:mco>
									<bs:mco colsize="2">
										<span class='meta'><u>分類:</u></span><br/>
										<span class='meta'><s:property value="category.name"/></span><br/>
										<br/>
										<span class='meta'><u>CVSS Vector:</u></span><br/>
										<span class='meta'><s:property value="cvssString"/></span><br/>
									</bs:mco>
									</s:if>
									<s:else>
									<bs:mco colsize="12">
										<div class='rating'>
											<span class='meta'>分類:</span><br/>
											<span class='catName'><s:property value="category.name"/></span><br/>
											<span class='meta'>深刻度:</span>
											<br>
											<span class='label ' title='Severity'>深刻度:<s:property value="overallStr"/></span>
											<span class='label ' title='Impact'>影響度:<s:property value="impactStr"/></span>
											<span class='label ' title='Likelihood'>悪用可能性:<s:property value="likelyhoodStr"/></span>
										</div>
										</bs:mco>
									</s:else>
								</bs:row>
								<bs:row>
									&nbsp;
								</bs:row>
								<bs:row>
								   
									<bs:mco colsize="7">
										<div class="text-header" >脆弱性概要<span id="vuln_desc['${id}']_header"></span></div>
										  <textarea id="vuln_desc['${id}']" style="width: 100%" <s:if test="!showComplete">readOnly</s:if>><s:property value="replaceNewline(description)" escapeHtml="false"/></textarea>
									  </bs:mco>
									  <bs:mco colsize="4">
										<div class="text-header" >査読ノート <span id="vuln_desc_notes['${id}']_header"></span></div>
										  <textarea id="vuln_desc_notes['${id}']" style="width: 100%"><s:property value="desc_notes"/></textarea>
									  </bs:mco>
									  
									  <bs:mco colsize="1" style="padding-right:30px">
											  <bs:row>
												  <button class="btn btn-danger complete col-md-12" <s:if test="!showComplete">disabled</s:if>><i class="fa fa-check"></i> 査読完了</button><br><br>
											  </bs:row>
									  </bs:mco>
									  </bs:row>
									<bs:row>
									<bs:mco colsize="7">
										<div class="text-header" >脆弱性推奨事項 <span id="vuln_rec['${id}']_header"></span></div>
										  <textarea id="vuln_rec['${id}']" style="width: 100%" <s:if test="!showComplete">readOnly</s:if>><s:property value="replaceNewline(recommendation)" escapeHtml="false"/></textarea>
									  </bs:mco>
									  <bs:mco colsize="4">
										<div class="text-header">査読ノート <span id="vuln_rec_notes['${id}']_header"></span></div>
										  <textarea id="vuln_rec_notes['${id}']" style="width: 100%"><s:property value="rec_notes"/></textarea>
									  </bs:mco>
									  <bs:mco colsize="1" style="padding-right:30px">
									  
										  <bs:row>
												  <button class="btn btn-danger complete col-md-12" <s:if test="!showComplete">disabled</s:if>><i class="fa fa-check"></i> 査読完了</button><br><br>
											  </bs:row>
								  </bs:mco>
								  </bs:row>
									<bs:row>
									<bs:mco colsize="7">
										<div class="text-header" >詳細 <span id="vuln_details['${id}']_header"></span></div>
										  <textarea id="vuln_details['${id}']" style="width: 100%" <s:if test="!showComplete">readOnly</s:if>><s:property value="replaceNewline(details)" escapeHtml="false"/></textarea>
									  </bs:mco>
									  <bs:mco colsize="4">
										<div class="text-header">査読ノート <span id="vuln_detail_notes['${id}']_header"></span></div>
										  <textarea id="vuln_detail_notes['${id}']" style="width: 100%"><s:property value="detail_notes"/></textarea>
									  </bs:mco>
									  <bs:mco colsize="1" style="padding-right:30px">
									  
										  <bs:row>
												  <button class="btn btn-danger complete col-md-12" <s:if test="!showComplete">disabled</s:if>><i class="fa fa-check"></i> 査読完了</button><br><br>
											  </bs:row>
								  </bs:mco>
								  </bs:row>
					  </div>
					  </div>
					  </bs:mco>
				  </bs:row>
				  </s:if>
			  </s:iterator>
		</div>
		 
		 <!-- End -->
	</s:iterator>
		<div class="tab-pane" id="tabfiles">
			<bs:row>
					<bs:mco colsize="6">
				    <bs:box title="添付" type="info">
				    <bs:datatable columns="name" classname="" id="uploadedFiles">
				    <s:iterator value="files">
				    <tr><td><a href="GetEngFile?name=<s:property value="uuid"/>"><s:property value="name"/></a></td></tr>
				    </s:iterator>
				    </bs:datatable>
				 	</bs:box>
				 	</bs:mco>
				 	</bs:row>
		</div>
		<s:iterator value="checklists">
		<div class="tab-pane" id="tabcl_${key}">
		
		  		<bs:datatable columns="項目,絞り込み: <a class='filter' href=#pass>合格</a> - <a class='filter' href=#fail>失格</a> - <a class='filter' href=#incom>未完了</a> - <a class='filter' href=#na>N/A</a> - <a class='filter' href=#>すべて</a>,検査者記入欄,状態" classname="questions" id="checklist">
				
				<s:iterator value="value">
					<tr>
					<td><s:property value="question" escapeHtml="false" /></td>
					<td style="width:30%; font-size:larger">
					
						<s:if test="answer.value == 0">
							<input type=radio name="rd${id }" value="0" checked >&nbsp;未完了&nbsp;&nbsp;</input> 
							<input type=radio name="rd${id }" value="1" disabled>&nbsp;N/A&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="3" disabled>&nbsp;合格</input>  
							<input type=radio name="rd${id }" value="2" disabled>&nbsp;&nbsp;&nbsp;失格</input>
							<div style="display:none">xxxIncomxxx</div>
						</s:if>
						<s:elseif test="answer.value == 1">
							<input type=radio name="rd${id }" value="0" disabled>&nbsp;未完了</input> 
							<input type=radio name="rd${id }" value="1" checked>&nbsp;N/A&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="3" disabled>&nbsp;合格&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="2" disabled>&nbsp;失格&nbsp;&nbsp;</input>
							<div style="display:none">xxxNAxxx</div>
						</s:elseif>
						<s:elseif test="answer.value == 2">
							<input type=radio name="rd${id }" value="0" disabled>&nbsp;未完了&nbsp;&nbsp;</input> 
							<input type=radio name="rd${id }" value="1" disabled>&nbsp;N/A&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="3" disabled>&nbsp;合格&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="2" checked>&nbsp;失格&nbsp;&nbsp;</input>
							<div style="display:none">xxxFailedxxx</div>
						</s:elseif>
						<s:elseif test="answer.value == 3">
							<input type=radio name="rd${id }" value="0" disabled>&nbsp;未完了&nbsp;&nbsp;</input> 
							<input type=radio name="rd${id }" value="1" disabled>&nbsp;N/A&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="3" checked>&nbsp;合格&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="2" disabled>&nbsp;失格&nbsp;&nbsp;</input>
							<div style="display:none">xxxPassedxxx</div>
						</s:elseif>
						<s:else>
							<input type=radio name="rd${id }" value="0" checked>&nbsp;未完了&nbsp;&nbsp;</input> 
							<input type=radio name="rd${id }" value="1" disabled>&nbsp;N/A&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="3" disabled>&nbsp;合格&nbsp;&nbsp;</input>  
							<input type=radio name="rd${id }" value="2" disabled>&nbsp;失格&nbsp;&nbsp;</input>
							<div style="display:none">xxxIncomxxx</div>
						</s:else>
						
						</td>
					<td><textarea class="form-control" style="width:100%" id="tx${id }" readonly>${notes}</textarea></td>
					<td>
						<s:if test="answer.value == 0">
							Incomplete 	
						</s:if>
						<s:elseif test="answer.value == 1">
							N/A
						</s:elseif>
						<s:elseif test="answer.value == 2">
							Fail
						</s:elseif>
						<s:elseif test="answer.value == 3">
							Pass
						</s:elseif>
						<s:else>
							未完了
						</s:else>
					</td>
					</tr>
				</s:iterator>
			</bs:datatable>
			</div>
	</s:iterator>
		
	</div>
	</div>
	</bs:mco>
	</bs:row>
  
  
  
 

  
  <jsp:include page="../footer.jsp" />
	
   <script>
   	const userId = "${sessionUser.id}";
   	const userName = "${sessionUser.fname} ${sessionUser.lname}";
	let prid="${prid}";
	let asmtId="${asmt.id}";
colors = ["#8E44AD", "#9B59B6", "#2C3E50", "#34495E", "#95A5A6", "#00a65a", "#39cccc", "#00c0ef", "#f39c12", "#dd4b39"];
	<s:if test="!(asmt.type.cvss31 || asmt.type.cvss40)">
	 <% int count=9; %>
	 <s:iterator value="levels" begin="9" end="0" step="-1" status="stat">
	 	<s:if test="risk != null && risk != 'Unassigned' && risk != ''">
			$("span:contains('${risk}')").css("background", colors[<%=count %>]);
			<% count = count-1; %>
		</s:if>
	</s:iterator>
	</s:if>
   
   </script>
	
   <s:if test="prqueue">
		<script src="../dist/js/peerreviewedit.js"></script>
   </s:if>
   <s:else>
		<script src="../dist/js/assessorreviewedit.js"></script>
   </s:else>
   <script>
	$("input[type=radio]").iCheck({
			radioClass: 'iradio_square-blue'
		   
		  });
   </script>


  </body>
</html>

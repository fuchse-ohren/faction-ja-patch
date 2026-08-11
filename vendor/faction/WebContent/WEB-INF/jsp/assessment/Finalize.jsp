<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>
<bs:row>
<s:if test="!(assessment.InPr || assessment.prComplete || assessment.finalized)">
<bs:mco colsize="12">
<bs:box type="success" title="Controls">
<div style="padding-bottom:60px">
<s:if test="hasTemplate">
  <bs:button color="success" size="md" colsize="3" text="報告書を生成" id="genreport"></bs:button>
  <s:if test="assessment.finalReport != null">
    <s:if test="prEnabled">
      <bs:button color="warning" size="md" colsize="3" text="査読を依頼" id="prsubmit"></bs:button>
    </s:if>
    <s:if test="assessment.finalReport.effectiveVariants.size() > 1">
      <div class="col-md-3">
        <div class="btn-group" style="width:100%">
          <button type="button" class="btn btn-block btn-primary btn-md dropdown-toggle" data-toggle="dropdown">
            Download Report <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" style="width:100%; background-color:#192338; border-color:#0f1a2b;">
            <li><a href="DownloadReport?aid=<s:property value="assessment.id"/>&format=docx" target="_blank" rel="noopener noreferrer" style="color:#fff;">Word (.docx)</a></li>
            <li><a href="DownloadReport?aid=<s:property value="assessment.id"/>&format=pdf" target="_blank" rel="noopener noreferrer" style="color:#fff;">PDF</a></li>
            <li><a href="DownloadReport?aid=<s:property value="assessment.id"/>&format=encryptedpdf" target="_blank" rel="noopener noreferrer" style="color:#fff;">Encrypted PDF</a></li>
          </ul>
        </div>
        <s:if test="reportPassword != null && reportPassword != ''">
          <div class="input-group input-group-sm" style="margin-top:8px;">
            <input type="password" id="reportPasswordField" class="form-control" value="<s:property value="reportPassword"/>" readonly>
            <span class="input-group-btn">
              <button class="btn btn-default" type="button" id="toggleReportPassword">
                <i class="fa fa-eye"></i>
              </button>
            </span>
          </div>
          <small class="text-muted">Report encryption password</small>
        </s:if>
      </div>
    </s:if>
    <s:else>
      <bs:button color="primary" size="md" colsize="3" text="報告書をダウンロード" id="dlreport"></bs:button>
    </s:else>
    <bs:button color="danger" size="md" colsize="3" text="検査を完了する" id="finalize"></bs:button>
  </s:if>
  </s:if>
  <s:else>
  <div class="alert alert-danger">
                  <h5><i class="icon fas fa-ban"></i> 警告!</h5>
  	この検査には報告書の雛型が設定されていません。
  	システム管理者にお問い合わせください
                </div>
  </s:else>
</div>
</bs:box>
</bs:mco>
</s:if>
</bs:row>
<s:if test="assessment.finalized && acadmin">
<bs:row>
<bs:mco colsize="12">
<bs:box type="warning" title="Controls">
<div style="padding-bottom:60px">
  <bs:button color="warning" size="md" colsize="3" text="Reopen Assessment" id="reopen"></bs:button>
</div>
</bs:box>
</bs:mco>
</bs:row>
</s:if>
<bs:row>
<bs:mco colsize="12">
<ul class="timeline">

    <li class="time-label">
      <span class="bg-green">
        <s:property value="assessment.start"/>
      </span>
    </li>
    <li>
       <i class="fa  fa-clock-o bg-aqua"></i>
       <div class="timeline-item">
         <span class="time"><i class="fa fa-clock-o"></i>&nbsp;<s:property value="assessment.start"/></span>
         <h3 class="timeline-header no-border">検査開始日</h3>
       </div>
     </li>
      <li>
      <s:if test="assessment.finalReport != null">
       		<i class="glyphicon glyphicon-ok bg-green" id="tlgenerated"></i>
      </s:if>
      <s:else>
       		<i class="glyphicon  bg-grey" id="tlgenerated"></i>
      </s:else>
       <div class="timeline-item reportLoading">
         <h3 class="timeline-header no-border">報告書生成済</h3>
         <s:if test="assessment.finalReport != null">
         <div class="timeline-body">
				<span class="time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;最終更新 <span id="updatedDate">${assessment.finalReport.gentime} </span>
				</span>
		</div>
		</s:if>
		  <div style="margin-top:10px;">
			<bs:button color="info" size="md" colsize="3" text="Upload Report" id="uploadReportBtn"></bs:button>
		  </div>
          
       </div>
     </li>
     <li>
     <s:if test="prEnabled"> <!--  is pr enabled -->
    
     <s:if test="assessment.workflow >= 1">
       		<i class="glyphicon glyphicon-ok bg-green" id="tlprsubmitted"></i>
      </s:if>
      <s:else>
       		<i class="glyphicon  bg-grey" id="tlprcompleted"></i>
      </s:else>
       <div class="timeline-item">
         <h3 class="timeline-header no-border">査読依頼済</h3>
       </div>
     </li>
     <li>
     <s:if test="assessment.workflow >=2">
       		<i class="glyphicon glyphicon-ok bg-green" ></i>
      </s:if>
      <s:else>
       		<i class="glyphicon  bg-grey" ></i>
      </s:else>
       <div class="timeline-item">
         <h3 class="timeline-header no-border">査読完了</h3>
			<s:iterator value="comments">
				<s:if test="dateOfComment != null ">
				<div class="timeline-body">
				<s:if test="acceptedEdits">
				<span class="time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;${dateOfComment}&nbsp;-&nbsp;変更承諾: <b><u>
				</s:if>
				<s:else>
				<span class="time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;${dateOfComment}&nbsp;-&nbsp;完了処理: <b><u>
				</s:else>
					<s:iterator value="commenters" status="stat">
						<s:property value="fname"/> <s:property value="lname"/><s:if test="!#stat.last">,</s:if>
					</s:iterator>
					</u></b>&nbsp;&nbsp;<a class='btn btn-xs bg-primary' href="getPRHistory?prid=${id}"><i class="fa fa-eye"></i> 査読結果を表示</a></span>
					<!--<s:property value="comment" escapeHtml="false"/>-->
				 </div>
				 </s:if>
			</s:iterator>
       </div>
     </li>
      <li>
     <s:if test="assessment.workflow >=3">
       		<i class="glyphicon glyphicon-ok bg-green" id="tlprsubmitted"></i>
      </s:if>
      <s:else>
       		<i class="glyphicon  bg-grey" id="tlprcompleted"></i>
      </s:else>
       <div class="timeline-item">
         <h3 class="timeline-header no-border">変更を承諾</h3>
         <div class="timeline-body">
         	 <button class="btn btn-info" id="showPR" prid="${ assessment.peerReview.id}" <s:if test="!assessment.prComplete">disabled</s:if>>追跡と変更点</button>
         </div>
       </div>
     </li>
     
    <li>
       <i class="glyphicon glyphicon-ok bg-blue" id="tlreportOut"></i>
       <div class="timeline-item">
	       <h3 class="timeline-header no-border">報告会を計画</h3>
	         <div class="timeline-body">
	         	 <button class="btn btn-primary" id="openICS" <s:if test="finalized">disabled</s:if>><i class="fa-solid fa-envelope"></i> 電子メールで招待</button>
	         	 <button class="btn btn-primary" id="downloadICS" <s:if test="finalized">disabled</s:if>><i class="fa-solid fa-download"></i> ics形式でダウンロード</button>
	         	 <a class="btn btn-primary"  href="${LiveLink}" target="_blank"><img style="height: 20px" src="../dist/img/outlook.png"/> LIVEで開く</a>
	         	 <a class="btn btn-danger"  href="${OutlookLink}" target="_blank"><img style="height: 20px" src="../dist/img/outlook.png"/> Outlookで開く</a>
	         	 <a class="btn btn-default"  href="${GoogleLink}" target="_blank"><img style="height: 20px" src="../dist/img/google.png"/> Googleカレンダーで開く</a>
	         </div>
       </div>
     </li> 
     
     </s:if> <!-- end  is pr enabled -->
     <li>
       <s:if test="assessment.workflow==4">
       		<i class="glyphicon glyphicon-ok bg-green" id="tlprcompleted"></i>
      </s:if>
      <s:else>
       		<i class="glyphicon  bg-grey" id="tlprcompleted"></i>
      </s:else>
       <div class="timeline-item">
         <span class="time"><i class="fa fa-clock-o"></i> <s:property value="assessment.completed"/></span>
         <h3 class="timeline-header no-border">検査完了</h3>
       </div>
     </li>
   
</ul>
                
	
</bs:mco>
</bs:row>

<script>
$(document).ready(function() {
  $("#toggleReportPassword").click(function() {
    var field = $("#reportPasswordField");
    var icon = $(this).find("i");
    if (field.attr("type") === "password") {
      field.attr("type", "text");
      icon.removeClass("fa-eye").addClass("fa-eye-slash");
    } else {
      field.attr("type", "password");
      icon.removeClass("fa-eye-slash").addClass("fa-eye");
    }
  });
});
</script>

<!-- Upload Report Modal -->
<div class="modal fade" id="uploadReportModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background-color:#192338; color:#fff;">
      <div class="modal-header" style="border-bottom-color:#0f1a2b;">
        <button type="button" class="close" style="color:#fff; opacity:0.8;" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">報告書を上書き</h4>
      </div>
      <div class="modal-body">
        <p><strong>.docx</strong> もしくは <strong>.pdf</strong> 形式の報告書を送信して既存の報告書を上書き。</p>
        <form id="uploadReportForm" enctype="multipart/form-data">
          <div class="form-group">
		  <input type="file" name="uploadReport" id="uploadReportFile" accept=".docx,.pdf" required="" class="form-control" style="background-color: #192338;color:#fff;border-color:#0f1a2b;">
          </div>
          <div id="uploadReportError" class="alert alert-danger" style="display:none;"></div>
        </form>
      </div>
      <div class="modal-footer" style="border-top-color:#0f1a2b;">
        <button type="button" class="btn btn-default" data-dismiss="modal">中止</button>
        <button type="button" class="btn btn-primary" id="doUploadReport">送信</button>
      </div>
    </div>
  </div>
</div>



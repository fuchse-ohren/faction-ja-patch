<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="../header.jsp" />
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>

<link href="../fileupload/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="../dist/css/jquery.autocomplete.css" media="all" rel="stylesheet" type="text/css" />
<style>
.jconfirm{
z-index:1000;
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="glyphicon glyphicon-wrench"></i> XML報告書設定
      <small></small>
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">
<bs:row>
  <bs:mco colsize="4">
  	<bs:box type="success" title="設定済み報告書">
  	<bs:row>
  		<bs:button color="primary" size="md" colsize="12" text="<span class='fa fa-plus'></span> 雛型を追加" id="addTemplate"></bs:button>
		<bs:mco colsize="12">
			<bs:datatable columns="選択, 名称,説明,編集" classname="" id="reports">
				<s:iterator value="reports">
					<tr>
					<td><input type="radio" name="select" value="${id}"/></td>
					<td><s:property value="reportName"/></td>
					<td><s:property value="desc"/></td>
					<td width="100px">
						<button onclick="editReport(this,${id })" class="btn btn-md btn-success">
							<span class="fa fa-edit"></span>
						</button>
						<button onclick="delReport(this,${id })" class="btn btn-md btn-danger">
							<span class="fa fa-trash"></span>
						</button>
					</td>
					</tr>
				</s:iterator>
			</bs:datatable>
		</bs:mco>
	</bs:row>
	</bs:box>
	</bs:mco>
	
	<bs:mco colsize="4">
  	<bs:box type="warning" title="脆弱性割り当てを送信: <a href='#' onclick='getVulnMap()'>現在の脆弱性割り当てを保存 </a>">
	<bs:mco colsize="12">
	  <div class="form-group">
	  	<label>送信した情報は以下の表に表示されます</label>
	 	<input id="vulnMap" type="file"  name="file_data"/>
	  </div>
	  </bs:mco>
	</bs:box>
	</bs:mco> 
	<bs:mco colsize="4">
  	<bs:box type="primary" title="深刻度割り当てを送信: <a href='#' onclick='getSevMap()'>現在の脆弱性割り当てを保存 </a>">
	<bs:mco colsize="12">
	  <div class="form-group">
	  	<label>送信した情報は以下の表に表示されます</label>
	 	<input id="sevMap" type="file"  name="file_data"/>
	  </div>
	  </bs:mco>
	</bs:box>
	</bs:mco> 
	
	
	 <bs:mco colsize="12">
  	<bs:box type="success" title="報告書見本を送信">
	<bs:mco colsize="12">
	  <div class="form-group">
	  	<label>送信した情報は以下の表に表示されます</label>
	 	<input id="vulnReport" type="file"  name="file_data"/>
	  </div>
	  </bs:mco>
	</bs:box>
	</bs:mco> 
</bs:row> 
<bs:row>
	<bs:mco colsize="12">
	<bs:datatable columns="名称, 割当済脆弱性, 説明, 推奨事項, 深刻度" classname="" id="vulnTable">
	</bs:datatable>
  	</bs:mco>
  	</bs:row>

<jsp:include page="../footer.jsp" />
 
<!-- DataTables -->
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
 <script src="../fileupload/js/fileinput.min.js" type="text/javascript"></script>
<script>

$(function(){
	 $("#vulnReport").fileinput({
		 overwriteInitial: false,
		 uploadUrl: "testReport",
		 uploadAsync: true,
		 minFileCount: 1,
		 maxFileCount: 1,
		 allowedFileExtensions : ['xml'],
		 uploadExtraData: function (){
			 id=$("input[name=select]:checked").val();
			 return {'id': id};
		 }
	  });
	 $("#vulnMap").fileinput({
		 overwriteInitial: false,
		 uploadUrl: "UploadVulnMap",
		 uploadAsync: true,
		 minFileCount: 1,
		 maxFileCount: 1,
		 allowedFileExtensions : ['csv'],
		 uploadExtraData: function (){
			 id=$("input[name=select]:checked").val();
			 return {'id': id};
		 }
	  });
	 $("#sevMap").fileinput({
		 overwriteInitial: false,
		 uploadUrl: "UploadSevMap",
		 uploadAsync: true,
		 minFileCount: 1,
		 maxFileCount: 1,
		 allowedFileExtensions : ['csv'],
		 uploadExtraData: function (){
			 id=$("input[name=select]:checked").val();
			 return {'id': id};
		 }
	  });
	  
	$('#vulnReport').on('filepreupload', function(event, data, previewId, index, jqXHR) {
		id=$("input[name=select]:checked").val();
		if(typeof id == 'undefined'){
			 $.alert("You Need to Select a Report on the Left first.");
			 return {
		           message: 'You Need to Select a Report on the Left first.'
		       };
	   }
	});
	 $('#vulnReport').on('fileuploaded', function(event, data, previewId, index) {
		    
		    vulns = data.response.initialPreviewConfig[0].extra.vulns;
		    console.log(vulns);
		    $("#vulnTable").DataTable().clear().draw();
		    vulns.forEach(function(vuln){
		    	console.log(vuln);
		    	row = [ vuln.Name, vuln.mappedVuln, vuln.Description, vuln.Recommendation, vuln.Overall]
		    	
		    	$("#vulnTable").DataTable().row.add(row);
		    });
		    $("#vulnTable").DataTable().draw();
		    
		});
	 
	 $("#reports").dataTable({
		 paging: false,
		 searching: false
	 });
	 $("#vulnTable").DataTable();
	 
	$("#addTemplate").click(function(){
		$.confirm({
			content: 'URL:GetTemplate?id=-1',
			title: 'Add New Template',
			columnClass: 'large',
			buttons :{
				"Save" : function(){
					
					
					data = "id=-1";
					data+="&reportType="+$("#reportName").val();

					$.post("AddReportType", data).done(function(resp){
						alertRedirect(resp);
						});
					
				},
				cancel:function(){}
			}})
	});

	 
	 
	
});
function getVulnMap(){
	id=$("input[name=select]:checked").val();
	if(typeof id == 'undefined')
		$.alert("Must Select a Report Template from the right table.")
	else
		document.location = "VulnMap?id="+id;
}
function getSevMap(){
	id=$("input[name=select]:checked").val();
	if(typeof id == 'undefined')
		$.alert("Must Select a Report Template from the right table.")
	else
		document.location = "SevMap?id="+id;
}
function editReport(el,reportId){
	$.confirm({
		content: 'URL:GetTemplate?id='+reportId,
		title: 'Edit Report',
		columnClass: 'large',
		buttons :{
			"Update" : function(){
				ids=$("input[id^=param]");
				
				data = "id="+ reportId;
				data+="&property="+$("#reportName").val();
				data+="&defaultVuln=" + $("#dtitle").attr("intVal");
				data+="&attr="+$("#listname").val();
				$.post("UpdateReportMap", data).done(function(resp){
					getData(resp);
				});
				$(ids).each(function (index,el){
					id = $(el).attr('id').replace("param","");
				
					data = "id="+ reportId;
					data+= "&mapid=" + id;
					data+= "&attr=" +$(el).val();
					data+= "&property=" + $("#select" + id).val();
					data+= "&hasElements=" + $("#recurse" + id).is(":checked");
					data+= "&Base64=" + $("#b64" + id).is(":checked");
					$.post("UpdateReportMap", data).done(function(resp){
						getData(resp);
					});
				});
				
				customIds=$("input[class^=newrow]");
				$(customIds).each(function(index,el){
					id = $(el).attr('class').replace("newrow","");
					console.log(id);
					data = "id="+ reportId;
					data+= "&mapid=-1";
					data+= "&attr=" +$(el).val();
					data+= "&property=" + $("#select" + id).val();
					data+= "&hasElements=" + $("#hasmore" + id).is(":checked");
					data+= "&Base64=" + $("#base64" + id).is(":checked");
					$.post("UpdateReportMap", data).done(function(resp){
						getData(resp);
					});
				});
			},
			cancel:function(){}
		}
		
	})
}

function delReport(el,id){
	$.confirm({
		title: "Are You Sure?",
		content: "Do you really want to delete this report template?",
		buttons: {
			"Yes I Know What I'm Doing":function(){
				data="id="+id;
				$.post("DeleteReportMap", data).done(function(){
					location.reload();
				});
			},
			"Cancel":function(){}
		}
				
	})
}
</script>

</body>
</html>
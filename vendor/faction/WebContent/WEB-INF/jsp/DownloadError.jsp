<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>
<jsp:include page="header.jsp" />
<style>
.page {
cursor: pointer;
}
.page:hover{
	 font-weight: bold;
}
.css{
width:100%;
height: 700px;
}
</style>
<link rel="stylesheet" href="../plugins/iCheck/all.css">
<link href="../fileupload/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      ダウンロードエラー
      
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">
  <bs:box type="success" title="">
<bs:row>
	<bs:mco colsize="12">
	<bs:row>
			<bs:mco colsize="2"></bs:mco>
			<bs:mco colsize="8">
				<div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> 警告!</h4>
                ダウンロードを試みているレポートは現在利用できません。処理に時間がかかっている可能性があり、完了後にダッシュボードに表示される予定です。
                <br><br>
                <a href="Dashboard"> 数分後にここをクリックして、レポートが正しく生成されたか確認してください。</a>
                <br>
                <br>
                このエラーのもう一つの原因として、管理者がこの検査チーム、タイプ、または再検査のためのテンプレートレポートを送信していない可能性が考えられます。もし該当するレポートが存在しない場合：
             	上記のリンクから利用可能になったら、管理者に連絡してください。
              </div>
			</bs:mco>
	</bs:row>
	</bs:mco>
	</bs:row>
	</bs:box>
		
		
    <jsp:include page="footer.jsp" />
 
 
  </body>
</html>
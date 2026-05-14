<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">検査設定</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					   <b>検査完了時にどのように処理するか設定します。</b>
					   <div>
						  <input type="radio" name="verOption" ${verOption == 0? 'checked':'' } value="0"> 修正担当のロールを持つ利用者に自動的に管理を引き継ぐ<br>
						  <br/>
						  <input type="radio" name="verOption" ${verOption == 1? 'checked':'' } value="1"> 開発環境では「完了」として報告し脆弱性を「未解決」として記録する<br>
						  <br/>
						  <input type="radio" name="verOption" ${verOption == 2? 'checked':'' } value="2"> 脆弱性は「完了」として報告し追跡は行わない <br>
						  <br/>
						  <input type="radio" name="verOption" ${verOption == 3? 'checked':'' } value="3"> When an Assessor closes the Verification the API handles what happens next. 
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			
			
			

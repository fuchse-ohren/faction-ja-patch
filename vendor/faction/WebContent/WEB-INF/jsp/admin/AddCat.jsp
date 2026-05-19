<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">分類</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					    <input type="text" id="catname" class="form-control" placeholder="新しい分類の名前を入力"/>
					    <br>
						<button class="btn btn-block btn-info btn-lg" id="addCat">分類を
							追加</button>
							<br>
						<table id="catTable"
							class="table table-striped table-hover dataTable">
							<thead class="theader">
								<tr>
									<th>名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="categories">
									<tr>
										<td><s:property value="name"/></td>
										<td>
										<span class="vulnControl"
												onclick="editCat(this,${id})">
												<i class="fa fa-edit"></i>
												</span>
										
										<span class="vulnControl vulnControl-delete"
												onclick="deleteCat(${id})">
												<i class="fa fa-trash"></i>
												</span>
										</td>
									</tr>
								</s:iterator>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
				<!-- /.box -->
			</div>
			
			
			

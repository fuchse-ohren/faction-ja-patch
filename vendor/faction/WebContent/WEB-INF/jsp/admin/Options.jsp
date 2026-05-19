<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="../header.jsp" />
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>
<link rel="stylesheet" href="../plugins/iCheck/all.css">
<style>
.select2-dropdown {
	z-index: 99999999;
	box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
}
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="glyphicon glyphicon-wrench"></i> 設定 <small></small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<bs:row>
			<bs:mco colsize="6">
				<bs:box type="success" title="検査種別">
					<bs:row>
						<bs:button color="success" size="md" colsize="3"
							text="<i class='fa fa-plus'></i> 追加" id="addType"></bs:button>
					</bs:row>
					<br>
					<bs:row>
						<bs:mco colsize="12">
							<bs:datatable columns="名称, 脅威評価指標,&nbsp;" classname="" id="type">
								<s:iterator value="types">
									<tr>
										<td><s:property value="type" /></td>
										<td><s:property value="ratingSystemName" /></td>
										<td width="100px"><span onclick="editType(this,${id })"
											class="vulnControl"> <i class="fa fa-edit"></i>
										</span> <span onclick="delType(this,${id })"
											class="vulnControl vulnControl-delete"> <i
												class="fa fa-trash"></i>
										</span></td>
										<td >${id}</td>
									</tr>
								</s:iterator>
							</bs:datatable>
						</bs:mco>
					</bs:row>
				</bs:box>
			</bs:mco>
			<bs:mco colsize="6">
				<bs:box type="warning" title="キャンペーン">
					<bs:row>
						<bs:button color="success" size="md" colsize="3"
							text="<i class='fa fa-plus'></i> 追加" id="addCampaign">
						</bs:button>
					</bs:row>
					<br>
					<bs:row>
						<bs:mco colsize="12">
							<bs:datatable columns="名称,既定,操作" classname="" id="campaign">
								<s:iterator value="campaigns">
									<tr>
										<td><s:property value="name" /></td>
										<td><input type="checkbox" onClick="editSelectedCampaign(this,${id})" <s:if test="selected">checked</s:if>></td>
										<td width="100px"><span
											onclick="editCampaign(this,${id })" class="vulnControl">
												<i class="fa fa-edit"></i>
										</span> <span onclick="delCampaign(this,${id })"
											class="vulnControl vulnControl-delete"> <i
												class="fa fa-trash"></i>
										</span></td>
									</tr>
								</s:iterator>

							</bs:datatable>
						</bs:mco>
					</bs:row>
				</bs:box>
			</bs:mco>
		</bs:row>
		<bs:row>

			<bs:mco colsize="6">
				<s:if test="acadmin == true && tier != 'consultant'">
					<bs:box type="primary" title="追加項目">
						<bs:row>
							<bs:button color="success" size="md" colsize="3"
								text="<i class='fa fa-plus'></i> 作成" id="addCF">
							</bs:button>
						</bs:row>
						<br>
						<bs:row>
							<bs:mco colsize="12">
								<bs:datatable
									columns="名称,変数名,既定,型,適用先,読み取り専用,編集"
									classname="" id="campaign">
									<s:iterator value="custom">
										<tr>
											<td><input value="<s:property value="key"/>" id="key${id}"
												class="form-control pull-right" readonly></td>
											<td><input id="var${id}" value="<s:property value="variable"/>"
												class="form-control pull-right" readonly /></td>
											<td><input id="default${id}" value="<s:property value="defaultValue"/>"
												class="form-control pull-right" readonly/></td>
											<td><s:property value="fieldTypeStr"/></td>
											<td><s:property value="typeStr"/></td>
											<s:if test="readonly">
												<td><input type=checkbox id="ro${id}" checked /></td>
											</s:if>
											<s:else>
												<td><input type=checkbox id="ro${id}" /></td>
											</s:else>
											<td style="width: 70px"><span for="${id}" class="vulnControl updCF"><i
													class="fa fa-edit"></i></span><span for="${id}"
												class="vulnControl vulnControl-delete delCF"><i
													class="fa fa-trash"></i></span></td>
										</tr>
									</s:iterator>

								</bs:datatable>
							</bs:mco>
						</bs:row>
					</bs:box>
				</s:if>
				<s:if test="acadmin == true">
					<bs:box type="primary" title="全体設定">
						<bs:row>
							<bs:mco colsize="6">
								<div class="checkbox">
									<label> <input type="checkbox" id="prEnabled"
										${prChecked }> 査読を有効化
									</label>
								</div>
							</bs:mco>
							<bs:mco colsize="6">
							<s:if test="prChecked == 'checked'">
								<div class="checkbox">
									<label> <input type="checkbox" id="prSelfReview"
										${ selfPeerReview }> 自分自身で査読を可能にする
									</label>
								</div>
							</s:if>
							</bs:mco>
							<bs:mco colsize="6">
								<div class="checkbox">
									<label> <input type="checkbox" id="randEnabled"
										${randChecked }> ランダムなAppIdを許可する
									</label>
								</div>
							</bs:mco>
							<bs:inputgroup name="題名:" colsize="12" id="title1"
								placeholder="Fuse"><s:property value="title[0]"/></bs:inputgroup>
							<bs:inputgroup name="副題:" colsize="12" id="title2"
								placeholder="FACTION"><s:property value="title[1]"/></bs:inputgroup>
							<br>
							<bs:button color="info" size="md" colsize="3"
								text="<i class='fa fa-save'></i> 保存" id="updateTitles">
							</bs:button>
						</bs:row>
					</bs:box>
				</s:if>

				<s:if test="acadmin == true">

					<bs:box type="primary" title="検査進捗管理">
						<bs:inputgroup name="状態:" colsize="6" id="asmtStatus"></bs:inputgroup>
						<bs:button color="primary" size="md" colsize="3"
							text="<i class='fa fa-plus'></i> Add" id="addstatus"
							addlabel="true"></bs:button>
						<br>
						<br>
						<br>
						<br>
						<bs:mco colsize="12">
							<bs:datatable columns="状態,操作" classname="" id="">
								<s:iterator value="statuses" var="stat">
									<tr>
										<td><s:property value="name" /></td>
										<td width="50px">
										<s:if test="builtin">
										<span
											class="vulnControl vulnControl-delete"><i
												class="fa fa-lock"></i></span>
										</s:if>
										<s:else>
										<span
											class="vulnControl vulnControl-edit"
											onClick="editStatusModal('<s:property value="id"/>')"><i
												class="fa fa-edit"></i></span>
										<span
											class="vulnControl vulnControl-delete"
											onClick="deleteStatus('<s:property value="id"/>')"><i
												class="fa fa-trash"></i></span>
										</s:else>
										</td>
									</tr>
								</s:iterator>
							</bs:datatable>
						</bs:mco>
					</bs:box>


				</s:if>

			</bs:mco>
			<s:if test="acadmin == true">
				<bs:mco colsize="6">
					<bs:box type="info" title="電子メール設定">
						<bs:row>
							<bs:inputgroup name="電子メールサーバ:" colsize="12" id="emailServer"
								placeholder="Email Server Address"><s:property value="EMS.server" /></bs:inputgroup>
							<bs:inputgroup name="ポート番号:" colsize="12" id="emailPort"
								placeholder="Email Server Port"><s:property value="EMS.port" /></bs:inputgroup>
							<bs:inputgroup name="プロトコル:" colsize="12"
								id="emailProto" placeholder="smtp,pop,imap"><s:property value="EMS.type" /></bs:inputgroup>
							<div class="col-md-12">
								<div class="checkbox">
									<label> <input type="checkbox" id="isAuth"
										${authChecked}> 認証
									</label> <label> <input type="checkbox" id="isTLS"
										${tlsChecked}> TLS
									</label> <label> <input type="checkbox" id="isSSL"
										${sslChecked}> SSL
									</label>
								</div>
							</div>
							<bs:inputgroup
								name="ユーザー名:"
								colsize="12" id="emailName" placeholder="Username"><s:property value="EMS.uname" /></bs:inputgroup>
							<bs:inputgroup name="送信元メールアドレス:" colsize="12"
								id="fromAddress" placeholder="From Address"><s:property value="EMS.fromaddress" /></bs:inputgroup>
							<bs:inputgroup name="パスワード:" colsize="12"
								id="emailPass" placeholder="Password" password="true">*****</bs:inputgroup>
							<bs:inputgroup name="件名の接頭辞: " colsize="12"
								id="emailPrefix" placeholder="Faction : "><s:property value="EMS.prefix" /></bs:inputgroup>
							<bs:mco colsize="12">
								<div class="form-group">
									<label>署名:</label>
									<textarea rows="12" cols="100" class="form-control pull-right"
										name="emailSignature" id="emailSignature"><s:property
											value="EMS.signature" /></textarea>
								</div>
							</bs:mco>
							<br>
							<br>

						</bs:row>
						<br>
						<bs:row>
							<bs:button color="info" size="md" colsize="4"
								text="<i class='fa fa-save'></i> 保存" id="saveEmail">
							</bs:button>
							<bs:button color="warning" size="md" colsize="4"
								text="<i class='fa fa-envelope'></i> 保存してテストメールを送信"
								id="testEmail">
							</bs:button>
						</bs:row>

					</bs:box>
				</bs:mco>

			</s:if>

		</bs:row>




		<jsp:include page="../footer.jsp" />
		<script src="../dist/js/options.js"></script>


		</body>
		</html>
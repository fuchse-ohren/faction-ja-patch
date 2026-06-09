
<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="bs" uri="/WEB-INF/BootStrapHandler.tld"%>
<html>
<body>
	<section class="content">
		<bs:row>
			<bs:mco colsize="10">
			<div class="cvss-content" style="overflow-y: auto; direction:rtl; ">
				<div style="direction:ltr; padding-left: 30px;">
				<bs:row>
					<bs:mco colsize="6">
					<h2>基本評価基準</h2>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
						<h4><b><center><u>攻撃の難易度</u></center></b></h4>
						<br/>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="3"><label>攻撃元区分 (AV):</label></bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="av" id="av_n" autocomplete="off"
								 value="N" checked> ネットワーク (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="av" id="av_a" autocomplete="off" value="A">
								隣接 (A)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="av" id="av_l" autocomplete="off" value="L"> ローカル
								(L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="av" id="av_p" autocomplete="off" value="P">
								物理 (P)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>攻撃条件の複雑さ (AC):</label> </bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="ac" id="ac_l" autocomplete="off"
								 value="L" checked> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="ac" id="ac_h" autocomplete="off" value="H">
								高 (H)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>攻撃の実行条件 (AT):</label> </bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="at" id="at_n" autocomplete="off"
								 value="N" checked> なし (N)
							</label><label class="btn btn-secondary vector"> <input
								type="radio" name="at" id="at_p" autocomplete="off"
								 value="P" checked> あり (P)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>必要な特権レベル (PR):</label> </bs:mco>
					<bs:mco colsize="9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="pr" id="pr_n" autocomplete="off"
									 value="N" checked> なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="pr" id="pr_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="pr" id="pr_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>ユーザー関与 (UI):</label> </bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="ui" id="ui_n" autocomplete="off"
								 value="N" checked> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="ui" id="ui_p" autocomplete="off" value="P">
								受動的 (P)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="ui" id="ui_a" autocomplete="off" value="A">
								能動的 (A)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="12">
						<hr>
						<h4><b><center><u>影響区分</u></center></b></h4>
						<br/>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="3"><label>機密性への影響 (VC):</label> </bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="vc" id="vc_n" autocomplete="off"
								 value="N" checked> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="vc" id="vc_l" autocomplete="off" value="L"> 低
								(L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="vc" id="vc_h" autocomplete="off" value="H"> 高
								(H)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>完全性への影響 (VI):</label></bs:mco>
					<bs:mco colsize="9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="vi" id="vi_n" autocomplete="off"  value="N" checked>
									なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="vi" id="vi_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="vi" id="vi_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>可用性への影響 (VA):</label> </bs:mco>
					<bs:mco colsize="9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="va" id="va_n" autocomplete="off"
									 value="N" checked> なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="va" id="va_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="va" id="va_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="12">
						<hr>
						<h4><b><center><u>後続システムへの影響区分</u></center></b></h4>
						<br/>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="3"><label>機密性への影響 (SC):</label> </bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary activeVector vector"> <input
								type="radio" name="sc" id="sc_n" autocomplete="off"
								 value="N" checked> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="sc" id="sc_l" autocomplete="off" value="L"> 低
								(L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="sc" id="sc_h" autocomplete="off" value="H"> 高
								(H)
							</label>
						</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>完全性への影響 (SI):</label></bs:mco>
					<bs:mco colsize="9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="si" id="si_n" autocomplete="off"  value="N" checked>
									なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="si" id="si_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="si" id="si_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>可用性への影響 (SA):</label></bs:mco>
					<bs:mco colsize="9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="sa" id="sa_n" autocomplete="off"
									 value="N" checked> なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="sa" id="sa_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="sa" id="sa_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
					</bs:mco>
				</bs:row>
				<hr>
				<bs:row>
					<bs:mco colsize="12">
				 <h2>補助評価基準(任意)</h2>
				</bs:mco>
			</bs:row>
				<br/>
			<bs:row>
				<bs:mco colsize="3"><label>安全性 (S):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="s" id="s_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="s" id="s_n" autocomplete="off" value="N"> なし (N) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="s" id="s_p" autocomplete="off" value="P"> あり (P) 
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>攻撃の自動化 (AU):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="au" id="au_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="au" id="au_n" autocomplete="off" value="N"> いいえ (N) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="au" id="au_y" autocomplete="off" value="Y"> はい (Y)
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>回復 (R):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="r" id="r_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="r" id="r_a" autocomplete="off" value="A"> 時間経過で回復 (A) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="r" id="r_u" autocomplete="off" value="U"> ユーザ関与が必要 (U) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="r" id="r_i" autocomplete="off" value="I"> 回復困難 (I) 
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>価値密度 (V):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="v" id="v_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="v" id="v_d" autocomplete="off" value="D"> 粗 (D) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="v" id="v_c" autocomplete="off" value="C"> 密 (C) 
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>脆弱性対応困難性 (RE):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="re" id="re_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="re" id="re_l" autocomplete="off" value="L"> 低 (L) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="re" id="re_m" autocomplete="off" value="M"> 中 (M) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="re" id="re_h" autocomplete="off" value="H"> 高 (H) 
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>供給元緊急度 (U):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="u" id="u_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="u" id="u_c" autocomplete="off" value="C"> 緊急性なし (C)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="u" id="u_g" autocomplete="off" value="G"> 低 (G)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="u" id="u_a" autocomplete="off" value="A"> 中 (A)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="u" id="u_r" autocomplete="off" value="R"> 高 (R)
							</label> 
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="12">
				 <h2>環境評価基準 (基本評価基準を上書き)</h2>
				</bs:mco>
			</bs:row>
				<br/>
			<bs:row>
				<bs:mco colsize="12">
					<h4><b><center><u>攻撃の難易度</u></center></b></h4>
					<br/>
				</bs:mco>
			</bs:row>
			<bs:row>
				<bs:mco colsize="3"><label>攻撃元区分 (MAV):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mav" id="mav_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mav" id="mav_n" autocomplete="off" value="N"> ネットワーク (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mav" id="mav_a" autocomplete="off" value="A"> 隣接 (A)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mav" id="mav_l" autocomplete="off" value="L"> ローカル (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mav" id="mav_p" autocomplete="off" value="P"> 物理 (P)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>攻撃条件の複雑さ (MAC):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mac" id="mac_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mac" id="mac_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mac" id="mac_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>攻撃の実行条件 (MAT):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mat" id="mat_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mat" id="mat_n" autocomplete="off" value="N"> なし (N) 
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mat" id="mat_p" autocomplete="off" value="P"> あり (P)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>必要な特権レベル (MPR):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mpr" id="mpr_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mpr" id="mpr_n" autocomplete="off" value="N"> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mpr" id="mpr_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mpr" id="mpr_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>ユーザー関与 (MUI):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mui" id="mui_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mui" id="mui_n" autocomplete="off" value="N"> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mui" id="mui_p" autocomplete="off" value="P"> 受動的 (P)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mui" id="mui_a" autocomplete="off" value="A"> 能動的 (A)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="12">
					<hr>
					<h4><b><center><u>影響区分</u></center></b></h4>
					<br/>
				</bs:mco>
			</bs:row>
			<bs:row>
				<bs:mco colsize="3"><label> 機密性への影響 (MVC):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mvc" id="mvc_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvc" id="mvc_n" autocomplete="off" value="N"> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvc" id="mvc_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvc" id="mvc_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label> 完全性への影響 (MVI):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mvi" id="mvi_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvi" id="mvi_n" autocomplete="off" value="N"> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvi" id="mvi_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mvi" id="mvi_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label> 可用性への影響 (MVA):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="mva" id="mva_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mva" id="mva_n" autocomplete="off" value="N"> なし (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mva" id="mva_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="mva" id="mva_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<bs:row>
				<bs:mco colsize="12">
					<hr>
					<h4><b><center><u>後続システムへの影響区分</u></center></b></h4>
					<br/>
				</bs:mco>
			</bs:row>
			<bs:row>
				<bs:mco colsize="3"><label> 機密性への影響 (MSC):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="msc" id="msc_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msc" id="msc_n" autocomplete="off" value="N"> 無視できる (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msc" id="msc_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msc" id="msc_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label> 完全性への影響 (MSI):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="msi" id="msi_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msi" id="msi_s" autocomplete="off" value="S"> 安全 (S)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msi" id="msi_n" autocomplete="off" value="N"> 無視できる (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msi" id="msi_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msi" id="msi_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label> 可用性への影響 (MSA):</label> </bs:mco>
				<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="msa" id="msi_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msa" id="msa_s" autocomplete="off" value="S"> 安全 (S)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msa" id="msa_n" autocomplete="off" value="N"> 無視できる (N)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msa" id="msa_l" autocomplete="off" value="L"> 低 (L)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="msa" id="msa_h" autocomplete="off" value="H"> 高 (H)
							</label>
						</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="12">
				<hr>
				 <h2>環境評価基準 (セキュリティ要件)</h2>
				</bs:mco>
			</bs:row>
				<br/>
			<bs:row>
				<bs:mco colsize="3"><label>機密性の要求値 (CR):</label> </bs:mco>
				<bs:mco colsize="9">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-secondary vector"> <input
										type="radio" name="cr" id="cr_x" autocomplete="off"
										 value="X"> 未定義 (X)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="cr" id="cr_l" autocomplete="off" value="L"> 低 (L)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="cr" id="cr_m" autocomplete="off" value="M"> 中 (M)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="cr" id="cr_h" autocomplete="off" value="H"> 高 (H)
									</label>
								</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>完全性の要求値 (IR):</label> </bs:mco>
				<bs:mco colsize="9">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-secondary vector"> <input
										type="radio" name="ir" id="ir_x" autocomplete="off"
										 value="X"> 未定義 (X)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ir" id="ir_l" autocomplete="off" value="L"> 低 (L)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ir" id="ir_m" autocomplete="off" value="M"> 中 (M)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ir" id="ir_h" autocomplete="off" value="H"> 高 (H)
									</label>
								</div>
				</bs:mco>
			</bs:row>
			<br/>
			<bs:row>
				<bs:mco colsize="3"><label>可用性の要求値 (AR):</label> </bs:mco>
				<bs:mco colsize="9">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-secondary vector"> <input
										type="radio" name="ar" id="ar_x" autocomplete="off"
										 value="X"> 未定義 (X)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ar" id="ar_l" autocomplete="off" value="L"> 低 (L)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ar" id="ar_m" autocomplete="off" value="M"> 中 (M)
									</label> <label class="btn btn-secondary vector"> <input type="radio"
										name="ar" id="ar_h" autocomplete="off" value="H"> 高 (H)
									</label>
								</div>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
					<hr>
					 <h2>脅威の動向</h2>
					</bs:mco>
				</bs:row>
				<br/>
				<bs:row>
					<bs:mco colsize="3"><label>攻撃される可能性 (E):</label></bs:mco>
					<bs:mco colsize="9">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-secondary vector"> <input
								type="radio" name="e" id="e_x" autocomplete="off"
								 value="X"> 未定義 (X)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="e" id="e_u" autocomplete="off" value="U"> 未記載 (U)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="e" id="e_p" autocomplete="off" value="P"> 概念実証 (P)
							</label> <label class="btn btn-secondary vector"> <input type="radio"
								name="e" id="e_a" autocomplete="off" value="A"> 攻撃確認 (A)
							</label>
						</div>
					</bs:mco>
				</bs:row>
			</div>
			</div>
			</bs:mco>
			<bs:mco colsize="2">
				<div class="scoreBody">
					<h3 class="scoreNumber None" id="modalScore">0.0</h3>
					<span class="severity None" id="modalSeverity">None</span>
				</div>
			</bs:mco>
		</bs:row>
	</section>
	<input type="hidden" id="modalCVSSString" />
</body>
</html>
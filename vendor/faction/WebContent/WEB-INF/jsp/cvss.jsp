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
			<div class="cvss-content" style="width: 900px; overflow-y: auto; direction:rtl; ">
				<div style="direction:ltr; padding-left: 30px">
				<bs:row>
					<bs:mco colsize="6">
					<h2>基本スコア</h2>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="6">
						<bs:box type="success" title="攻撃元区分 (AV)">
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
						</bs:box>
					</bs:mco>
					<bs:mco colsize="6">
						<bs:box type="success" title="影響範囲 (S)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="s" id="s_u" autocomplete="off" value="U" checked>
									変更なし (U)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="s" id="s_c" autocomplete="off" value="C"> 変更あり (C)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="6">
						<bs:box type="success" title="攻撃条件の複雑さ (AC)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="ac" id="ac_l" autocomplete="off"
									 value="L" checked> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="ac" id="ac_h" autocomplete="off" value="H">
									高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="6">
						<bs:box type="success" title="機密性への影響 (C)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="c" id="c_n" autocomplete="off"
									 value="N" checked> 不要 (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="c" id="c_l" autocomplete="off" value="L"> 低
									(L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="c" id="c_h" autocomplete="off" value="H"> 高
									(H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="6">
						<bs:box type="success" title="必要な特権 (PR)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="pr" id="pr_n" autocomplete="off"
									 value="N" checked> 不要 (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="pr" id="pr_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="pr" id="pr_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="6">
						<bs:box type="success" title="完全性への影響 (I)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="i" id="i_n" autocomplete="off"  value="N" checked>
									なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="i" id="i_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="i" id="i_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="6">
						<bs:box type="success" title="利用者の関与 (UI)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="ui" id="ui_n" autocomplete="off"
									 value="N" checked> 不要 (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="ui" id="ui_r" autocomplete="off" value="R">
									必要 (R)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="6">
						<bs:box type="success" title="可用性への影響 (A)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary activeVector vector"> <input
									type="radio" name="a" id="a_n" autocomplete="off"
									 value="N" checked> 不要 (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="a" id="a_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="a" id="a_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
								<hr/>
					 <h2>現状スコア (任意)</h2>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
						<bs:box type="success" title="攻撃される可能性 (E)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="e" id="e_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="e" id="e_u" autocomplete="off" value="U"> 未検証 (U)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="e" id="e_p" autocomplete="off" value="P"> 実証コードあり (P)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="e" id="e_f" autocomplete="off" value="F"> 攻撃コードあり (F)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="e" id="e_h" autocomplete="off" value="H"> 容易に攻撃可能 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
						<bs:box type="success" title="利用可能な対策 (RL)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="rl" id="rl_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rl" id="rl_o" autocomplete="off" value="O"> 正式修正 (O)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rl" id="rl_t" autocomplete="off" value="T"> 暫定修正 (T)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rl" id="rl_w" autocomplete="off" value="W"> 非公式 (W)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rl" id="rl_u" autocomplete="off" value="U"> なし (U)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
						<bs:box type="success" title="脆弱性情報の信憑性 (RC)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="rc" id="rc_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rc" id="rc_u" autocomplete="off" value="U"> 不明  (U) 
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rc" id="rc_r" autocomplete="off" value="R"> 未検証 (R)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="rc" id="rc_c" autocomplete="off" value="C"> 検証済み (C) 
								</label> 
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
								<hr/>
					<h2>環境評価基準 (任意)</h2>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="12">
						<h4><b><u>悪用可能性</u></b></h4>
					</bs:mco>
					<bs:mco colsize="12">
						<bs:box type="success" title="攻撃元区分の変更 (MAV)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="mav" id="mav_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mav" id="mav_n" autocomplete="off" value="N"> ネットワーク (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mav" id="mav_a" autocomplete="off" value="A"> 近隣 (A)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mav" id="mav_l" autocomplete="off" value="L"> ローカル (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mav" id="mav_p" autocomplete="off" value="P"> 物理 (P)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="12">
						<bs:box type="success" title="攻撃の複雑さの変更 (MAC)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="mac" id="mac_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mac" id="mac_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mac" id="mac_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="12">
						<bs:box type="success" title="Modified Privileges Required (MPR)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="mpr" id="mpr_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mpr" id="mpr_n" autocomplete="off" value="N"> なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mpr" id="mpr_l" autocomplete="off" value="L"> 低 (L)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mpr" id="mpr_h" autocomplete="off" value="H"> 高 (H)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="12">
						<bs:box type="success" title="利用者の関与の変更 (MUI)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="mui" id="mui_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mui" id="mui_n" autocomplete="off" value="N"> なし (N)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="mui" id="mui_r" autocomplete="off" value="R"> 必要 (R)
								</label>
							</div>
						</bs:box>
					</bs:mco>
					<bs:mco colsize="12">
						<bs:box type="success" title="影響範囲の変更 (MS)">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary vector"> <input
									type="radio" name="ms" id="ms_x" autocomplete="off"
									 value="X"> 未評価 (X)
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="ms" id="ms_u" autocomplete="off" value="U"> 変更なし (U) 
								</label> <label class="btn btn-secondary vector"> <input type="radio"
									name="ms" id="ms_c" autocomplete="off" value="C"> Changed (C)
								</label>
							</div>
						</bs:box>
					</bs:mco>
				</bs:row>
				<bs:row>
					<bs:mco colsize="6">
						<bs:row>
							<bs:mco colsize="12">
								<h4><b><u>影響評価</u></b></h4>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="機密性への影響の変更 (MC)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="mc" id="mc_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mc" id="mc_n" autocomplete="off" value="N"> なし (N)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mc" id="mc_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mc" id="mc_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="完全性への影響の変更 (MI)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="mi" id="mi_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mi" id="mi_n" autocomplete="off" value="N"> なし (N)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mi" id="mi_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="mi" id="mi_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="可用性への影響の変更 (MA)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="ma" id="ma_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ma" id="ma_n" autocomplete="off" value="N"> なし (N)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ma" id="ma_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ma" id="ma_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
						</bs:row>
					</bs:mco>
					<bs:mco colsize="6">
						<bs:row>
							<bs:mco colsize="12">
								<h4><b><u>対象システムのセキュリティ要求度</u></b></h4>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="機密性への要求 (CR)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="cr" id="cr_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="cr" id="cr_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="cr" id="cr_m" autocomplete="off" value="M"> Medium (M)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="cr" id="cr_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="完全性への要求 (IR)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="ir" id="ir_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ir" id="ir_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ir" id="ir_m" autocomplete="off" value="M"> Medium (M)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ir" id="ir_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
							<bs:mco colsize="12">
								<bs:box type="success" title="可用性への要求 (AR)">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary vector"> <input
											type="radio" name="ar" id="ar_x" autocomplete="off"
											 value="X"> 未評価 (X)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ar" id="ar_l" autocomplete="off" value="L"> 低 (L)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ar" id="ar_m" autocomplete="off" value="M"> Medium (M)
										</label> <label class="btn btn-secondary vector"> <input type="radio"
											name="ar" id="ar_h" autocomplete="off" value="H"> 高 (H)
										</label>
									</div>
								</bs:box>
							</bs:mco>
						</bs:row>
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
<html>
	<head>
		<title>專案</title>
		<meta name="layout" content="project" />
	</head>
	<body>

		<fieldset>
			<legend>
				專案&家屬資訊
			</legend>
			<span style="display: inline-block; width: 460px">
				<div class="field-row">
					<span class="th1">案名：</span>
					<span>
						<input type="text"
						id="projectName" name="projectName" placeholder="姓名" />
					</span>
				</div>
				<div class="field-row">
					<span class="th1">禮儀公司：</span>
					<span>
						<select
						id="funeralCompany" name="funeralCompany"
						class="validate[required]">
							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select>
					</span>
				</div>
				<div class="field-row">
					<span class="th1">禮儀師：</span>
					<span>
						<select id="funeraler"
						name="funeraler" class="validate[required]">
							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select>
					</span>
				</div>
				<div class="field-row">
					<span class="th1">承辦業務：</span>
					<span>
						<select id="employee"
						name="employee" class="validate[required]">
							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select>
					</span>
				</div>
				<div class="field-row">
					<span class="th1">入館日期：</span>
					<span>
						<input type="text"
						class="validate[required] date" id="inDate" name="inDate" size="10" />
					</span>
				</div>
				<div class="field-row">
					<span class="th1">時間：</span>
					<span>
						<select id="inHour" name="inHour">
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select>
						：
						<select id="inMin" name="inMin">
							<option value="00">00</option>
							<option value="05">05</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
							<option value="35">35</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
							<option value="55">55</option>
						</select>
					</span>
				</div>
			</span>
			<span style="padding-left: 10px; display: inline-block; width: 420px">
				<div class="field-row">
					<span class="th1">聯絡人：</span>
					<span>
						<input type="text"
						id="contact" name="contact" placeholder="" />
					</span>
				</div>
				<div class="field-row">
					<span class="th1">電話：</span>
					<span>
						<input type="text"
						id="contactPhone" name="contactPhone" placeholder="" />
					</span>
				</div>
				<div class="field-row">
					<span class="th1">地址：</span>
					<span>
						<select
						id="contactAddrCity" name="contactAddrCity">
							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select> <!--縣/市-->
						<select id="contactAddrArea" name="contactAddrArea">
							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select> <!--鄉鎮市區-->
					</span>
					<br />
					<span class="th1">&nbsp;</span>
					<span>
						<input
						type="text" id="contactAddr" name="contactAddr" placeholder=""
						size="40" />
					</span>
				</div>
				<div class="field-row">
					<span class="th1">&nbsp;</span>
					<span>
						<div style="float:right;padding-right:40px">
						<button id="add1">
							儲存修改專案資訊
						</button></div>
					</span>
				</div>
			</span>
		</fieldset>
		<div>
			<button id="add1">
				新增
			</button>
			<button id="modify1">
				修改
			</button>
			<button id="delete1">
				刪除
			</button>
			<button id="calendar" style="float: right;">
				專案行事曆
			</button>
		</div>
		<div style="padding-bottom: 10px" id="grid1" />
			<script>
				$(document).ready( function() {

					//禮儀師
					$('#funeralCompany').change( function(event, value) {
						if ($(this).val()) {
							$.ajax({
								type: "POST",
								url: contextRoot + "/combobox/funeraler",
								data: {
									id: $(this).val()
								},
								success: function(map) {
									$('#funeraler').setDropdown(map).val(value);
								}
							})
						} else {
							$('#funeraler').html('')
						}
					});
					var addrMap = {};

					//cityArea
					$('#contactAddrCity').change( function() {
						if ($(this).val()) {
							var val = $(this).val();
							var areaMap = {};
							$.each(addrMap[val], function(index,value) {
								areaMap[value]=value;
							});
							$('#contactAddrArea').setDropdown(areaMap);
						} else {
							$('#contactAddrArea').html('')
						}
					});
					//禮儀公司,承辦業務,city,queryData
					$.when(
					$.post(contextRoot + "/combobox/funeralCompany"),
					$.post(contextRoot + "/combobox/employee"),
					$.post(contextRoot + "/combobox/city"),
					$.post(contextRoot + "/project/queryid", {
						id : responseJSON.id
					})).then( function(map,map2,map3,json) {
						map = map[0];
						map2 = map2[0];
						map3 = map3[0];
						json = json[0];

						addrMap = map3;
						var cityMap= {};
						$.each(addrMap, function(value, text) {
							cityMap[value]=value;
						});
						$('#contactAddrCity').setDropdown(cityMap);
						$('#funeralCompany').setDropdown(map);
						$('#employee').setDropdown(map2);
						$("#projectName").val(json.projectName);
						$("#inDate").val(json.inDate);
						$("#inHour").val(json.inHour);
						$("#inMin").val(json.inMin);
						$("#employee").val(json.employee);
						$("#funeralCompany").val(json.funeralCompany).trigger("change",[json.funeraler]);

						document.title = json.projectName + " - 專案";
					});
					var grid1 = $("#grid1").jqGrid({
						url: contextRoot + "/project/queryNonClose",
						height: 250,
						caption: "商品使用清單",
						//multiboxonly:true,
						autowidth: true,
						pager: true,
						multiselect: true,
						colModel: [{
							name: 'id',
							index: 'id',
							hidden: true
						},{
							header: "案名",
							name: 'projectName',
							index: 'projectName',
							width: 60
						},{
							header: "禮儀公司/禮儀師",
							name: 'funeraler.funeralerName',
							index: 'funeraler.funeralerName',
							width: 80

						},{
							header: "進館日期",
							name: 'inDate',
							index: 'inDate',
							width: 130
						},{
							header: "出館日期",
							name: 'outDate',
							index: 'outDate',
							width: 130
						},{
							header: "承辦業務",
							name: 'emp.empName',
							index: 'emp.empName',
							width: 80
						},{
							header: "消費總金額",
							name: 'sallingTotal',
							index: 'sallingTotal',
							width: 80,
							align: "right"
						},{
							header: "內帳銷售總金額",
							name: 'total',
							index: 'total',
							width: 80,
							align: "right"
						},{
							header: "備註",
							name: 'memo',
							index: 'memo',
							width: 150,
							sortable: false
						}],
						ondblClickRow: function(id) {
							var data = grid1.getRowData(id);
							API.openCalendar({
								type: "project",
								id: data.id,
								data: $.extend(data, {})
							});
						}
					});

					$("#delete1").click( function() {
						var selrow = grid1.jqGrid('getGridParam', 'selrow');
						if (!selrow) {
							alert("請先選擇刪除列");
						}
						if (!confirm("確定要刪除?")) {
							return;
						}
						var id = grid1.getRowData(selrow);
						$.ajax({
							url: contextRoot + "/project/delete",
							data: id,
							success: function(msg) {
								grid1.trigger("reloadGrid");
								alert("刪除成功");
							}
						})
					});
					$("#modify1").click( function() {
						var selrow = grid1.jqGrid('getGridParam', 'selrow');
						if (!selrow) {
							alert("請先選擇修改列");
						}
						var id = grid1.getRowData(selrow);
						$.ajax({
							url: contextRoot + "/project/modify",
							data: {
								columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
								data: JSON.stringify(id)
							},
							success: function(msg) {
								grid1.trigger("reloadGrid");
								alert("修改成功 ");
							}
						})
					});
					$("#calendar").click( function() {
						API.openCalendar({
							id: responseJSON.id,
							type: "p"
						})
					});
				});
			</script>
	</body>
</html>

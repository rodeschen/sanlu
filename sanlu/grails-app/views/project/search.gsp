<html>
	<head>
		<title>搜尋專案</title>
		<meta name="layout" content="inner" />
	</head>
	<body>
		<g:form name="addForm" id="addForm" onsubmit="return false;"
		autocomplete="off" novalidate="novalidate">
			<input type="text" id="id" name="id" class="hide" />
			<fieldset>
				<legend>
					搜尋
				</legend>
				<span style="padding-left: 10px; display: inline-block; width: 460px">
					<div class="field-row">
						<span class="th1">案名：</span><span>
							<input type="text"
							id="projectName" name="projectName" placeholder="姓名" />
						</span>
					</div>
					<div class="field-row">
						<span class="th1">禮儀公司：</span><span>
							<select
							id="funeralCompany" name="funeralCompany">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
					</div>
					<div class="field-row">
						<span class="th1">禮儀師：</span><span>
							<select id="funeraler"
							name="funeraler">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
					</div>
					<div class="field-row">
						<span class="th1">承辦業務：</span><span>
							<select id="employee"
							name="employee">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
					</div>
					<div class="field-row">
						<span class="th1">入館日期：</span><span>
							<input
							type="text" class="validate[required] date" id="inDate" name="inDate"
							size="12" />
							之前
							<input type="radio"
							id="inDateKind" name="inDateKind" value="B" checked='checked'>
							&nbsp;之後
							<input
							type="radio" id="inDateKind" name="inDateKind" value="A">
							&nbsp; </span>
					</div>
					<div class="field-row">
						<span class="th1">出館日期：</span><span>
							<input
							type="text" class="validate date" id="outDate" name="outDate"
							size="12" />
							之前
							<input type="radio"
							id="outDateKind" name="outDateKind" value="B" checked='checked'>
							&nbsp;之後
							<input
							type="radio" id="outDateKind" name="outDateKind" value="A">
							&nbsp; </span>
					</div>
					<div class="field-row">
						<span>
							<button id="search">
								搜尋
							</button> </span>
					</div> </span><span
				style="padding-left: 10px; display: inline-block; width: 420px">
					<div class="field-row">
						<span class="th1">聯絡人：</span><span>
							<input type="text"
							id="contact" name="contact" placeholder="" />
						</span>
					</div>
					<div class="field-row">
						<span class="th1">電話：</span><span>
							<input type="text"
							id="contactPhone" name="contactPhone" placeholder="" />
						</span>
					</div>
					<div class="field-row">
						<span class="th1">地址：</span><span>
							<select
							id="contactAddrCity" name="contactAddrCity">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> <!--縣/市-->
							<select id="contactAddrArea" name="contactAddrArea">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> <!--鄉鎮市區--> </span>
						<br />
					</div>
					<div class="field-row">
						<span class="th1" style="vertical-align: top">備註：</span><span> 							<textarea id="memo" name="memo" cols="30" rows="4"></textarea> </span>
					</div> </span>
			</fieldset>
		</g:form>
		<div>
			<button id="modify1">
				修改
			</button>
		</div>
		<div style="padding-bottom: 10px" id="projectGrid"></div>
		<script>
			$(document).ready(function() {

				var productArea = $("#productArea");
				var startTime = $(".startTime"), endTime = $(".endTime"), costUnit = $(".costUnit"), costRange = $(".costRange"), timeSelect = $(".timeSelect");
				var endMin = $("#endMin"), mouth = $(".mouth"), modify = $("#modify1");
				//禮儀師
				$('#funeralCompany').change(function(event, value) {
					if($(this).val()) {
						$.ajax({
							type : "POST",
							url : contextRoot + "/combobox/funeraler",
							data : {
								id : $(this).val()
							},
							success : function(map) {
								$('#funeraler').setDropdown(map).val(value);
							}
						})
					} else {
						$('#funeraler').html('');
					}
				});
				var addrMap = {};

				//cityArea
				$('#contactAddrCity').change(function(event, value) {
					if($(this).val()) {
						var val = $(this).val();
						var areaMap = {};
						$.each(addrMap[val], function(index, value) {
							areaMap[value] = value;
						});
						$('#contactAddrArea').setDropdown(areaMap).val(value);
					} else {
						$('#contactAddrArea').html('');
					}
				});
				//禮儀公司,承辦業務,city,queryData
				$.when($.post(contextRoot + "/combobox/funeralCompany"), $.post(contextRoot + "/combobox/employee"), $.post(contextRoot + "/combobox/city")).then(function(map, map2, map3) {
					map = map[0];
					map2 = map2[0];
					map3 = map3[0];
					addrMap = map3;
					var cityMap = {};
					$.each(addrMap, function(value, text) {
						cityMap[value] = value;
					});
					$('#contactAddrCity').setDropdown(cityMap);
					$('#funeralCompany').setDropdown(map);
					$('#employee').setDropdown(map2);

					document.title = " 搜尋 專案 ";
				});
				var grid1 = $("#projectGrid").jqGrid({
					url : contextRoot + "/project/searchProject",
					datatype : "local",
					mtype : 'POST',
					caption : "搜尋結果",
					pager : true,
					sortname: 'inDate',
					colModel : [{
						name : 'id',
						index : 'id',
						hidden : true
					}, {
						header : "案名",
						name : 'projectName',
						index : 'projectName',
						width : 60
					}, {
						header : "禮儀公司",
						name : 'funeralCompany.funeralCompanyName',
						index : 'funeralCompany.funeralCompanyName',
						width : 80

					}, {
						header : "禮儀師",
						name : 'funeraler.funeralerName',
						index : 'funeraler.funeralerName',
						width : 80

					}, {
						header : "進館日期",
						name : 'inDate',
						index : 'inDate',
						align : "center",
						width : 130,
						sorttype: "date"
					}, {
						header : "出館日期",
						name : 'outDate',
						index : 'outDate',
						align : "center",
						width : 130,
						sorttype: "date"
					}, {
						header : "承辦業務",
						name : 'emp.empName',
						index : 'emp.empName',
						width : 80
					}, {
						header : "消費總金額",
						name : 'sallingTotal',
						index : 'sallingTotal',
						width : 80,
						align : "right",
						formatter : "currency"
					}, {
						header : "內帳銷售總金額",
						name : 'total',
						index : 'total',
						width : 80,
						align : "right",
						formatter : "currency"
					}, {
						header : "備註",
						name : 'memo',
						index : 'memo',
						width : 150,
						sortable : false
					}],
					ondblClickRow : function(id) {
						modify.click();
					}
				});

				$("#search").click(function() {
					if($("#addForm").validationEngine('validate')) {
						grid1.jqGrid('setGridParam', {
							postData : $("#addForm").serializeData(),
							datatype : "json"
						}).trigger("reloadGrid");
					}
				});

				modify.click(function() {
					var selrow = grid1.jqGrid('getGridParam', 'selrow');
					if(selrow) {
						var data = grid1.getRowData(selrow);
						API.openProject({
							id : data.id,
							data : data
						});
					}
				});
			});

		</script>
	</body>
</html>

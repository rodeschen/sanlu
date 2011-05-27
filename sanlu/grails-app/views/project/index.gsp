<html>
	<head>
		<title>專案</title>
		<meta name="layout" content="project" />
	</head>
	<body>
		<fieldset>
			<legend>
				專案資訊
			</legend>
			<div class="field-row">
				<span class="th1">案名：</span>
				<span>
					<input type="text" id="projectName" name="projectName" placeholder="姓名" />
				</span>
			</div>
			<div class="field-row">
				<span class="th1">禮儀公司：</span>
				<span>
					<select  id="funeralCompany" name="funeralCompany">
						<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
					</select>
				</span>
			</div>
			<div class="field-row">
				<span class="th1">禮儀師：</span>
				<span>
					<select  id="funeraler" name="funeraler">
						<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
					</select>
				</span>
			</div>
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
			<button id="calendar" style="float:right;">
				專案行事曆
			</button>
		</div>
		<div style="padding-bottom:10px" id="grid1"/>

			<script>
				$(document).ready( function() {
					
					var grid1 = $("#grid1").jqGrid({
						url: contextRoot + "/project/query",
						height: 250,
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
						//caption: "Manipulating Array Data",
						ondblClickRow: function(id) {
							var data = grid1.getRowData(id);
							API.openCalendar({
								type:"project",
								id:data.id,
								data:$.extend(data, {

								})
							});
						}
					});

					$("#delete1").click( function() {
						var selrow = grid1.jqGrid('getGridParam', 'selrow');
						if (!selrow) {
							alert("請先選擇刪除列");
						}
						if(!confirm("確定要刪除?")) {
							return ;
						}
						var id = grid1.getRowData(selrow);
						$.ajax({
							type: "POST",
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
							type: "POST",
							url: contextRoot + "/project/modify",
							data: {
								columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
								data : JSON.stringify(id)
							},
							success: function(msg) {
								grid1.trigger("reloadGrid");
								alert("修改成功 ");
							}
						})
					});
					//下拉選單
					//禮儀公司
                    $.ajax({
						type: "POST",
						url: contextRoot + "/combobox/funeralCompany",
						success: function(map) {
							$('#funeralCompany').setDropdown(map);
						}
					});
					//禮儀師
					$.ajax({
						type: "POST",
						url: contextRoot + "/combobox/funeraler",
						success: function(map) {
							$('#funeraler').setDropdown(map);
						}
					});
				});
			</script>
	</body>
</html>
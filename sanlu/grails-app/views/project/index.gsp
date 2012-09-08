<html>	<head>		<title>專案</title>		<meta name="layout" content="project" />	</head>	<body>		<g:form name="addForm" id="addForm" onsubmit="return false;"		autocomplete="off" novalidate="novalidate">			<input type="text" id="id" name="id" class="hide" />			<fieldset>				<legend>					專案&家屬資訊				</legend>				<span style="display: inline-block; width: 460px">					<div class="field-row">						<span class="th1">案名：</span><span>							<input type="text"							id="projectName" name="projectName" placeholder="姓名"							class="validate[required]" />						</span>					</div>					<div class="field-row">						<span class="th1">禮儀公司：</span><span>							<select							id="funeralCompany" name="funeralCompany"							class="validate[required]">								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>							</select> </span>					</div>					<div class="field-row">						<span class="th1">禮儀師：</span><span>							<select id="funeraler"							name="funeraler" class="validate[required]">								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>							</select> </span>					</div>					<div class="field-row">						<span class="th1">承辦業務：</span><span>							<select id="employee"							name="employee" class="validate[required]">								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>							</select> </span>					</div>					<div class="field-row">						<span class="th1">入館日期：</span><span>							<input type="text"							class="validate[required] date" id="inDate" name="inDate"							size="12" />						</span>					</div>					<div class="field-row">						<span class="th1">時間：</span><span>							<select id="inHour"							name="inHour">								<option value="00">00</option>								<option value="01">01</option>								<option value="02">02</option>								<option value="03">03</option>								<option value="04">04</option>								<option value="05">05</option>								<option value="06">06</option>								<option value="07">07</option>								<option value="08">08</option>								<option value="09">09</option>								<option value="10">10</option>								<option value="11">11</option>								<option value="12">12</option>								<option value="13">13</option>								<option value="14">14</option>								<option value="15">15</option>								<option value="16">16</option>								<option value="17">17</option>								<option value="18">18</option>								<option value="19">19</option>								<option value="20">20</option>								<option value="21">21</option>								<option value="22">22</option>								<option value="23">23</option>							</select> ：							<select id="inMin" name="inMin">								<option value="00">00</option>								<option value="05">05</option>								<option value="10">10</option>								<option value="15">15</option>								<option value="20">20</option>								<option value="25">25</option>								<option value="30">30</option>								<option value="35">35</option>								<option value="40">40</option>								<option value="45">45</option>								<option value="50">50</option>								<option value="55">55</option>							</select> </span>					</div>					<div class="field-row closeDate">						<span>							<button id="update">								儲存修改專案資訊							</button> </span>					</div> </span><span				style="padding-left: 10px; display: inline-block; width: 420px">					<div class="field-row">						<span class="th1">案號：</span><span> <label id="projectNo"							name="projectNo"> </label> </span>					</div>					<div class="field-row">						<span class="th1">聯絡人：</span><span>							<input type="text"							id="contact" name="contact" placeholder="" />						</span>					</div>					<div class="field-row">						<span class="th1">電話：</span><span>							<input type="text"							id="contactPhone" name="contactPhone" placeholder="" />						</span>					</div>					<div class="field-row">						<span class="th1">地址：</span><span>							<select							id="contactAddrCity" name="contactAddrCity">								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>							</select> <!--縣/市-->							<select id="contactAddrArea" name="contactAddrArea">								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>							</select> <!--鄉鎮市區--> </span>						<br />						<span class="th1">&nbsp;</span><span>							<input							type="text" id="contactAddr" name="contactAddr" placeholder=""							size="40" />						</span>					</div>					<div class="field-row">						<span class="th1" style="vertical-align: top">備註：</span><span> 							<textarea id="memo" name="memo" cols="30" rows="3">                            </textarea> </span>					</div> </span>			</fieldset>		</g:form>		<div>			<button id="modifyView" style="color: green">				修改顯示狀態			</button>			<span class="closeDate hide"><a id="add" href="#pdialog"				class="button">新增</a>				<button id="modify1">					修改商品				</button>				<button id="delete1">					刪除				</button>				<button id="closing">					結帳				</button> </span><span class="download hide">				<g:if test="${1==session.empLevel}">					<button id="updateBeforeClosing">						修改帳單為結帳前狀態					</button>				</g:if>				<button id="downloadInternalBill">					下載內帳單				</button>				<button id="downloadBill">					下載帳單				</button> </span>			<button id="calendar" style="float: right;">				專案行事曆			</button>		</div>		<div style="padding-bottom: 10px" id="grid1"></div>		<!-- dialog -->		<div class="hide">			<div id="pdialog" class="dialog" style="display: block; width: 470px;">				<g:form name="addProductForm" id="addProductForm"				onsubmit="return false;" autocomplete="off" novalidate="novalidate">					<input type="text" class="hide" id="isupdate" name="isupdate"					value="N" />					<input type="text" class="hide" id="detailid" name="detailid" />					<div class="dialog-body">						<fieldset style="margin: 10 10px">							<legend>								新增使用商品							</legend>							<div class="field-row">								<span class="th2" style="color: black">商品類別：</span><span>									<input									type="radio" id="type" name="type" value="1" checked="checked" />									一般									<input									type="radio" id="type" name="type" value="3" />									場地 <!--									<input type="radio" id="type" name="type" value="3"/>									專案--></span>							</div>							<div id="productArea" style="">								<!--								<div class="field-row">								<span class="th2">顯示於外帳單：</span>								<span><input type="checkbox" id="showBill" name="showBill" class="" value="1" checked="checked" /></span>								</div>-->								<div id="type1" class="productArea" style="">									<div class="field-row">										<span class="th2">一般產品類型：</span><span>											<select											id="productType" name="productType" class="validate[required]">												<option value="0">一般商品</option>												<option value="1">無庫存商品</option>												<option value="2" selected="selected">代叫商品</option>											</select> </span>									</div>									<div class="field-row">										<span class="th2">產品名稱：</span><span>											<input id="productAuto1" name="productAuto1" class="validate[required]" >											<select											id="product1" name="product1"											class="validate[required] product hide">												<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>											</select> </span>									</div>									<g:if test="${1==session.empLevel}">										<div class="field-row">											<span class="th2">調整後單價：</span><span>												<input												type="text" id="modifiedPrice1" name="modifiedPrice1"												class="validate[custom[integer]]" />												<span												style="color: #AB8915;">&nbsp;空白為原價</span></span>										</div>									</g:if>									<div class="field-row">										<span class="th2">數量：</span><span>											<input id="amount1"											name="amount1" class="validate[required,custom[integer]]" />										</span>									</div>									<div class="field-row" id="vendor1Div" style="display: none;">										<span class="th2">廠商名稱：</span><span>											<input id="vendor1"											name="vendor1" class="validate[required]" />										</span>									</div>								</div>								<div id="type3" class="productArea" style="display: none;">									<div class="field-row">										<span class="th2">產品名稱：</span><span>											<input id="productAuto3" name="productAuto3" class="validate[required]" >											<select											id="product3" name="product3"											class="validate[required] product hide">												<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>											</select> </span>									</div>									<g:if test="${1==session.empLevel}">										<div class="field-row">											<span class="th2">調整後單價：</span><span>												<input												type="text" id="modifiedPrice3" name="modifiedPrice3"												class="validate[custom[integer]]" />												<span												style="color: #AB8915;">&nbsp;空白為原價</span></span>										</div>									</g:if>									<div class="field-row">										<span class="th2">場地：</span><span>											<select id="place3"											name="place3" class="validate[required]">												<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>											</select> </span>									</div>									<div class="field-row">										<span class="th2">數量：</span><span>											<input id="amount3"											name="amount3" value="1"											class="validate[required,custom[integer]]" />										</span>									</div>								</div>								<div class="field-row costUnit hide">									<span class="th2">時間類型：</span><span>										<select										id="costUnit" name="costUnit" disabled="disabled">											<option value="0">次</option>											<option value="1">次(時間)</option>											<option value="2">小時</option>											<option value="3">天</option>											<option value="4">月</option>										</select> </span><span class="costRange" style="color: #AB8915;">&nbsp;&nbsp;單位：										<input										type="text" size="4" readonly="readonly" id="costRange"										name="costRange"										style="border: 0px; background-color: #F1F1F1;" />									</span>								</div>								<div class="field-row startTime hide">									<span class="th2">開始/使用時間：</span><span>										<input										type="text" class="validate[required] date" id="startDate"										name="startDate" size="12" />									</span><span><span										class="timeSelect">											<select id="startHour"											name="startHour" class="timeSelect">												<option value="00">00</option>												<option value="01">01</option>												<option value="02">02</option>												<option value="03">03</option>												<option value="04">04</option>												<option value="05">05</option>												<option value="06">06</option>												<option value="07">07</option>												<option value="08">08</option>												<option value="09">09</option>												<option value="10">10</option>												<option value="11">11</option>												<option value="12">12</option>												<option value="13">13</option>												<option value="14">14</option>												<option value="15">15</option>												<option value="16">16</option>												<option value="17">17</option>												<option value="18">18</option>												<option value="19">19</option>												<option value="20">20</option>												<option value="21">21</option>												<option value="22">22</option>												<option value="23">23</option>											</select> ：											<select id="startMin" name="startMin" class="timeSelect">												<option value="00">00</option>												<option value="05">05</option>												<option value="10">10</option>												<option value="15">15</option>												<option value="20">20</option>												<option value="25">25</option>												<option value="30">30</option>												<option value="35">35</option>												<option value="40">40</option>												<option value="45">45</option>												<option value="50">50</option>												<option value="55">55</option>											</select> </span></span>								</div>								<div class="field-row mouth hide">									<span class="th2">共</span><span>										<input type="text"										class="validate[required,custom[integer]]" id="mouth"										name="mouth" size="3" />									</span><span style="color: #AB8915;">&nbsp;個月</span>								</div>								<div class="field-row endTime hide">									<span class="th2">結束時間：</span><span>										<input type="text"										class="validate[required] date" id="endDate" name="endDate"										size="12" />									</span><span><span class="timeSelect">											<select											id="endHour" name="endHour">												<option value="00">00</option>												<option value="01">01</option>												<option value="02">02</option>												<option value="03">03</option>												<option value="04">04</option>												<option value="05">05</option>												<option value="06">06</option>												<option value="07">07</option>												<option value="08">08</option>												<option value="09">09</option>												<option value="10">10</option>												<option value="11">11</option>												<option value="12">12</option>												<option value="13">13</option>												<option value="14">14</option>												<option value="15">15</option>												<option value="16">16</option>												<option value="17">17</option>												<option value="18">18</option>												<option value="19">19</option>												<option value="20">20</option>												<option value="21">21</option>												<option value="22">22</option>												<option value="23">23</option>											</select> ：											<select id="endMin" name="endMin" disabled="disable">												<option value="00">00</option>												<option value="05">05</option>												<option value="10">10</option>												<option value="15">15</option>												<option value="20">20</option>												<option value="25">25</option>												<option value="30">30</option>												<option value="35">35</option>												<option value="40">40</option>												<option value="45">45</option>												<option value="50">50</option>												<option value="55">55</option>											</select> </span></span>								</div>							</div>						</fieldset>						<div style="text-align: center;">							<button id="padd" type="button">								確定							</button>							<button id="pclose" class="dialogClose" type="button">								取消							</button>						</div>					</div>				</g:form>			</div>		</div>		<script>			$(document).ready(function() {				var productArea = $("#productArea"),productAuto1 = $("#productAuto1");				var startTime = $(".startTime"), endTime = $(".endTime"), costUnit = $(".costUnit"), costRange = $(".costRange"), timeSelect = $(".timeSelect");				var endMin = $("#endMin"), mouth = $(".mouth"), productType = $("#productType");				//禮儀師				$('#funeralCompany').change(function(event, value) {					if ($(this).val()) {						$.ajax({							type : "POST",							url : contextRoot + "/combobox/funeraler",							data : {								id : $(this).val()							},							success : function(map) {								$('#funeraler').setDropdown(map).val(value);							}						})					} else {						$('#funeraler').html('')					}				});				var addrMap = {};				//cityArea				$('#contactAddrCity').change(function(event, value) {					if ($(this).val()) {						var val = $(this).val();						var areaMap = {};						$.each(addrMap[val], function(index, value) {							areaMap[value] = value;						});						$('#contactAddrArea').setDropdown(areaMap).val(value);					} else {						$('#contactAddrArea').html('')					}				});				//禮儀公司,承辦業務,city,queryData				$.when($.post(contextRoot + "/combobox/funeralCompany"), $.post(contextRoot + "/combobox/employee"), $.post(contextRoot + "/combobox/city"), $.post(contextRoot + "/project/queryid", {					id : responseJSON.id				})).then(function(map, map2, map3, json) {					map = map[0];					map2 = map2[0];					map3 = map3[0];					json = json[0];					addrMap = map3;					var cityMap = {};					$.each(addrMap, function(value, text) {						cityMap[value] = value;					});					$('#contactAddrCity').setDropdown(cityMap);					$('#funeralCompany').setDropdown(map);					$('#employee').setDropdown(map2);					$("#id").val(json.id);					$("#projectNo").html(json.projectNo);					$("#projectName").val(json.projectName);					$("#inDate").val(json.inDate);					$("#inHour").val(json.inHour);					$("#inMin").val(json.inMin);					$("#employee").val(json.employee);					$("#funeralCompany").val(json.funeralCompany).trigger("change", [json.funeraler]);					$("#contact").val(json.contact);					$("#contactPhone").val(json.contactPhone);					$("#contactAddrCity").val(json.contactAddrCity).trigger("change", [json.contactAddrArea]);					$("#contactAddr").val(json.contactAddr);					$("#memo").val(json.memo);					if (json.closingDate) {						$(".download").show();						$(".closeDate").hide();						$("#addForm").find(":input,select").attr("readonly", true).filter("select").prop("disabled", true).end().filter(".date").datepicker('destroy');					} else {						$(".download").hide();						$(".closeDate").show();					}					document.title = json.projectName + " - 專案";				});				var grid1 = $("#grid1").jqGrid({					url : contextRoot + "/project/queryDetail",					height : 200,					postData : {						id : responseJSON.id					},					caption : "商品使用清單",					//multiboxonly:true,					autowidth : true,					pager : false,					rowNum : 400,					grouping : true,					groupingView : {						groupField : ['productName'],						groupColumnShow : [false],						groupText : ['<b style="color:#009">{0}</b>'],						groupCollapse : false,						// groupOrder: ['asc'],						groupSummary : [true],						showSummaryOnHide : true//,						//  groupDataSorted: true					},					pgbuttons : false,					pginput : false,					forceFit : false,					footerrow : true,					userDataOnFooter : true,					colModel : [{						name : 'id',						index : 'id',						key : true,						hidden : true					}, {						header : "顯示",						name : 'showBill',						index : 'showBill',						width : 60,						align : 'center',						formatter : 'checkbox',						editoptions : {							value : '1:0'						},						formatoptions : {							disabled : false						}					}, {						header : "品名",						name : 'productName',						index : 'product.productName',						width : 60,						align : 'center',						hidden : true					}, {						header : "單價",						name : 'price',						index : 'price',						width : 80,						align : "right",						formatter : "currency",						summaryType : 'count',						summaryTpl : '筆數：{0}'					}, {						header : "調整後單價",						name : 'modifiedPrice',						index : 'modifiedPrice',						width : 80,						align : "right",						formatter : "currency"					}, {						header : "數量",						name : 'quantityView',						index : 'quantityView',						width : 100,						align : "right",						//formatter: "currency",						summaryType : 'sum'					}, {						header : "數量",						name : 'quantity',						index : 'quantity',						width : 100,						align : "right",						hidden : true					}/*,           {					 header: "單位",					 name: 'unit',					 index: 'product.unit',					 width: 30,					 align: 'center'					 }*/					, {						header : "小計",						name : 'amount',						index : 'amount',						width : 80,						align : "right",						formatter : "currency",						summaryType : 'sum'					}, {						header : "使用場地",						name : 'placeName',						index : 'place.placeName',						width : 80,						align : "center"					}, {						header : "使用時間",						name : 'useTime',						index : 'useTime',						width : 300,						align : "center"					}, {						name : 'type',						index : 'type',						align : "center",						hidden : true					}, {						name : 'productType',						index : 'productType',						align : "center",						hidden : true					}, {						name : 'startTime',						index : 'startTime',						align : "center",						hidden : true					}, {						name : 'endTime',						index : 'endTime',						align : "center",						hidden : true					}, {						name : 'productId',						index : 'product.id',						align : "center",						hidden : true					}, {						name : 'vendor',						index : 'vendor',						align : "center",						hidden : true					}, {						name : 'placeId',						index : 'place.id',						width : 80,						align : "center",						hidden : true					}, {						name : 'modifiedPrice',						index : 'modifiedPrice',						width : 80,						align : "center",						hidden : true					}, {						header : "建立人",						name : 'lastModifyBy.empName',						index : 'lastModifyBy.empName',						width : 100,						align : "center"					}, {						header : "建立日期",						name : 'lastUpdated',						index : 'lastUpdated',						width : 150,						align : "center"					}]					/*,					 ondblClickRow: function(id) {					 var data = grid1.getRowData(id);					 API.openCalendar({					 type: "project",					 id: data.id,					 data: $.extend(data, {})					 });					 }*/				});				$("#delete1").click(function() {					var selrow = grid1.jqGrid('getGridParam', 'selrow');					if (!selrow) {						alert("請先選擇刪除列");						return;					}					if (!confirm("確定要刪除?")) {						return;					}					var id = grid1.getRowData(selrow);					$.ajax({						url : contextRoot + "/project/deleteProduct",						data : id,						success : function(msg) {							grid1.trigger("reloadGrid");							alert("刪除成功");						}					})				});				$("#modify1").click(function() {					var selrow = grid1.jqGrid('getGridParam', 'selrow');					if (!selrow) {						alert("請先選擇修改列");						return;					}					var data = grid1.getRowData(selrow);					$("#add").click();					var form = $("#addProductForm");					form.find(":radio[value=" + data.type + "]").click();					var product = form.find("#product" + data.type);					setTimeout(function() {						window.inputModify = function() {							$('#place3').val(data.placeId);						}						productType.val(data.productType).change();						product.val(data.productId).change();						form.find("#productAuto"+data.type).val(data.productName);						form.find("#amount" + data.type).val(data.quantity);						form.find("#vendor" + data.type).val(data.vendor);						form.find("#modifiedPrice" + data.type).val(data.modifiedPrice);						var sd = data.startTime.split(" "), ed = data.endTime.split(" ");						var st = sd[1].split(":"), et = ed[1].split(":");						form.find("#startDate").val(sd[0]);						form.find("#endDate").val(ed[0]);						form.find("#startHour").val(st[0]);						form.find("#startMin").val(st[1]);						form.find("#endHour").val(et[0]);						form.find("#endMin").val(et[1]);						form.find("#isupdate").val("Y");						form.find("#detailid").val(data.id);					}, 500);				});				$("#calendar").click(function() {					API.openCalendar({						id : responseJSON.id,						type : "p",						data : {							calendarName : $("#projectName").val(),							inDate : $("#inDate").val()						}					})				});				$("#update").click(function() {					if ($("#addForm").validationEngine('validate')) {						$.ajax({							url : contextRoot + "/project/updateAction",							data : $("#addForm").serializeData()						}).done(function() {							opener.$("#projectGrid").trigger("reloadGrid");							alert("修改完成!")						});					}				});				$(":input[name=type]").click(function() {					var val = $(this).val();					productArea.find(".productArea:visible").hide('slide', 200, function() {						productArea.find("#type" + val).show("slide", 200).end().find(".startTime,.endTime,.mouth").hide().end().find(".product").val("").trigger("change");						costUnit.hide();					});				});				function productChange() {					var $this = $(this), opt = $this.find("option[value=" + $this.val() + "]"), unit = opt.attr("unit"), range = opt.attr("range");					switch (unit) {						case "0":							//次							startTime.show();							endTime.hide();							costRange.hide();							timeSelect.show();							mouth.hide();							break;						case "1":							//次(時間)							startTime.show();							//endTime.show();							costRange.hide();							timeSelect.show();							mouth.hide();							break;						case "2":							//小時							startTime.show();							endTime.hide();							// endTime.show();							costRange.show();							timeSelect.show();							mouth.hide();							break;						case "3":							//天							startTime.show();							endTime.hide();							endTime.show();							timeSelect.hide();							mouth.hide();							break;						case "4":							//月							startTime.show();							endTime.hide();							timeSelect.hide();							//mouth.show();							break;					}					costUnit.show().find("#costUnit").val(unit).end().find("#costRange").val(range);				}				//init project				var productMap = [], product = $("#product1"), product3 = $("#product3");				$.post(contextRoot + "/combobox/normalProduct", function(map) {					productMap[0] = map;				});				$.post(contextRoot + "/combobox/normalProduct1", function(map) {					productMap[1] = map;				});				$.post(contextRoot + "/combobox/normalProduct2", function(map) {					productMap[2] = map;				});				var productAutoUrl = ["/combobox/normalProductAuto", "/combobox/normalProductAuto1", "/combobox/normalProductAuto2"];				productType.change(function() {					var val = $(this).val();					productAuto1.val("").trigger('change');					product.setDropdown(productMap[val]).change(productChange);					$("#vendor1Div")[val == 2 ? 'show' : 'hide']();					productAuto1.autocomplete({						source : contextRoot + productAutoUrl[val],						change : function() {							var this$ = $(this);							var selected = product.find("option:contains(" + this$.val() + ")");							if (selected.length) {								selected.attr('selected', 'selected').trigger("change");							} else {								alert("選單中無此值:" + this$.val());								this$.val('');							}						}					});				});				$.post(contextRoot + "/combobox/placeOfProduct", function(map) {					product3.setDropdown(map).change(productChange);				});				$("#productAuto3").autocomplete({					source : contextRoot + "/combobox/placeOfProductAuto",					change : function() {						var this$ = $(this);						var selected = product3.find("option:contains(" + this$.val() + ")");						if (selected.length) {							selected.attr('selected', 'selected').trigger("change");						} else {							alert("選單中無此值:" + this$.val());							this$.val('');						}					}				});				product3.change(function() {					$.post(contextRoot + "/combobox/placeByProduct", {						id : $(this).val()					}, function(map) {						$('#place3').setDropdown(map);					}).done(function(json) {						window.inputModify && inputModify(json);						window.inputModify = null;					});				});				$("#add").fancybox({					'titlePosition' : 'inside',					'transitionIn' : 'elastic',					'transitionOut' : 'elastic',					'onStart' : function() {						productType.trigger('change');						var fullDate = new Date()						//convert month to 2 digits						var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);						var currentDate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + fullDate.getDate();						productArea.find("#startDate").val(currentDate);					},					'onClosed' : function() {						$("#pdialog").find("form").each(function() {							this.reset();						}).end().find("#type[value=1]").trigger("click");						productArea.find(".productArea").hide().end().find("#type1").show().end().find(".startTime,.endTime,.mouth,.costUnit").hide();					}				});				$("#padd").click(function() {					var form = $("#addProductForm");					if (form.validationEngine('validate')) {						$.ajax({							url : contextRoot + (form.find("#isupdate").val() == "Y" ? "/project/updateProduct" : "/project/addProduct"),							data : $.extend(responseJSON, form.serializeData())						}).done(function(json) {							$.fancybox.close();							grid1.trigger("reloadGrid");						});					}				});				$("#pclose").click(function() {					$.fancybox.close();				});				$("#downloadBill").click(function() {					API.formSubmit({						url : contextRoot + "/excel/bill",						target : "_self",						data : {							projectId : responseJSON.id						}					});				});				$("#downloadInternalBill").click(function() {					API.formSubmit({						url : contextRoot + "/excel/internalBill",						target : "_self",						data : {							projectId : responseJSON.id						}					});				});				$("#startMin").change(function() {					endMin.val($(this).val());				});				$("#modifyView").click(function() {					var datas = grid1.getRowData();					$.ajax({						url : contextRoot + "/project/updateViewBill",						data : {							data : JSON.stringify(datas)						},						success : function() {							alert("更新完成");						}					})					for (var data in datas) {						console.debug(datas[data])					}				});				$("#closing").click(function() {					$.ajax({						url : contextRoot + "/project/updateClosing",						data : {							id : responseJSON.id						},						success : function() {							$(".download").show();							$(".closeDate").hide();							$("#addForm").find(":input,select").attr("readonly", true).filter("select").prop("disabled", true).end().filter(".date").datepicker('destroy');							alert("結帳完成");						}					})				});				//修改帳單為結帳前狀態				$("#updateBeforeClosing").click(function() {					var datas = grid1.getRowData();					$.ajax({						url : contextRoot + "/project/updateBeforeClosing",						data : {							id : responseJSON.id						},						success : function() {							$(".download").hide();							$(".closeDate").show();							$("#addForm").find(":input,select").attr("readonly", false).filter("select").prop("disabled", false).end().filter(".date").datepicker();							alert("修改帳單為結帳前狀態成功");						}					})				});			});		</script>	</body></html>
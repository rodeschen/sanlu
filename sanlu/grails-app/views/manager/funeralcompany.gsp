<html>
<head>
<title>禮儀公司管理</title>
<meta name="layout" content="inner" />
</head>
<body>
	<script>
            $(document).ready(function(){
            	var contactAddrCity=$('#contactAddrCity');
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/funeralCompany/queryAll",
                    pager: true,
                    caption: "禮儀公司清單",
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
                        header: "禮儀公司",
                        name: 'funeralCompanyName',
                        index: 'funeralCompanyName',
                        width: 60
                    }, {
                        header: "電話1",
                        name: 'phone1',
                        index: 'phone1',
                        width: 60
                    }, {
                        header: "電話2",
                        name: 'phone2',
                        index: 'phone2',
                        width: 60
                    }, {
                        header: "縣/市",
                        name: 'contactAddrCity',
                        index: 'contactAddrCity',
                        width: 30
                    }, {
                        header: "鄉鎮市區",
                        name: 'contactAddrArea',
                        index: 'contactAddrArea',
                        width: 30
                    }, {
                        header: "地址",
                        name: 'contactAddr',
                        index: 'contactAddr',
                        width: 100
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 80,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 80
                    }],
                    onSelectRow: function(id){
                        var company = grid1.getRowData(id);
                        grid2.jqGrid('setGridParam', {
                            postData: {
                                'funeralCompanyId': company.id
                            },
                            datatype: "json"
                        }).trigger("reloadGrid");
                    }
                });
                
                var grid2 = $("#grid2").jqGrid({
                    url: contextRoot + "/funeraler/queryByComp",
                    datatype: "local",
                    pager: true,
                    caption: "禮儀師清單",
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
                        name: 'funeralCommpany.id',
                        index: 'funeralCommpany.id',
                        hidden: true
                    }, {
                        header: "禮儀師姓名",
                        name: 'funeralerName',
                        index: 'funeralerName',
                        width: 90
                    
                    }, {
                        header: "電話1",
                        name: 'phone1',
                        index: 'phone1',
                        width: 100
                    }, {
                        header: "電話2",
                        name: 'phone2',
                        index: 'phone2',
                        width: 100
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 120,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 80
                    }]
                });
                
                var action = "";
                $("#add1,#modify1,#add2,#modify2").each(function(){		
	                   		
                    $(this).fancybox({
                        action: $(this).prop("id"),
                        onStart: function(){
                            var selrow;
                            action = this.action;
                            var isNormal = action.indexOf('1') > -1;
                            var grid = (isNormal ? grid1 : grid2);
                            var selrow2 = grid1.jqGrid('getGridParam', 'selrow');
                            if(!isNormal && !selrow2){
        	                	alert("請先選擇禮儀公司");
                                return false;
        		            } 
        		            if(!isNormal){
                            	var grid1Data = grid1.getRowData(selrow2);
                            	$("#funeralCompanyName").val(grid1Data.funeralCompanyName);
                            	$("#funeralCompanyId").val(grid1Data.id);
                        	}
                            $("#addrDiv")[isNormal ? 'show' : 'hide']();
                            $("#funeralerNameDiv")[!isNormal ? 'show' : 'hide']();
                            //$("#funeralCompanyName")['readOnly'](!isNormal);
                            if (action.indexOf("modify") > -1) {
                                selrow = grid.jqGrid('getGridParam', 'selrow');
                                if (!selrow) {
                                    alert("請先選擇修改列");
                                    return false;
                                }
                                var id = grid.getRowData(selrow);
                                $("#id").val(id.id);
                                $("#phone1").val(id.phone1);
                                $("#phone2").val(id.phone2);
                                if (isNormal) {
                                	contactAddrCity.val(id.contactAddrCity);
                                    $("#contactAddrArea").val(id.contactAddrArea);
                                    $("#contactAddr").val(id.contactAddr);
                                    $("#funeralCompanyName").val(id.funeralCompanyName);
                                }
                                else {
                                	$("#funeralerName").val(id.funeralerName);                                     
                                }
                                
                            }
                        },
                        'titlePosition': 'inside',
                        'transitionIn': 'elastic',
                        'transitionOut': 'elastic',
                        onClosed: function(){
                            addForm.reset();
                        }
                    });
                });
                $("#padd1").click(function(){
                    if ($('#addForm').validationEngine('validate')) {
                        var isNormal = action.indexOf('1') > -1;
                        var grid = isNormal ? grid1 : grid2;                        
                        $.ajax({
                            url: contextRoot + "/" + (isNormal ? "funeralCompany" : "funeraler") + "/" + (action == "add1" || action == "add2" ? "insert" : "modify"),
                            data: $("#addForm").serializeData(),
                            success: function(msg){
                                $.fancybox.close();
                                grid.trigger("reloadGrid");
                                
                                alert("禮儀公司/師" + (action == "add1" || action == "add2" ? "新增" : "修改") + "成功");
                            }
                        })
                    }
                });
                $("#pclose1").click(function(){
                    $.fancybox.close();
                });
                
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    if (!confirm("刪除公司將會連該公司員工一併刪除，確認刪除?")) {
                        return;
                    }
                    
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeralCompany/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    })
                });
                
                $("#delete2").click(function(){
                    var selrow = grid2.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    if (!confirm("確定要刪除?")) {
                        return;
                    }
                    var id = grid2.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeraler/delete",
                        data: id,
                        success: function(msg){
                            grid2.trigger("reloadGrid");
                            alert("刪除成功 ");
                        }
                    })
                });
                //下拉選單
                var addrMap={};
                $.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/city",
                    success: function(map){
                    	addrMap = map;
                    	var cityMap= {};
						$.each(map, function(value, text) {
							cityMap[value]=value;
						});
                    	contactAddrCity.setDropdown(cityMap);
                    }
                });
                
                contactAddrCity.change( function(event, value) {
					if ($(this).val()) {
						var val = $(this).val();
						var areaMap = {};
						$.each(addrMap[val], function(index,value) {
							areaMap[value]=value;
						});
						$('#contactAddrArea').setDropdown(areaMap).val(value);
					} else {
						$('#contactAddrArea').html('')
					}
				});
            });
        </script>
	<fieldset>
		<legend> 禮儀公司 </legend>
		<div>
			<a id="add1" href="#pdialog" class="button">新增</a> <a id="modify1"
				href="#pdialog" class="button">修改</a>
			<button id="delete1">刪除</button>
		</div>
		<div id="grid1" />
	</fieldset>
	<fieldset>
		<legend> 禮儀師 </legend>
		<div>
			<a id="add2" href="#pdialog" class="button">新增</a> <a id="modify2"
				href="#pdialog" class="button">修改</a>
			<button id="delete2">刪除</button>
		</div>
		<div id="grid2" />
	</fieldset>
	<div class="hide">
		<div id="pdialog" class="dialog" style="display: block; width: 400px;">
			<g:form name="addForm" id="addForm" onsubmit="return false;"
				autocomplete="off" novalidate="novalidate">
				<div class="dialog-body">
					<div class="field-row" id='funeralCompanyNameDiv'>
						<span class="th1">公司名稱：</span> <span><input type="text"
							id="funeralCompanyName" name="funeralCompanyName"
							placeholder="公司名稱" class="validate[required]" /> </span>
					</div>
					<div class="field-row" id='funeralerNameDiv'>
						<span class="th1">禮儀師名：</span> <span><input type="text"
							id="funeralerName" name="funeralerName" placeholder="禮儀師名"
							class="validate[required]" /> </span>
					</div>
					<div class="field-row" id="priceDiv">
						<span class="th1">電話1：</span> <span><input type="text"
							id="phone1" name="phone1" placeholder="電話1"
							class="validate[required]" /> </span>
					</div>
					<div class="field-row" id="sallingPriceDiv">
						<span class="th1">電話2：</span> <span><input type="text"
							id="phone2" name="phone2" placeholder="電話2" /> </span>
					</div>
					<div class="field-row" id="addrDiv">
						<span class="th1">地址：</span> <span> <select
							id="contactAddrCity" name="contactAddrCity">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select> <!--縣/市--> <select id="contactAddrArea" name="contactAddrArea">
								<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
						</select> <!--鄉鎮市區--> </span> <br /> <span class="th1">&nbsp;</span> <span><input
							type="text" id="contactAddr" name="contactAddr" placeholder=""
							size="40" /> </span>
					</div>
					<input type="hidden" id="id" name="id" /><input type="hidden"
						id="funeralCompanyId" name="funeralCompanyId" />
					<div style="text-align: center;">
						<button id="padd1" type="button">確定</button>
						<button id="pclose1" type="button">取消</button>
					</div>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>

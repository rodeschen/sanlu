<html>
<head>
<title>首頁</title>
<meta name="layout" content="inner" />
</head>
<body>
	${flash.message}
	<g:if test="${!session.empLevel}">
	<script type="text/javascript">
		$("nav,aside").remove();
	</script>
		<div>
			<g:form name="loginForm" url="[action:'login',controller:'login']"
				autocomplete="off" novalidate="novalidate">
				<fieldset style="width: 330px; margin: 80px auto 0;">
					<!--  <legend>
                        登入
                        </legend>-->
					<div class="field-row">
						<span class="th1">帳號：</span> <span><input type="text"
							id="id" name="id" placeholder="帳號" class="validate[required]" />
						</span>
					</div>
					<div class="field-row">
						<span class="th1">密碼：</span> <span><input type="password"
							id="pw" name="pw" placeholder="密碼" class="validate[required]" />
						</span>
					</div>
					<!--
                        <div class="field-row">
                        <span class="th1">分館：</span>
                        <span>
                        <select id="projectName" name="projectName">
                        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        </span>
                        </div>
                        -->
					<div style="padding-left: 50%">
						<button id="confirm" type="submit">登入</button>
					</div>
				</fieldset>
			</g:form>
		</div>
	</g:if>
	<g:else>
		<fieldset>
			<legend> 進行中專案 </legend>
			<div>
				<a id="add" href="#pdialog" class="button">新增</a>
				<button id="modify">修改</button>
				<button id="delete">刪除</button>
			</div>
			<div id="grid1" />
		</fieldset>
		<fieldset>
			<legend> 場地清單 </legend>
			<div id="grid2" />
		</fieldset>
		<!-- dialog -->
		<div class="hide">
			<div id="pdialog" class="dialog"
				style="display: block; width: 400px;">
				<g:form name="addForm" id="addForm" onsubmit="return false;"
					autocomplete="off" novalidate="novalidate">
					<div class="dialog-body">
						<div class="field-row">
							<span class="th1">案名：</span> <span><input type="text"
								id="projectName" name="projectName" placeholder="姓名"
								class="validate[required]" />
							</span>
						</div>
						<div class="field-row">
							<span class="th1">禮儀公司：</span> <span> <select
								id="funeralCompany" name="funeralCompany"
								class="validate[required]">
									<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
						</div>
						<div class="field-row">
							<span class="th1">禮儀師：</span> <span> <select
								id="funeraler" name="funeraler" class="validate[required]">
									<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
						</div>
						<div class="field-row">
							<span class="th1">承辦業務：</span> <span> <select
								id="employee" name="employee" class="validate[required]">
									<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
							</select> </span>
						</div>
						<div class="field-row">
							<span class="th1">入館日期：</span> <span><input type="text"
								class="validate[required] date" id="inDate" name="inDate"
								size="10" />
							</span>
						</div>
						<div style="text-align: center;">
							<button id="padd" type="button">確定</button>
							<button id="pclose" type="button">取消</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
		<script type="text/javascript">
                $(document).ready(function(){
                    var grid1 = $("#grid1").jqGrid({
                        url: contextRoot + "/project/queryNonClose",
                        datatype: "json",
        				mtype: 'POST',
						caption: "當日出館或未出館專案",
                        //multiboxonly:true,
                        pager: true,
                        // multiselect: true,
                        colModel: [{
                            name: 'id',
                            index: 'id',
                            hidden: true
                        }, {
                            header: "案名",
                            name: 'projectName',
                            index: 'projectName',
                            width: 60
                        }, {
                            header: "禮儀公司",
                            name: 'funeralCompany.funeralCompanyName',
                            index: 'funeralCompany.funeralCompanyName',
                            width: 80
                        
                        }, {
                            header: "禮儀師",
                            name: 'funeraler.funeralerName',
                            index: 'funeraler.funeralerName',
                            width: 80
                        
                        }, {
                            header: "進館日期",
                            name: 'inDate',
                            index: 'inDate',
                            align: "center",
                            width: 130
                        }, {
                            header: "出館日期",
                            name: 'outDate',
                            index: 'outDate',
                            align: "center",
                            width: 130
                        }, {
                            header: "承辦業務",
                            name: 'emp.empName',
                            index: 'emp.empName',
                            width: 80
                        }, {
                            header: "消費總金額",
                            name: 'sallingTotal',
                            index: 'sallingTotal',
                            width: 80,
                            align: "right",
                            formatter: "currency"
                        }, {
                            header: "內帳銷售總金額",
                            name: 'total',
                            index: 'total',
                            width: 80,
                            align: "right",
                            formatter: "currency"
                        }, {
                            header: "備註",
                            name: 'memo',
                            index: 'memo',
                            width: 150,
                            sortable: false
                        }],
                        ondblClickRow: function(id){
                            var data = grid1.getRowData(id);
                            API.openProject({
                                id: data.id,
                                data: data
                            });
                        }
                    });
                    
                    var grid2 = $("#grid2").jqGrid({
                        url: contextRoot + "/product/queryPlace",
                        caption: "場地",
                        pager: true,
                        colModel: [{
                            name: 'id',
                            index: 'id',
                            width: 60,
                            hidden:true
                        }, {
                            header: "場地名",
                            name: 'placeName',
                            index: 'placeName',
                            width: 90
                        }],
                        ondblClickRow: function(id){
                            var data = grid2.getRowData(id);
                            API.openCalendar({
                                id: data.id,
                                type:"l"
                            });
                        }
                    });
                    
                    $("#delete").click(function(){
                        var selrow = grid1.jqGrid('getGridParam', 'selrow');
                        if (!selrow) {
                            alert("請先選擇刪除列");
                            return;
                        }
                        if (!confirm("確定要刪除?")) {
                            return;
                        }
                        var data = grid1.getRowData(selrow);
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/project/delete",
                            data: data,
                            success: function(msg){
                                grid1.trigger("reloadGrid");
                                alert("刪除成功");
                            }
                        })
                    });
                    
                    
                    $("#modify").click(function(){
                        var selrow = grid1.jqGrid('getGridParam', 'selrow');
                        if (!selrow) {
                            alert("請先選擇修改列");
                            return;
                        }
                        var data = grid1.getRowData(selrow);
                        API.openProject({
                            id: data.id,
                            data: data
                        });
                    });
                    
                    $("#add").fancybox({
                        'titlePosition': 'inside',
                        'transitionIn': 'elastic',
                        'transitionOut': 'elastic',
                        onClosed: function(){
                            addForm.reset();
                        }
                    });
                    
                    $("#padd").click(function(){
                        if ($("#addForm").validationEngine('validate')) {
                            var id = "";
                            $.ajax({
                                async: false,
                                url: contextRoot + "/project/addAction",
                                data: $("#addForm").serializeData()
                            }).done(function(res){
                                id = res.id;
                            });
                            if (id) {
                                API.openProject({
                                    id: id
                                });
                                $.fancybox.close();
                            }
                        }
                    });
                    
                    $("#pclose").click(function(){
                        $.fancybox.close();
                    });
                    //下拉選單
                    //禮儀公司
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/combobox/funeralCompany",
                        success: function(map){
                            $('#funeralCompany').setDropdown(map);
                        }
                    });
                    
                    $('#funeralCompany').change(function(){
                    	if($(this).val()){                         
                            $.ajax({
                                type: "POST",
                                url: contextRoot + "/combobox/funeraler",
                                data: {
                                    id: $(this).val()
                                },
                                success: function(map){
                                    $('#funeraler').setDropdown(map);
                                }
                            })
                            }else{
                            	$('#funeraler').html('')
                                }
                    });
                    
                    //所有員工
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/combobox/employee",
                        success: function(map){
                            $('#employee').setDropdown(map);
                        }
                    });
                    
                });
            </script>
	</g:else>
</body>
</html>

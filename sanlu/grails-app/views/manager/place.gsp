<html>
<head>
<title>場地管理</title>
<meta name="layout" content="inner" />
</head>
<body>
		<fieldset>
			<legend>場地管理 </legend>
			<div>
				<a id="add2" href="#pdialog2" class="button">新增</a> <a id="modify2"
					href="#pdialog2" class="button">修改</a>
				<button id="delete2">刪除</button>
			</div>
			<div id="palceGrid" />
		</fieldset>
		<!-- dialog -->
		<div class="hide">			
			<div id="pdialog2" class="dialog2"
				style="display: block; width: 400px;">
				<g:form name="addForm2" id="addForm2" onsubmit="return false;"
					autocomplete="off" novalidate="novalidate">
					<div class="dialog-body">
						<div class="field-row">
							<span class="th1" id="sSpan">場地名稱：</span> <span><input
								type="text" id="placeName" name="placeName" placeholder="場地名稱"
								class="validate[required]" />
							</span><input type="hidden" id="id" name="id" />
						</div>
						<div style="text-align: center;">
							<button id="padd2" type="button">確定</button>
							<button id="pclose2" type="button">取消</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
		<script type="text/javascript">
                $(document).ready(function(){
                    window.name = "main";                    
                    
                    var grid2 = $("#palceGrid").jqGrid({
                        url: contextRoot + "/place/queryPlace",
                        height : 300,
                        rowNum : 15,
                        caption: "場地",
                        pager: true,
                        colModel: [{
                            name: 'id',
                            index: 'id',
                            width: 60,
                            hidden: true
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
                                type: "l",
                                data:{
                                	calendarName : data.placeName
                                }
                             
                            });
                        }
                    });                    
                    
                    $("#pclose2").click(function(){
                        $.fancybox.close();
                    });
                    
                    $("#delete2").click(function(){
                        var selrow = grid2.jqGrid('getGridParam', 'selrow');
                        if (!selrow) {
                            alert("請先選擇刪除列");
                            return;
                        }
                        if (!confirm("確定要刪除?")) {
                            return;
                        }
                        var data = grid2.getRowData(selrow);
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/place/delete",
                            data: data,
                            success: function(msg){
                                grid2.trigger("reloadGrid");
                                alert("刪除成功");
                            }
                        })
                    });                    
                    var action;
                    $("#add2,#modify2").each(function(){
                        $(this).fancybox({
                            action: $(this).prop("id"),
                            onStart: function(){
                                action = this.action;
                                if (action == "modify2") {
                                    var selrow = grid2.jqGrid('getGridParam', 'selrow');
                                    if (!selrow) {
                                        alert("請先選擇修改列");
                                        return false;
                                    }
                                    var id = grid2.getRowData(selrow);
                                    $("#id").val(id.id);
                                    $("#placeName").val(id.placeName);
                                }
                            },
                            'titlePosition': 'inside',
                            'transitionIn': 'elastic',
                            'transitionOut': 'elastic',
                            onClosed: function(){
                                addForm2.reset();
                            }
                        });
                    });
                    
                    $("#padd2").click(function(){
                    
                        if ($("#addForm2").validationEngine('validate')) {
                            var id = "";
                            $.ajax({
                                async: false,
								url: contextRoot + "/place/" + (action == "add2" ? "insert" : "modify"),
                                data: $("#addForm2").serializeData(),
                                success: function(msg){
                                $.fancybox.close();
                                grid2.trigger("reloadGrid");
                                alert("場地" + (action == "add1" ? "新增" : "修改") + "成功");
                            }
                            });
							
                        }
                    });
                    
                });
            </script>
        
    </body>
</html>

<html>
    <head>
        <title>首頁</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        ${flash.message} 
        <g:if test="${!session.empLevel}">
            <div>
                <g:form name="loginForm" url="[action:'login',controller:'login']" autocomplete="off" novalidate="novalidate">
                    <fieldset style="width:330px;margin:80px auto 0;">
                        <!--  <legend>
                        登入
                        </legend>-->
                        <div class="field-row">
                            <span class="th1">帳號：</span>
                            <span><input type="text" id="id" name="id" placeholder="帳號" class="validate[required]"/></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">密碼：</span>
                            <span><input type="password" id="pw" name="pw" placeholder="密碼" class="validate[required]"/></span>
                        </div><!--
                        <div class="field-row">
                        <span class="th1">分館：</span>
                        <span>
                        <select id="projectName" name="projectName">
                        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        </select>
                        </span>
                        </div>
                        -->
                        <div style="padding-left:50%">
                            <button id="confirm" type="submit">
                                登入
                            </button>
                        </div>
                    </fieldset>
                </g:form>
            </div>
        </g:if>
        <g:else>
            <fieldset>
                <legend>
                    進行中專案
                </legend>
                <div>
                    <a id="add" href="#pdialog" class="button">新增</a>
                    <button id="modify">
                        修改
                    </button>
                    <button id="delete">
                        刪除
                    </button>
                </div>
                <div id="grid1"/>
            </fieldset>
            <fieldset>
                <legend>
                    場地清單
                </legend>
                <div id="grid2"/>
            </fieldset><!-- dialog -->
            <div class="hide">
                <div id="pdialog" class="dialog" style="display:block;width:400px;">
                    <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                        <div class="dialog-body">
                            <div class="field-row">
                                <span class="th1">案名：</span>
                                <span><input type="text" id="projectName" name="projectName" placeholder="姓名" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">禮儀公司：</span>
                                <span>
                                    <select id="funeralCompany" name="funeralCompany" class="validate[required]">
                                        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    </select>
                                </span>
                            </div>
                            <div class="field-row">
                                <span class="th1">禮儀師：</span>
                                <span>
                                    <select id="funeraler" name="funeraler" class="validate[required]">
                                        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    </select>
                                </span>
                            </div>
                            <div style="text-align:center;">
                                <button id="padd" type="button">
                                    確定
                                </button>
                                <button id="pclose" type="button">
                                    取消
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
            <script type="text/javascript">
                $(document).ready(function(){
                    var grid1 = $("#grid1").jqGrid({
                        url: contextRoot + "/project/query",
                        datatype: "json",
                        height: "auto",
                        //multiboxonly:true,
                        autowidth: true,
                        pager: true,
                        multiselect: true,
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
                            header: "禮儀公司/禮儀師",
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
                            
                        }
                    });
                    
                    var grid2 = $("#grid2").jqGrid({
                        datatype: "local",
                        height: "auto",
                        autowidth: true,
                        //caption: "場地列表",
                        pager: true,
                        colModel: [{
                            name: 'id',
                            index: 'id',
                            width: 60
                        }, {
                            name: 'invdate',
                            index: 'invdate',
                            width: 90
                        }, {
                            name: 'name',
                            index: 'name',
                            width: 500
                        }, {
                            name: 'amount',
                            index: 'amount',
                            width: 80,
                            align: "right"
                        }, {
                            name: 'tax',
                            index: 'tax',
                            width: 80,
                            align: "right"
                        }, {
                            name: 'total',
                            index: 'total',
                            width: 80,
                            align: "right"
                        }, {
                            name: 'note',
                            index: 'note',
                            width: 150,
                            sortable: false
                        }]
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
                        	$("#addForm").reset();
                        }
                    });
                    
                    $("#padd").click(function(){
                        if ($("#addForm").validationEngine('validate')) {
                            $.ajax({
                                url: contextRoot + "/project/addAction",
                                data: $(addForm).serializeData(),
                                success: function(res){
                                    API.openProject({
                                        id: res.id
                                    });
                                }
                            });
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
                        //禮儀師
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/combobox/funeraler",
                            data: {
                                funeralCompany: $(this).val()
                            },
                            success: function(map){
                                $('#funeraler').setDropdown(map);
                            }
                        })
                    });
                    
                    
                    
                });
            </script>
        </g:else>
    </body>
</html>

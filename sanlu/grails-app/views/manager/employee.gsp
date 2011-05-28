<html>
    <head>
        <title>員工管理</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <fieldset>
            <legend>
                員工管理 
            </legend>
            <div>
                <a id="add1" href="#pdialog" class="button">新增</a>
                <button id="modify1">
                    修改
                </button>
                <button id="delete1">
                    刪除
                </button>
                <a id="pwReset" href="#pwResetdialog" class="button">密碼重設</a>
            </div>
            <div id="grid1" />
            <div class="hide">
                <div id="pwResetdialog" class="dialog" style="display:block;width:400px;">
                    <g:form name="pwResetForm" id="pwResetForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                        <div class="dialog-body">
                            <div class="field-row">
                                <span class="th1">員工姓名：</span>
                                <span><label id="empName2" name="empName2"/><input id="id2" name="id2" type="text" class="hide" /></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">密碼：</span>
                                <span><input type="password" id="pw" name="pw" placeholder="密碼" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">確認密碼：</span>
                                <span><input type="password" id="pw1" name="pw1" placeholder="確認密碼" class="validate[required,equals[pw]]"/></span>
                            </div>
                            <div style="text-align:center;">
                                <button id="padd2" type="button">
                                    確定
                                </button>
                                <button id="pclose2" type="button">
                                    取消
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
            <!-- dialog -->
            <div class="hide">
                <div id="pdialog" class="dialog" style="display:block;width:400px;">
                    <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                        <div class="dialog-body">
                            <div class="field-row">
                                <span class="th1">員工姓名：</span>
                                <span><input type="text" id="empName" name="empName" placeholder="姓名" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">姓別：</span>
                                <span><input type="text" id="gender" name="gender" placeholder="姓別" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">雇用日期：</span>
                                <span><input type="text" id="hireDate" name="hireDate" placeholder="雇用日期" class="validate[required] date"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">已離職：</span>
                                <span>
                                    <select id="isLeft" name="isLeft" class="validate[required]">
                                        <option value="0">否</option>
                                        <option value="1">是</option>
                                    </select>
                                </span>
                            </div>
                            <div class="field-row">
                                <span class="th1">員工級別：</span>
                                <span>
                                    <select id="empLevel" name="empLevel" class="validate[required]">
                                        <option value="1">1:最大</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </span>
                            </div>
                            <div style="text-align:center;">
                                <button id="padd1" type="button">
                                    確定
                                </button>
                                <button id="pclose1" type="button">
                                    取消
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </fieldset>
        <script>
            $(document).ready(function(){
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/employee/query",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
                        header: "員工代號",
                        name: 'empNo',
                        index: 'empNo',
                        width: 15
                    }, {
                        header: "員工姓名",
                        name: 'empName',
                        index: 'empName',
                        width: 20
                    }, {
                        header: "姓別",
                        name: 'gender',
                        index: 'gender',
                        width: 20
                    }, {
                        header: "雇用日期",
                        name: 'hireDate',
                        index: 'hireDate',
                        width: 20,
                        sorttype: "date"
                    }, {
                        header: "已離職",
                        name: 'isLeft',
                        index: 'isLeft',
                        width: 10,
                        formatter: function(el, cellval, opts){
                            return el ? "是" : "否";
                        }
                    }, {
                        header: "員工級別",
                        name: 'empLevel',
                        index: 'empLevel',
                        width: 20
                    }],
                    sortname: 'empNo',
                    postData: {
                        hasPlace: false
                    },
                    caption: "Manipulating Array Data"
                });
                
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/employee/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    })
                });
                $("#modify1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇修改列");
                    }
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/employee/modify",
                        data: {
                            columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
                            data: JSON.stringify(id)
                        },
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("修改成功");
                        }
                    })
                });
                $("#pwReset").fancybox({
                    'titlePosition': 'inside',
                    'transitionIn': 'elastic',
                    'transitionOut': 'elastic',
                    onStart: function(){
                        var selrow = grid1.jqGrid('getGridParam', 'selrow');
                        if (!selrow) {
                            alert("請先選擇密碼重設員工列");
                            return false;
                        }
                        var row = grid1.getRowData(selrow);
                        $("#empName2").html(row.empName);
                        $("#id2").val(row.id);
                    }
                });
                
                $("#padd2").click(function(){
                    if ($("#pwResetForm").validationEngine('validate')) {
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/employee/pwreset",
                            data: {
                                'id': $('#id2').val(),
                                'pw': $('#pw').val()
                            },
                            success: function(msg){
                                $.fancybox.close();
                                alert("密碼重設成功");
                            }
                        })
                    }
                });
                $("#pclose2").click(function(){
                    $.fancybox.close();
                });
                
                $("#add1").fancybox({
                    'titlePosition': 'inside',
                    'transitionIn': 'elastic',
                    'transitionOut': 'elastic'
                });
                
                $("#padd1").click(function(){
                    if ($("#addForm").validationEngine('validate')) {
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/employee/insert",
                            data: id,
                            success: function(msg){
                                alert("員工新增成功");
                            }
                        })
                    }
                });
                $("#pclose2").click(function(){
                    $.fancybox.close();
                });
            });
        </script>
    </body>
</html>

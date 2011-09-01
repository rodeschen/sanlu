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
                <g:form name="loginForm" url="[action:'login',controller:'login']" autocomplete="off" novalidate="novalidate">
                    <fieldset style="width: 330px; margin: 80px auto 0;">
                        <!--  <legend>
                        登入
                        </legend>-->
                        <div class="field-row">
                            <span class="th1">帳號：</span>
                            <span><input type="text" id="id" name="id" placeholder="帳號" class="validate[required]" /></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">密碼：</span>
                            <span><input type="password" id="pw" name="pw" placeholder="密碼" class="validate[required]" /></span>
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
                        <div style="padding-left: 50%">
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
                    專案清單 
                </legend>
                <div>
                    <a id="add" href="#pdialog" class="button">新增</a>
                    <button id="modify">
                        修改
                    </button>
                    <button id="delete">
                        刪除
                    </button>
                    <span style="float: right;"><input type="radio" id="closing" name="closing" value="N" checked="checked" />未結案 <input type="radio" id="closing" name="closing" value="Y" />結案</span>
                </div><div id="projectGrid" />
            </fieldset>
            <fieldset>
                <legend>
                    場地清單 
                </legend>
                <div>
                    <button id="view">
                        檢視
                    </button>
                </div>
                <div id="palceGrid" />
            </fieldset><!-- dialog -->
            <div class="hide">
                <div id="pdialog" class="dialog" style="display: block; width: 400px;">
                    <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                        <div class="dialog-body">
                            <div class="field-row">
                                <span class="th1">案名：</span>
                                <span><input type="text" id="projectName" name="projectName" placeholder="姓名" class="validate[required]" /></span>
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
                            <div class="field-row">
                                <span class="th1">承辦業務：</span>
                                <span>
                                    <select id="employee" name="employee" class="validate[required]">
                                        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                    </select>
                                </span>
                            </div>
                            <div class="field-row">
                                <span class="th1">入館日期：</span>
                                <span><input type="text" class="validate[required] date" id="inDate" name="inDate" size="10" /></span>
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
                            <div style="text-align: center;">
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
                <div id="pdialog2" class="dialog2" style="display: block; width: 400px;">
                    <g:form name="addForm2" id="addForm2" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                        <div class="dialog-body">
                            <div class="field-row">
                                <span class="th1" id="sSpan">場地名稱：</span>
                                <span><input type="text" id="placeName" name="placeName" placeholder="場地名稱" class="validate[required]" /></span><input type="hidden" id="id" name="id" />
                            </div>
                            <div style="text-align: center;">
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
            <script type="text/javascript">
                $(document).ready(function(){
                    window.name = "main";
                    var grid1 = $("#projectGrid").jqGrid({
                        url: contextRoot + "/project/queryProjects",
                        datatype: "json",
                        mtype: 'POST',
                        caption: "當日出館或未出館專案",
                        postData: {
                            closing: "N"
                        },
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
                    
                    var grid2 = $("#palceGrid").jqGrid({
                        url: contextRoot + "/place/queryPlace",
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
                                data: {
                                    calendarName: data.placeName
                                }
                            
                            });
                        }
                    });
                    
                    $("#view").click(function(){
                        var selrow = grid2.jqGrid('getGridParam', 'selrow');
                        if (!selrow) {
                            alert("請先選擇檢視列");
                            return;
                        }
                        var data = grid2.getRowData(selrow);
                        API.openCalendar({
                            id: data.id,
                            type: "l",
                            data: {
                                calendarName: data.placeName
                            }
                        
                        });
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
                                grid1.trigger("reloadGrid");
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
                        if ($(this).val()) {
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
                        }
                        else {
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
                    $(":input[name=closing]").click(function(){
                        grid1.jqGrid('setGridParam', {
                            postData: {
                                closing: $(this).val()
                            }
                        });
						grid1.trigger("reloadGrid");
                        
                    })
                });
            </script>
        </g:else>
    </body>
</html>

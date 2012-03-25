<html>
    <head>
        <title>日曆</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
                var contactAddrCity = $('#contactAddrCity');
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/calendar/queryGridCal",
                    pager: true,
                    postData: {
                        type: 1
                    },
                    autowidth: true,
                    pager: true,
                    grouping: true,
                    height: 330,
                    groupingView: {
                        groupField: ['date'],
                        groupColumnShow: [false],
                        groupCollapse: false
                    },
                    caption: "工作記錄事項總覽",
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
                        header: "事項",
                        name: 'description',
                        width: 150,
                        align: 'left'
                    }, {
                        name: 'date',
                        width: 150,
                        align: 'center',
                        hidden: true
                    }, {
                        header: "開始時間",
                        name: 'startTime',
                        width: 60,
                        align: 'center'
                    }, {
                        header: "結束時間",
                        name: 'endTime',
                        width: 60,
                        align: 'center',
                    }, {
                        header: "建立者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 40,
                        align: 'center'
                    }, {
                        header: "建立時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 60,
                        sorttype: "date",
                        align: 'center'
                    }],
                    sortname: 'startTime',
                    sortorder: "desc"
                });
                
                
                $("#calendar").click(function(){
                
                    API.openCommCalendar({
                        type: "1"
                    })
                    
                });
                
                $("#add").fancybox({
                    'titlePosition': 'inside',
                    'transitionIn': 'elastic',
                    'transitionOut': 'fade',
                    'onStart': function(){
                    },
                    'onClosed': function(){
                        $("#pdialog").find("form").each(function(){
                            this.reset();
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
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        url: contextRoot + "/calendar/delCal",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    });
                });
                
                $("#padd").click(function(){
                    var form = $("#addForm");
                    if (form.validationEngine('validate')) {
                        $.ajax({
                            url: contextRoot + "/calendar/addCal",
                            data: $.extend({}, form.serializeData())
                        }).done(function(json){
                            $.fancybox.close();
                            grid1.trigger("reloadGrid");
                        });
                    }
                });
                $("#pclose").click(function(){
                    $.fancybox.close();
                });
                
            });
        </script>
        <fieldset>
            <legend>
                日曆 
            </legend>
            <div>
                <a id="add" href="#pdialog" class="button">新增</a>
                <button id="delete">
                    刪除
                </button>
                <button id="calendar" style="float: right;">
                    開啟行事曆
                </button>
            </div>
            <div id="grid1" />
        </fieldset>
        <div class="hide">
            <div id="pdialog" class="dialog" style="display: block; width: 470px;">
                <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                    <div class="dialog-body">
                        <div class="field-row">
                            <span class="th2">內容：</span>
                            <span><input type="text" id="description" name="description" placeholder="內容" size="50" class="validate[required]" /></span>
                        </div>
                        <div class="field-row startTime">
                            <span class="th2">開始時間：</span>
                            <span><input type="text" class="validate[required] date" id="startDate" name="startDate" size="12" /></span><span><span class="timeSelect">
                                    <select id="startHour" name="startHour" class="timeSelect">
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
                                    <select id="startMin" name="startMin" class="timeSelect">
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
                                </span></span>
                        </div>
                        <div class="field-row endTime">
                            <span class="th2">結束時間：</span>
                            <span><input type="text" class="validate[required] date" id="endDate" name="endDate" size="12" /></span><span><span class="timeSelect">
                                    <select id="endHour" name="endHour">
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
                                    <select id="endMin" name="endMin">
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
                                </span></span>
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
        </div>
    </body>
</html>

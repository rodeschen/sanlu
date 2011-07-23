<html>
    <head>
        <title>專案</title>
        <meta name="layout" content="project" />
    </head>
    <body>
        <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
            <input type="text" id="id" name="id" class="hide" />
            <fieldset>
                <legend>
                    專案&家屬資訊
                </legend>
                <span style="display: inline-block; width: 460px">
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
                    <div class="field-row">
                        <span>
                            <button id="update">
                                儲存修改專案資訊
                            </button>
                        </span>
                    </div>
                </span>
                <span style="padding-left: 10px; display: inline-block; width: 420px">
                    <div class="field-row">
                        <span class="th1">聯絡人：</span>
                        <span><input type="text" id="contact" name="contact" placeholder="" /></span>
                    </div>
                    <div class="field-row">
                        <span class="th1">電話：</span>
                        <span><input type="text" id="contactPhone" name="contactPhone" placeholder="" /></span>
                    </div>
                    <div class="field-row">
                        <span class="th1">地址：</span>
                        <span>
                            <select id="contactAddrCity" name="contactAddrCity">
                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            </select>
                            <!--縣/市-->
                            <select id="contactAddrArea" name="contactAddrArea">
                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                            </select>
                            <!--鄉鎮市區-->
                        </span>
                        <br/>
                        <span class="th1">&nbsp;</span>
                        <span><input type="text" id="contactAddr" name="contactAddr" placeholder="" size="40" /></span>
                    </div>
                    <div class="field-row">
                        <span class="th1" style="vertical-align: top">備註：</span>
                        <span>
                            <textarea id="memo" name="memo" cols="30" rows="4">
                            </textarea>
                        </span>
                    </div>
                </span>
            </fieldset>
        </g:form>
        <div>
            <a id="add" href="#pdialog" class="button">新增</a>
            <!--
            <button id="modify1">
            修改
            </button>-->
            <button id="delete1">
                刪除
            </button>
            <button id="calendar" style="float: right;">
                專案行事曆
            </button>
        </div>
        <div style="padding-bottom: 10px" id="grid1">
        </div>
        <!-- dialog -->
        <div class="hide">
            <div id="pdialog" class="dialog" style="display: block; width: 400px;">
                <g:form name="addProductForm" id="addProductForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                    <div class="dialog-body">
                        <fieldset style="margin:10 10px">
                            <legend>
                                新增使用商品
                            </legend>
                            <div class="field-row">
                                <span class="th1" style="color:black">啇品類別：</span>
                                <span><input type="radio" id="type" name="type" value="1" checked="checked" />一般 <input type="radio" id="type" name="type" value="2"/>代叫 <input type="radio" id="type" name="type" value="3"/>場地 <!--
                                    <input type="radio" id="type" name="type" value="3"/>
                                    專案--></span>
                            </div>
                            <div id="productArea" style="">
                                <div id="type1" class="productArea" style="">
                                    <div class="field-row">
                                        <span class="th1">產品名稱：</span>
                                        <span>
                                            <select id="product1" name="product1" class="validate[required]">
                                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">數量：</span>
                                        <span><input id="amount1" name="amount1" class="validate[required]" /></span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">時間：</span>
                                        <span><input type="text" class="validate[required] date" id="date1" name="date1" size="10" /></span><span>
                                            <select id="hour1" name="hour1">
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
                                            <select id="min1" name="min1">
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
                                </div>
                                <div id="type2" class="productArea" style="display:none;">
                                    <div class="field-row">
                                        <span class="th1">產品名稱：</span>
                                        <span>
                                            <select id="product2" name="product2" class="validate[required]">
                                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">數量：</span>
                                        <span><input id="amount2" name="amount2" class="validate[required]" /></span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">廠商名稱：</span>
                                        <span><input id="vendor2" name="vendor2" class="validate[required]" /></span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">時間：</span>
                                        <span><input type="text" class="validate[required] date" id="date2" name="date2" size="10" /></span><span>
                                            <select id="hour2" name="hour2">
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
                                            <select id="min2" name="min2">
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
                                </div>
                                <div id="type3" class="productArea" style="display:none";>
                                    <div class="field-row">
                                        <span class="th1">產品名稱：</span>
                                        <span>
                                            <select id="product3" name="product3" class="validate[required]">
                                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">場地：</span>
                                        <span>
                                            <select id="place3" name="place3" class="validate[required]">
                                                <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="field-row">
                                        <span class="th1">開始時間：</span>
                                        <span><input type="text" class="validate[required] date" id="startDate3" name="startDate3" size="10" /></span><span>
                                            <select id="startHour3" name="startHour3">
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
                                            <select id="startMin3" name="startMin3">
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
                                    <div class="field-row">
                                        <span class="th1">結束時間：</span>
                                        <span><input type="text" class="validate[required] date" id="endDate3" name="endDate3" size="10" /></span><span>
                                            <select id="endHour3" name="endHour3">
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
                                            <select id="endMin3" name="endMin3">
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
                                </div>
                            </div>
                        </fieldset>
                        <div style="text-align: center;">
                            <button id="padd" type="button">
                                確定
                            </button>
                            <button id="pclose" class="dialogClose" type="button">
                                取消
                            </button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
        <script>
            $(document).ready(function(){
            
                var productArea = $("#productArea");
                //禮儀師
                $('#funeralCompany').change(function(event, value){
                    if ($(this).val()) {
                        $.ajax({
                            type: "POST",
                            url: contextRoot + "/combobox/funeraler",
                            data: {
                                id: $(this).val()
                            },
                            success: function(map){
                                $('#funeraler').setDropdown(map).val(value);
                            }
                        })
                    }
                    else {
                        $('#funeraler').html('')
                    }
                });
                var addrMap = {};
                
                $("#add").fancybox({
                    'titlePosition': 'inside',
                    'transitionIn': 'elastic',
                    'transitionOut': 'elastic',
                    onClosed: function(){
                        $("#pdialog").find("form").each(function(){
                            this.reset();
                        }).end().find("#type[value=1]").trigger("click");
                        productArea.find(".productArea").hide().end().find("#type1").show();
                    }
                });
                
                //cityArea
                $('#contactAddrCity').change(function(event, value){
                    if ($(this).val()) {
                        var val = $(this).val();
                        var areaMap = {};
                        $.each(addrMap[val], function(index, value){
                            areaMap[value] = value;
                        });
                        $('#contactAddrArea').setDropdown(areaMap).val(value);
                    }
                    else {
                        $('#contactAddrArea').html('')
                    }
                });
                //禮儀公司,承辦業務,city,queryData
                $.when($.post(contextRoot + "/combobox/funeralCompany"), $.post(contextRoot + "/combobox/employee"), $.post(contextRoot + "/combobox/city"), $.post(contextRoot + "/project/queryid", {
                    id: responseJSON.id
                })).then(function(map, map2, map3, json){
                    map = map[0];
                    map2 = map2[0];
                    map3 = map3[0];
                    json = json[0];
                    
                    addrMap = map3;
                    var cityMap = {};
                    $.each(addrMap, function(value, text){
                        cityMap[value] = value;
                    });
                    $('#contactAddrCity').setDropdown(cityMap);
                    $('#funeralCompany').setDropdown(map);
                    $('#employee').setDropdown(map2);
                    $("#id").val(json.id);
                    $("#projectName").val(json.projectName);
                    $("#inDate").val(json.inDate);
                    $("#inHour").val(json.inHour);
                    $("#inMin").val(json.inMin);
                    $("#employee").val(json.employee);
                    $("#funeralCompany").val(json.funeralCompany).trigger("change", [json.funeraler]);
                    $("#contact").val(json.contact);
                    $("#contactPhone").val(json.contactPhone);
                    $("#contactAddrCity").val(json.contactAddrCity).trigger("change", [json.contactAddrArea]);
                    $("#contactAddr").val(json.contactAddr);
                    $("#memo").val(json.memo);
                    
                    document.title = json.projectName + " - 專案";
                });
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/project/queryDetail",
                    height: 200,
                    postData: {
                        id: responseJSON.id
                    },
                    caption: "商品使用清單",
                    //multiboxonly:true,
                    autowidth: true,
                    pager: true,
                    grouping: true,
                    groupingView: {
                        groupField: ['productName'],
                        groupColumnShow: [false],
                        groupText: ['<b style="color:#009">{0}</b>'],
                        groupCollapse: false,
                        // groupOrder: ['asc'],
                        groupSummary: [true],
                        showSummaryOnHide: true//,
                        //  groupDataSorted: true
                    },
                    pgbuttons: false,
                    pginput: false,
                    footerrow: true,
                    userDataOnFooter: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true
                    }, {
                        header: "品名",
                        name: 'productName',
                        index: 'product.productName',
                        width: 60,
                        align: 'center',
                        hidden: true
                    }, {
                        header: "單價",
                        name: 'price',
                        index: 'price',
                        width: 80,
                        align: "right",
                        formatter: "currency",
                        summaryType: 'count',
                        summaryTpl: '筆數：{0}'
                    
                    }, {
                        header: "賣價(調整後單價)",
                        name: 'modifiedPrice',
                        index: 'modifiedPrice',
                        width: 80,
                        align: "right",
                        formatter: "currency"
                    
                    }, {
                        header: "數量",
                        name: 'quantity',
                        index: 'quantity',
                        width: 80,
                        align: "right",
                        //formatter: "currency",
                        summaryType: 'sum'
                    }, {
                        header: "小計",
                        name: 'amount',
                        index: 'amount',
                        width: 80,
                        align: "right",
                        formatter: "currency",
                        summaryType: 'sum'
                    
                    }, {
                        header: "使用場地",
                        name: 'placeName‧',
                        index: 'place.placeName',
                        width: 80,
                        align: "center"
                    }, {
                        header: "建立人",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 80,
                        align: "center"
                    
                    }, {
                        header: "建立日期",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 130,
                        align: "center"
                    }]
                    /*,
                     ondblClickRow: function(id) {
                     var data = grid1.getRowData(id);
                     API.openCalendar({
                     type: "project",
                     id: data.id,
                     data: $.extend(data, {})
                     });
                     }*/
                });
                
                $("#delete1").click(function(){
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
                        url: contextRoot + "/project/delete",
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
                        url: contextRoot + "/project/modify",
                        data: {
                            columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
                            data: JSON.stringify(id)
                        },
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("修改成功 ");
                        }
                    })
                });
                $("#calendar").click(function(){
                    API.openCalendar({
                        id: responseJSON.id,
                        type: "p",
                        data: {
                            calendarName: $("#projectName").val()
                        }
                    })
                });
                $("#update").click(function(){
                    if ($("#addForm").validationEngine('validate')) {
                        $.ajax({
                            url: contextRoot + "/project/updateAction",
                            data: $("#addForm").serializeData()
                        }).done(function(){
                            opener.$("#projectGrid").trigger("reloadGrid");
                        });
                    }
                });
                $(":input[name=type]").click(function(){
                    var val = $(this).val();
                    productArea.find(".productArea:visible").hide('slide', 200, function(){
                        productArea.find("#type" + val).show("slide", 200);
                    });
                });
                //init project
                $.post(contextRoot + "/combobox/normalProduct", function(map){
                    $('#product1').setDropdown(map);
                });
                $.post(contextRoot + "/combobox/normalProduct2", function(map){
                    $('#product2').setDropdown(map);
                });
                $.post(contextRoot + "/combobox/placeOfProduct", function(map){
                    $('#product3').setDropdown(map);
                });
                $('#product3').change(function(){
                    $.post(contextRoot + "/combobox/placeByProduct", {
                        id: $(this).val()
                    }, function(map){
                        $('#place3').setDropdown(map);
                    });
                });
                $("#padd").click(function(){
                    var form = $("#addProductForm");
                    if (form.validationEngine('validate')) {
                        $.ajax({
                            url: contextRoot + "/project/addProduct",
                            data: $.extend(responseJSON, form.serializeData())
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
    </body>
</html>

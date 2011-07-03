<html>
    <head>
        <title>產品管理</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/product/queryProduct",
                    pager: true,
                    sortname: 'productNo',
                    caption: "產品清單",
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
                        header: "商品代號",
                        name: 'productNo',
                        index: 'productNo',
                        width: 15
                    }, {
                        header: "產品名稱",
                        name: 'productName',
                        index: 'productName',
                        width: 20
                    }, {
                        header: "庫存數量",
                        name: 'totalQuantity',
                        index: 'totalQuantity',
                        width: 20
                    }, {
                        header: "內帳銷售單價",
                        name: 'price',
                        index: 'price',
                        width: 20
                    }, {
                        header: "銷售單價",
                        name: 'sallingPrice',
                        index: 'sallingPrice',
                        width: 20
                    }, {
                        header: "成本單價",
                        name: 'costPrice',
                        index: 'costPrice',
                        width: 20
                    }, {
                        header: "時間類型",
                        name: 'timeType',
                        index: 'timeType',
                        width: 20
                    }, {
                        header: "計價單位",
                        name: 'unit',
                        index: 'unit',
                        width: 20
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 35,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 30
                    }]
                });
                
                var grid2 = $("#grid2").jqGrid({
                    url: contextRoot + "/product/queryPlaceProduct",
                    pager: true,
                    grouping: true,
                    groupingView: {
                        groupField: ['product.productName'],
                        groupColumnShow: [false]
                    },
                    sortname: 'id',
                    caption: "產品清單",
                    colModel: [{
                        name: 'product.id',
                        index: 'product.id',
                        hidden: true
                    }, {
                        name: 'place.id',
                        index: 'place.id',
                        hidden: true
                    }, {
                        header: "產品名稱",
                        name: 'product.productName',
                        index: 'product.productName',
                        width: 20
                    }, {
                        header: "商品代號",
                        name: 'product.productNo',
                        index: 'product.productNo',
                        width: 15
                    }, {
                        header: "場地名稱",
                        name: 'place.placeName',
                        index: 'place.placeName',
                        width: 20
                    }, {
                        header: "內帳銷售單價",
                        name: 'price',
                        index: 'price',
                        width: 20
                    }, {
                        header: "銷售單價",
                        name: 'sallingPrice',
                        index: 'sallingPrice',
                        width: 20
                    }, {
                        header: "成本單價",
                        name: 'costPrice',
                        index: 'costPrice',
                        width: 20
                    }, {
                        header: "時間類型",
                        name: 'product.timeType',
                        index: 'product.timeType',
                        width: 20
                    }, {
                        header: "計價單位",
                        name: 'product.unit',
                        index: 'product.unit',
                        width: 20
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 35,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'product.lastModifyBy.empName',
                        index: 'product.lastModifyBy.empName',
                        width: 30
                    }]
                });
                
                
                $("#delete1,#delete2").click(function(){
                    var action = $(this).prop("id");
                    var grid = action.indexOf('2') > -1 ? grid2 : grid1
                    var selrow = grid.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                        return false;
                    }
                    if (!confirm("確定要刪除?")) {
                        return;
                    }
                    var id = grid.getRowData(selrow);
                    $.extend(id, {
                        hasPlace: action.indexOf('2') > -1
                    });
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/product/delete",
                        data: id,
                        success: function(msg){
                            grid.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    })
                });
                
                $("#add1,#modify1,#add2,#modify2").each(function(){
                    $(this).fancybox({
                        action: $(this).prop("id"),
                        onStart: function(){
                            action = this.action;
                            var hasPlace = action.indexOf('2') > -1;
                            var grid = (hasPlace ? grid2 : grid1);
                            $("#hasPlace").val(hasPlace);
                            $("#totalDiv")[hasPlace ? 'hide' : 'show']();
							$("#totalQuantity")[hasPlace ? 'addClass':'removeClass']('validate[required]');
							$("#placeDiv")[hasPlace ? 'show' : 'hide']();
							$("#placeId")[hasPlace ? 'addClass':'removeClass']('validate[required]');							
                            if (action == "modify1" || action == "modify2") {
                                var selrow = grid.jqGrid('getGridParam', 'selrow');
                                if (!selrow) {
                                    alert("請先選擇修改列");
                                    return false;
                                }
                                
                                var id = grid.getRowData(selrow);
								$("#id").val(hasPlace ? '' : id.id);
                                $("#productNo").val(hasPlace ? id['product.productNo'] : id.productNo);
                                $("#productName").val(hasPlace ? id['product.productName'] : id.productName);
                                $("#totalQuantity").val(id.totalQuantity);
                                $("#price").val(id.price);
                                $("#sallingPrice").val(id.sallingPrice);
                                $("#costPrice").val(id.costPrice);
                                $("#timeType").val(hasPlace ? id['product.timeType'] : id.timeType);
                                $("#unit").val(hasPlace ? id['product.unit'] : id.unit);
                                if (hasPlace) {
                                    $("#hasPlace").val(hasPlace);
									$("#placeId").val(id['place.id']);
                                    $("#OplaceId").val(id['place.id']);
                                    $("#OproductId").val(id['product.id']);
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
                        $.ajax({
                            url: contextRoot + "/product/" + (action == "add1" ? "insert" : "modify"),
                            data: {
                                columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
                                data: JSON.stringify($("#addForm").serializeData()),
                                hasPlace: $("#hasPlace").val()
                            },
                            success: function(msg){
                                $.fancybox.close();
                                grid1.trigger("reloadGrid");
                                alert("產品/場地" + (action == "add1" ? "新增" : "修改") + "成功");
                            }
                        })
                    }
                });
                $("#pclose2,#pclose1").click(function(){
                    $.fancybox.close();
                });
                
                //下拉選單
                //場地
                $.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/place",
                    success: function(map){
                        $('#placeId').setDropdown(map);
                    }
                });
            });
        </script>
        <fieldset>
            <legend>
                一般類商品 
            </legend>
            <div>
                <a id="add1" href="#pdialog" class="button">新增商品</a>
                <a id="modify1" href="#pdialog" class="button">進貨</a>
                <button id="delete1">
                    刪除商品
                </button>
            </div>
            <div id="grid1" />
        </fieldset>
        <fieldset>
            <legend>
                場地類商品 
            </legend>
            <div>
                <a id="add2" href="#pdialog" class="button">新增場地</a>
                <a id="modify2" href="#pdialog" class="button">修改場地</a>
                <button id="delete2">
                    刪除場地
                </button>
            </div>
            <div id="grid2" />
        </fieldset>
        <div class="hide">
            <div id="pdialog" class="dialog" style="display:block;width:400px;">
                <g:form name="addForm" id="addForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                    <div class="dialog-body">
                        <div class="field-row">
                            <span class="th1">商品代號：</span>
                            <span><input type="text" id="productNo" name="productNo" readonly='readonly' /></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">產品名稱：</span>
                            <span><input type="text" id="productName" name="productName" placeholder="產品名稱" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id="placeDiv">
                            <span class="th1">使用場地：</span>
                            <span>
                                <select id="placeId" name="placeId" class="validate[required]">
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id="totalDiv">
                            <span class="th1">庫存數量：</span>
                            <span><input type="text" id="totalQuantity" name="totalQuantity" placeholder="庫存數量" class="validate[required]"/></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">內帳單價：</span>
                            <span><input type="text" id="price" name="price" placeholder="內帳單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">銷售單價：</span>
                            <span><input type="text" id="sallingPrice" name="sallingPrice" placeholder="銷售單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">成本單價：</span>
                            <span><input type="text" id="costPrice" name="costPrice" placeholder="成本單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row">
                            <span class="th1">時間類型：</span>
                            <span>
                                <select id="timeType" name="timeType" class="validate[required]">
                                    <option value="1">小時</option>
                                    <option value="2">天</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row">
                            <span class="th1">計價單位：</span>
                            <span><input type="text" id="unit" name="unit" placeholder="計價單位" class="validate[required]"/></span>
                        </div>
                        <div class="hide">
                            <span class="th1">是否為場地類商品：</span>
                            <span><input type="text" id="hasPlace" name="hasPlace" /></span>
							<input type="hidden" id="id" name="id" />
							<input type="hidden" id="OproductId" name="OproductId" />
							<input type="hidden" id="OplaceId" name="OplaceId" />
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
    </body>
</html>

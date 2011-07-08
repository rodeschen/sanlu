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
                        header: "是否為場地類",
                        name: 'hasPlace',
                        index: 'hasPlace',
                        width: 20,
                        formatter: function(el, cellval, opts){
                            return el ? "是" : "否";
                        }
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
                    }],
                    onSelectRow: function(id){
                        grid2.clearGridData();
                        var product = grid1.getRowData(id);
                        if (product.hasPlace == '是') {
                            grid2.jqGrid('setGridParam', {
                                postData: {
                                    'product.id': product.id
                                },
                                datatype: "json"
                            }).trigger("reloadGrid");
                        }
                    }
                });
                
                var grid2 = $("#grid2").jqGrid({
                    url: contextRoot + "/product/queryPlaceProduct",
                    datatype: "local",
                    pager: true,
                    //grouping: true,
                    //groupingView: {
                    //groupField: ['product.productName'],
                    //    groupColumnShow: [false]
                    //},
                    sortname: 'place',
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
                    var isNomal = action.indexOf('1') > -1;
                    var id = grid.getRowData(selrow);
                    $.extend(id, {
                        isNomal: isNomal
                    });
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/product/delete",
                        data: id,
                        success: function(msg){
                            grid.trigger("reloadGrid");
                            if (isNomal) {
                                $.ajax({
                                    type: "POST",
                                    url: contextRoot + "/combobox/placeOfProduct",
                                    success: function(map){
                                        productId.setDropdown(map);
                                    }
                                });
                            }
                            alert("刪除成功");
                        }
                    })
                });
                var hasPlace = $("#hasPlace"), placeId = $("#placeId"), productName = $('#productName'), productId = $('#productId');
                var action = "";
                $("#add1,#modify1,#add2,#modify2").each(function(){
					//newgrid.jqGrid('getGridParam', 'selrow'); get row id
                    $(this).fancybox({
                        action: $(this).prop("id"),
                        onStart: function(){
                            action = this.action;
                            var isNomal = action.indexOf('1') > -1;
                            var grid = (isNomal ? grid1 : grid2);
                            
                            $("#placeDiv,#productId")[isNomal ? 'hide' : 'show']();
                            $("#placeId,#productId")[isNomal ? 'removeClass' : 'addClass']('validate[required]');
                            
                            $("#productNoDiv,#totalDiv,#productName,#hasPlaceDiv")[!isNomal ? 'hide' : 'show']();
                            $("#totalQuantity,#productName,#hasPlace")[!isNomal ? 'removeClass' : 'addClass']('validate[required]');
                            
                            if (action.indexOf("modify") > -1) {
                                var selrow = grid.jqGrid('getGridParam', 'selrow');
                                if (!selrow) {
                                    alert("請先選擇修改列");
                                    return false;
                                }
                                var id = grid.getRowData(selrow);
                                var hasplace = id.hasPlace == '是';
                                $("#id").val(isNomal ? id.id : '');
                                $("#productNo").val(isNomal ? id.productNo : '');
                                $("#totalQuantity").val(isNomal ? id.totalQuantity : '');
                                $("#price").val(id.price);
                                $("#sallingPrice").val(id.sallingPrice);
                                $("#costPrice").val(id.costPrice);
                                $("#unit").val(isNomal ? id.unit : id['product.unit']);
                                if (isNomal) {
                                    hasPlace.val(hasplace ? "T" : "F");
                                    productName.val(id.productName);
                                }
                                else {
                                
                                    placeId.val(id['place.id']);
                                    $("#OplaceId").val(id['place.id']);
                                    $("#OproductId").val(id['product.id']);
                                    productId.val(id['product.id']);
                                }
                                
                            }
                            else {
                            
                            }
                            hasPlace.trigger("change");
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
                        var isNomal = action.indexOf('1') > -1
                        var grid = isNomal ? grid1 : grid2;
                        $.ajax({
                            url: contextRoot + "/product/" + (action == "add1" || action == "add2" ? "insert" : "modify"),
                            data: {
                                columnParam: JSON.stringify(grid.jqGrid('getGridParam', 'colModel')),
                                data: JSON.stringify($("#addForm").serializeData()),
                                isNomal: isNomal
                            },
                            success: function(msg){
                                $.fancybox.close();
                                grid.trigger("reloadGrid");
                                if (isNomal) {
                                    $.ajax({
                                        type: "POST",
                                        url: contextRoot + "/combobox/placeOfProduct",
                                        success: function(map){
                                            productId.setDropdown(map);
                                        }
                                    });
                                }
                                alert("產品/場地" + (action == "add1" || action == "add2" ? "新增" : "修改") + "成功");
                            }
                        })
                    }
                });
                $("#pclose2,#pclose1").click(function(){
                    $.fancybox.close();
                });
                hasPlace.change(function(){
                    var v = $(this).val();
                    $("#priceDiv,#sallingPriceDiv,#costPriceDiv,#unitDiv")[v == "F" ? 'show' : 'hide']();
                    $("#price,#sallingPrice,#costPrice,#unit")[v == "F" ? 'removeClass' : 'addClass']('validate[required]');
                });
                //下拉選單
                //場地
                $.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/place",
                    success: function(map){
                        placeId.setDropdown(map);
                    }
                });
                $.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/placeOfProduct",
                    success: function(map){
                        productId.setDropdown(map);
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
                        <div class="field-row" id='productNoDiv'>
                            <span class="th1">商品代號：</span>
                            <span><input type="text" id="productNo" name="productNo" readonly='readonly' /></span>
                        </div>
                        <div class="field-row" id='productNameDiv'>
                            <span class="th1">產品名稱：</span>
                            <span><input type="text" id="productName" name="productName" placeholder="產品名稱" class="validate[required]"/>
                                <select id="productId" name="productId" class="validate[required]">
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id='hasPlaceDiv'>
                            <span class="th1">是否為場地類：</span>
                            <span>
                                <select id="hasPlace" name="hasPlace">
                                    <option value="T">是</option>
                                    <option value="F" selected=selected>否</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id="placeDiv">
                            <span class="th1">使用場地：</span>
                            <span>
                                <select id="placeId" name="placeId" class="validate[required]">
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id="priceDiv">
                            <span class="th1">內帳單價：</span>
                            <span><input type="text" id="price" name="price" placeholder="內帳單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id="sallingPriceDiv">
                            <span class="th1">銷售單價：</span>
                            <span><input type="text" id="sallingPrice" name="sallingPrice" placeholder="銷售單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id="costPriceDiv">
                            <span class="th1">成本單價：</span>
                            <span><input type="text" id="costPrice" name="costPrice" placeholder="成本單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id="unitDiv">
                            <span class="th1">計價單位：</span>
                            <span><input type="text" id="unit" name="unit" placeholder="計價單位" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id='totalDiv'>
                            <span class="th1">庫存數量：</span>
                            <span><input type="text" id="totalQuantity" name="totalQuantity" placeholder="庫存數量" class="validate[required]"/></span>
                        </div><input type="hidden" id="id" name="id" /><input type="hidden" id="OproductId" name="OproductId" /><input type="hidden" id="OplaceId" name="OplaceId" />
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

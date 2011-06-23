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
                
                
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/product/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    })
                });
                $("#add1,#modify1").each(function(){
                    $(this).fancybox({
                        action: $(this).prop("id"),
                        onStart: function(){
                            action = this.action;
                            if (action == "modify1") {
                                var selrow = grid1.jqGrid('getGridParam', 'selrow');
                                if (!selrow) {
                                    alert("請先選擇修改列");
                                    return false;
                                }
                                var id = grid1.getRowData(selrow);
                                $("#productNo").html(id.productNo);
                                $("#productName").val(id.productName);
                                $("#totalQuantity").val(id.totalQuantity);
                                $("#price").val(id.price);
                                $("#sallingPrice").val(id.sallingPrice);
                                $("#costPrice").val(id.costPrice);
                                $("#timeType").val(id.timeType);
                                $("#unit").val(id.unit);
                                $("#hasPlace").val('是' == id.hasPlace);
                            }
                        },
                        'titlePosition': 'inside',
                        'transitionIn': 'elastic',
                        'transitionOut': 'elastic'
                    });
                });
                $("#padd1").click(function(){
                    if ($("#addForm").validationEngine('validate')) {
                        $.ajax({
                            url: contextRoot + "/product/" + (action == "add1" ? "insert" : "modify"),                            
                            data: $("#addForm").serializeData(),
                            success: function(msg){
                                $.fancybox.close();
                                grid1.trigger("reloadGrid");
                                alert("產品" + (action == "add1" ? "新增" : "修改") + "成功");
                            }
                        })
                    }
                });
                /*
                $("#modify1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇修改列");
                    }
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/product/modify",
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
                */
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
                        url: contextRoot + "/product/delete",
                        data: {
                            data: JSON.stringify(id)
                        },
                        success: function(msg){
                            grid2.trigger("reloadGrid");
                            alert("刪除成功 ");
                        }
                    })
                });
                $("#modify2").click(function(){
                    var selrow = grid2.jqGrid('getGridParam', 'selrow');
                    if (!selrow) {
                        alert("請先選擇修改列");
                    }
                    var id = grid2.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/product/modify",
                        data: {
                            columnParam: JSON.stringify(grid2.jqGrid('getGridParam', 'colModel')),
                            data: JSON.stringify(id),							
							hasPlace: true
                        },
                        success: function(msg){
                            grid2.trigger("reloadGrid");
                            alert("修改成功");
                        }
                    })
                });
                $("#pclose2,#pclose1").click(function(){
                    $.fancybox.close();
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
                <button id="add2">
                    新增
                </button>
                <button id="modify2">
                    修改
                </button>
                <button id="delete2">
                    刪除
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
                                <span><label id="productNo" ></label></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">產品名稱：</span>
                                <span><input type="text" id="productName" name="productName" placeholder="產品名稱" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">庫存數量：</span>
                                <span><input type="text" id="totalQuantity" name="totalQuantity" placeholder="庫存數量" class="validate[required]"/></span>
                            </div>
                            <div class="field-row">
                                <span class="th1">內帳銷售單價：</span>
                                <span><input type="text" id="price" name="price" placeholder="內帳銷售單價" class="validate[required]"/></span>
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
                            <div class="field-row">
                                <span class="th1">是否為場地類商品：</span>
                                <span>
                                    <select id="hasPlace" name="hasPlace" class="validate[required]">
                                        <option value="false">否</option>
                                        <option value="true">是</option>
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
    </body>
</html>
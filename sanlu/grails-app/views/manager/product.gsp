<html>
<head>
<title>產品管理</title>
<meta name="layout" content="inner" />
</head>
<body>
	<script>
            $(document).ready(function(){
                var hasPlace = $("#hasPlace"), placeId = $("#placeId"), productName = $('#productName'), productId = $('#productId');
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/product/queryProduct",
                    pager: true,
                    sortname: 'productNo',
                    caption: "商品清單",
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
                        header: "場地類",
                        name: 'hasPlace',
                        index: 'hasPlace',
                        width: 20,
                        formatter: function(el, cellval, opts){
                            return el ? "是" : "否";
                        }
					 }, {
                        header: "代叫品項",
                        name: 'isAgency',
                        index: 'isAgency',
                        width: 20,
                        formatter: function(el, cellval, opts){
                            return el ? "是" : "否";
                        }                    
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
                        header: "庫存數量",
                        name: 'totalQuantity',
                        index: 'totalQuantity',
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
                        $("#placeMDiv")[product.hasPlace == '是' ? 'show' : 'hide']();
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
                    caption: "場地清單",
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key: true
                    }, {
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
					var isNomal = action.indexOf('1') > -1;
					if(isNomal&&grid2.jqGrid('getGridParam', 'records')> 0){
						alert("請先刪除商品使用場地");
                        return false;
					}
                    if (!confirm("確定要刪除?")) {
                        return;
                    }                    
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
                
                var action = "";
                $("#add1,#modify1,#add2,#modify2").each(function(){
                    //newgrid.jqGrid('getGridParam', 'selrow'); get row id
                    $(this).fancybox({
                        action: $(this).prop("id"),
                        onStart: function(){
                            var selrow;
                            action = this.action;
                            var isNomal = action.indexOf('1') > -1;
                            var grid = (isNomal ? grid1 : grid2);
                            
                            $("#placeDiv,#productId")[isNomal ? 'hide' : 'show']();
                            $("#placeId,#productId")[isNomal ? 'removeClass' : 'addClass']('validate[required]');
                            $("#productName,#hasPlaceDiv,#unitDiv,#isAgencyDiv")[!isNomal ? 'hide' : 'show']();
                            $("#productName,#hasPlace,#unit,#isAgency")[!isNomal ? 'removeClass' : 'addClass']('validate[required]');
                            
                            if (action.indexOf("modify") > -1) {
                                selrow = grid.jqGrid('getGridParam', 'selrow');
                                if (!selrow) {
                                    alert("請先選擇修改列");
                                    return false;
                                }
                                var id = grid.getRowData(selrow);
                                var hasplace = id.hasPlace == '是';
                                $("#id").val(id.id);
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
                                    //$("#OplaceId").val(id['place.id']);
                                    //$("#OproductId").val(id['product.id']);
                                    productId.val(id['product.id']);
                                }
                                
                            }
                            else {
                            
                            }
                            var product = grid1.getRowData(grid1.jqGrid('getGridParam', 'selrow'));
                            productId.val(product.id);
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
                        var isNomal = action.indexOf('1') > -1;
                        var grid = isNomal ? grid1 : grid2;
                        $.ajax({
                            url: contextRoot + "/product/" + (action == "add1" || action == "add2" ? "insert" : "modify"),
                            data: {
                                columnParam: JSON.stringify(grid.jqGrid('getGridParam', 'colModel')),
                                data: JSON.stringify($.extend($("#addForm").serializeData(), {
                                    productId: productId.val()
                                })),
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
                                    $.ajax({
                                        type: "POST",
                                        url: contextRoot + "/combobox/normalProduct",
                                        success: function(map){
                                            $('#normalProduct').setDropdown(map);
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
				$("#purchaseBtn").fancybox({
                        'titlePosition': 'inside',
                        'transitionIn': 'elastic',
                        'transitionOut': 'elastic',
                        onClosed: function(){
                            addForm2.reset();
                        }
                    });
				$("#padd2").click(function(){
                    if ($('#addForm2').validationEngine('validate')) {
                        $.ajax({
                            url: contextRoot + "/product/purchase",
                            data: $.extend($("#addForm2").serializeData(), {
                                    id: $('#normalProduct').val()
                                })                               
                            ,
                            success: function(msg){
                                $.fancybox.close();
                                grid1.trigger("reloadGrid");                                
                                alert("進貨成功");
                            }
                        })
                    }
                });
                hasPlace.change(function(){
                    var v = $(this).val();
                    $("#priceDiv,#sallingPriceDiv,#totalDiv,#costPriceDiv,#isAgencyDiv")[v == "F" ? 'show' : 'hide']();
                    $("#price,#sallingPrice,#totalQuantity,#costPrice,#isAgency")[v == "F" ? 'removeClass' : 'addClass']('validate[required]');
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
				//場地型商品
                $.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/placeOfProduct",
                    success: function(map){
                        productId.setDropdown(map);
                    }
                });
				//一般商品
				$.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/normalProduct",
                    success: function(map){
                        $('#normalProduct').setDropdown(map);
                    }
                });
				$.ajax({
                    type: "POST",
                    url: contextRoot + "/combobox/nonCloseProject",
                    success: function(map){
                        $('#project').setDropdown(map);
                    }
                });
            });
            
        </script>
        <fieldset>
            <legend>
                商品 
            </legend>
            <div>
                <a id="add1" href="#pdialog" class="button">新增商品</a>
                <a id="modify1" href="#pdialog" class="button">修改商品</a>
                <button id="delete1">
                    刪除商品
                </button>
				<a id="purchaseBtn" href="#pdialog2" class="button">進貨</a>
            </div>
            <div id="grid1" />
        </fieldset>
        <fieldset>
            <legend>
                商品使用場地 
            </legend>
            <div id='placeMDiv' class="hide">
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
                        <!-- <div class="field-row" id='productNoDiv'>
                            <span class="th1">商品代號：</span>
                            <span><input type="text" id="productNo" name="productNo" readonly='readonly' /></span>
                        </div> -->
                        <div class="field-row" id='productNameDiv'>
                            <span class="th1">產品名稱：</span>
                            <span><input type="text" id="productName" name="productName" placeholder="產品名稱" class="validate[required]"/>
                                <select id="productId" name="productId" class="validate[required]" disabled>
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id='hasPlaceDiv'>
                            <span class="th1">場地類：</span>
                            <span>
                                <select id="hasPlace" name="hasPlace">
                                    <option value="T">是</option>
                                    <option value="F" selected='selected'>否</option>
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
						<div class="field-row" id='isAgencyDiv'>
                            <span class="th1">代叫品項：</span>
                            <span>
                                <select id="isAgency" name="isAgency">
                                    <option value="T">是</option>
                                    <option value="F" selected=selected>否</option>
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
                        <!--<div class="field-row" id="costPriceDiv">
                            <span class="th1">成本單價：</span>
                            <span><input type="text" id="costPrice" name="costPrice" placeholder="成本單價" class="validate[required]"/></span>
                        </div>                        
                        <div class="field-row" id='totalDiv'>
                            <span class="th1">庫存數量：</span>
                            <span><input type="text" id="totalQuantity" name="totalQuantity" placeholder="庫存數量" class="validate[required]"/></span>
                        </div>-->
						<div class="field-row" id="unitDiv">
                            <span class="th1">計價單位：</span>
                            <span><input type="text" id="unit" name="unit" placeholder="計價單位" class="validate[required]"/></span>
                        </div>
						<input type="hidden" id="id" name="id" />
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
		<div class="hide">
            <div id="pdialog2" class="dialog2" style="display:block;width:400px;">
                <g:form name="addForm2" id="addForm2" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
                    <div class="dialog-body">                        
                        <div class="field-row" id='productDiv'>
                            <span class="th1">進貨產品：</span>
                            <span>
                                <select id="normalProduct" name="normalProduct" class="validate[required]" >
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row">
                            <span class="th1">進貨專案：</span>
                            <span>
                                <select id="project" name="project" >
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
                        </div>
                        <div class="field-row" id="priceDiv">
                            <span class="th1">進貨廠商：</span>
                            <span><input type="text" id="vendor" name="vendor" placeholder="進貨廠商" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id="priceDiv">
                            <span class="th1">進貨單價：</span>
                            <span><input type="text" id="purchasePrice" name="purchasePrice" placeholder="進貨單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id='totalDiv'>
                            <span class="th1">進貨數量：</span>
                            <span><input type="text" id="purchaseQuantity" name="purchaseQuantity" placeholder="進貨數量" class="validate[required]"/></span>
                        </div><input type="hidden" id="id" name="id" />
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
    </body>
</html>

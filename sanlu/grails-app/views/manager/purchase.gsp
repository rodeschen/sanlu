<html>
<head>
<title>商品進貨管理</title>
<meta name="layout" content="inner" />
</head>
<body>
	<script>
            $(document).ready(function(){
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
                        header: "銷售單價",
                        name: 'sallingPrice',
                        index: 'sallingPrice',
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
                        header: "銷售單價",
                        name: 'sallingPrice',
                        index: 'sallingPrice',
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
                //下拉選單
                
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
				<a id="purchaseBtn" href="#pdialog2" class="button">進貨</a>
            </div>
            <div style="margin-top:5px;" id="grid1" />
        </fieldset>
        <fieldset>
            <legend>
                商品使用場地 
            </legend>
            <div id="grid2" />
        </fieldset>        
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
                            <span class="th1">進貨日期：</span>
                            <span><input type="text" id="date" name="date" placeholder="進貨日期" class="validate[required] date"/></span>
                        </div>                        
                        <div class="field-row" id="priceDiv">
                            <span class="th1">進貨單價：</span>
                            <span><input type="text" id="purchasePrice" name="purchasePrice" placeholder="進貨單價" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id='totalDiv'>
                            <span class="th1">進貨數量：</span>
                            <span><input type="text" id="purchaseQuantity" name="purchaseQuantity" placeholder="進貨數量" class="validate[required]"/></span>
                        </div>
                        <div class="field-row" id='memoDiv'>
                            <span class="th1">備註：</span>
                            <span><input type="text" id="memo" name="memo" placeholder="memo" /></span>
                        </div>
                        <input type="hidden" id="id" name="id" />
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

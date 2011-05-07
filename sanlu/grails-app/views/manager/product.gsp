<html>
    <head>
        <title>產品管理</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/product/query",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true
                    }, {
                        header: "商品代號",
                        name: 'productNo',
                        index: 'productNo',
                        width: 30
                    }, {
                        header: "產品名稱",
                        name: 'productName',
                        index: 'productName',
                        width: 40
                    }, {
                        header: "庫存數量",
                        name: 'totalQuantity',
                        index: 'totalQuantity',
                        width: 40
                    }, {
                        header: "內帳銷售單價",
                        name: 'price',
                        index: 'price',
                        width: 30
                    }, {
                        header: "成本單價",
                        name: 'costPrice',
                        index: 'costPrice',
                        width: 40
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
                        width: 40,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 40
                    }],
                    onSelectRow: function(id){
                        var company = grid1.getRowData(id);
                        grid2.jqGrid('setGridParam', {
                            postData: {
                                'funeralCompanyId': company.id
                            },
                            datatype: "json"
                        }).trigger("reloadGrid");
                    },
                    multiselect: true,
                    caption: "Manipulating Array Data"
                });
                
                var grid2 = $("#grid2").jqGrid({
                    url: contextRoot + "/product/query?hasPlace=true",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true
                    }, {
                        header: "產品名稱",
                        name: 'product.productName',
                        index: 'product.productName',
                        width: 40
                    }, {
                        header: "商品代號",
                        name: 'product.productNo',
                        index: 'product.productNo',
                        width: 10
                    }, {
                        header: "場地名稱",
                        name: 'place.placeName',
                        index: 'place.placeName',
                        width: 10
                    }, {
                        header: "內帳銷售單價",
                        name: 'price',
                        index: 'price',
                        width: 30
                    }, {
                        header: "銷售單價",
                        name: 'sallingPrice',
                        index: 'sallingPrice',
                        width: 30
                    }, {
                        header: "成本單價",
                        name: 'costPrice',
                        index: 'costPrice',
                        width: 30
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
                        width: 40,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 30
                    }],
                    grouping: true,
                    groupingView: {
                        groupField: ['product.productName']
                    },
                    multiselect: true,
					sortname: 'productName',
                    caption: "Manipulating Array Data"
                });
                
                
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selarrrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    if (!confirm("刪除公司將會連該公司員工一併刪除，確認刪除?")) {
                        return;
                    }
                    
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeralCompany/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功");
                        }
                    })
                });
                $("#modify1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selarrrow');
                    if (!selrow) {
                        alert("請先選擇修改列");
                    }
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeralCompany/modify",
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
                
                $("#delete2").click(function(){
                    var selrow = grid2.jqGrid('getGridParam', 'selarrrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    if (!confirm("確定要刪除?")) {
                        return;
                    }
                    var id = grid2.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeraler/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功 ");
                        }
                    })
                });
                $("#modify2").click(function(){
                    var selrow = grid2.jqGrid('getGridParam', 'selarrrow');
                    if (!selrow) {
                        alert("請先選擇修改列");
                    }
                    var id = grid2.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/funeraler/modify",
                        data: {
                            columnParam: JSON.stringify(grid2.jqGrid('getGridParam', 'colModel')),
                            data: JSON.stringify(id)
                        },
                        success: function(msg){
                            grid2.trigger("reloadGrid");
                            alert("修改成功");
                        }
                    })
                });
            });
        </script>
        <fieldset>
            <legend>
                一般類商品 
            </legend>
            <div>
                <button id="add1">
                    新增
                </button>
                <button id="modify1">
                    修改
                </button>
                <button id="delete1">
                    刪除
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
    </body>
</html>
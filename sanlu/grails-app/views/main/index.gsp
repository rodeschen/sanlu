<html>
    <head>
        <title>首頁</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/project/query",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true
                    }, {
                        name: 'projectName',
                        index: 'projectName',
                        width: 60
                    }, {
                        header: "禮儀公司/禮儀師",
                        name: 'funeraler.funeralerName',
                        index: 'funeraler.funeralerName',
                        width: 90
                    
                    }, {
                        name: 'inDate',
                        index: 'inDate',
                        width: 100
                    }, {
                        name: 'outDate',
                        index: 'outDate',
                        width: 100
                    }, {
                        name: 'emp.empName',
                        index: 'emp.empName',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'sallingTotal',
                        index: 'sallingTotal',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'total',
                        index: 'total',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'memo',
                        index: 'memo',
                        width: 150,
                        sortable: false
                    }],
                    multiselect: true,
                    caption: "Manipulating Array Data"
                });
                
                var grid2 = $("#grid2").jqGrid({
                    datatype: "local",
                    height: "auto",
                    autowidth: true,
                    //pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        width: 60
                    }, {
                        name: 'invdate',
                        index: 'invdate',
                        width: 90
                    }, {
                        name: 'name',
                        index: 'name',
                        width: 500
                    }, {
                        name: 'amount',
                        index: 'amount',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'tax',
                        index: 'tax',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'total',
                        index: 'total',
                        width: 80,
                        align: "right"
                    }, {
                        name: 'note',
                        index: 'note',
                        width: 150,
                        sortable: false
                    }],
                    multiselect: true,
                    caption: "Manipulating Array Data"
                });
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selarrrow');
                    if (!selrow) {
                        alert("請先選擇刪除列");
                    }
                    var id = grid1.getRowData(selrow);
                    $.ajax({
                        type: "POST",
                        url: contextRoot + "/project/delete",
                        data: id,
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("刪除成功: " + msg);
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
                        url: contextRoot + "/project/modify",
                        data: {
                            columnParam: JSON.stringify(grid1.jqGrid('getGridParam', 'colModel')),
							data : JSON.stringify(id)
                        },
                        success: function(msg){
                            grid1.trigger("reloadGrid");
                            alert("修改成功: " + msg);
                        }
                    })
                });
            });
        </script>
        <fieldset>
            <legend>
                進行中專案
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
            <div id="grid1"/>
        </fieldset>
        <fieldset>
            <legend>
                場地清單
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
            <div id="grid2"/>
        </fieldset>
    </body>
</html>
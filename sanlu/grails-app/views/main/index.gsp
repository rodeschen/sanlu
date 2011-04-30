<html>
    <head>
        <title>首頁</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
                $("#grid1").jqGrid({
                    url: contextRoot + "/project/queryAction",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
					pager:true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        width: 60,
                        sorttype: "int"
                    }, {
                        header: "他是頭",
                        name: 'invdate',
                        index: 'invdate',
                        width: 90,
                        sorttype: "date"
                    }, {
                        name: 'name',
                        index: 'name',
                        width: 100
                    }, {
                        name: 'amount',
                        index: 'amount',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'tax',
                        index: 'tax',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'total',
                        index: 'total',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'note',
                        index: 'note',
                        width: 150,
                        sortable: false
                    }],
                    multiselect: true,
                    caption: "Manipulating Array Data"
                });
                
                $("#grid2").jqGrid({
                    datatype: "local",
                    height: "auto",
                    autowidth: true,
                    //pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        width: 60,
                        sorttype: "int"
                    }, {
                        name: 'invdate',
                        index: 'invdate',
                        width: 90,
                        sorttype: "date"
                    }, {
                        name: 'name',
                        index: 'name',
                        width: 500
                    }, {
                        name: 'amount',
                        index: 'amount',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'tax',
                        index: 'tax',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'total',
                        index: 'total',
                        width: 80,
                        align: "right",
                        sorttype: "float"
                    }, {
                        name: 'note',
                        index: 'note',
                        width: 150,
                        sortable: false
                    }],
                    multiselect: true,
                    caption: "Manipulating Array Data"
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
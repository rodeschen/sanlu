<html>
    <head>
        <title>禮儀公司管理</title>
        <meta name="layout" content="inner" />
    </head>
    <body>
        <script>
            $(document).ready(function(){
            	var contextRoot = "${request.contextPath}";
                var grid1 = $("#grid1").jqGrid({
                    url: contextRoot + "/funeralCompany/query",
                    datatype: "json",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key:true
                    }, {
                        header: "禮儀公司",
                        name: 'funeralCompanyName',
                        index: 'funeralCompanyName',
                        width: 90
                    }, {
                        header: "電話1",
                        name: 'phone1',
                        index: 'phone1',
                        width: 100
                    }, {
                        header: "電話2",
                        name: 'phone2',
                        index: 'phone2',
                        width: 100
                    }, {
                        header: "地址",
                        name: 'address',
                        index: 'address',
                        width: 220
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 120,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 80
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
                    caption: "Manipulating Array Data"
                });
                
                var grid2 = $("#grid2").jqGrid({
                    url: contextRoot + "/funeraler/query",
                    datatype: "local",
                    height: "auto",
                    autowidth: true,
                    pager: true,
                    colModel: [{
                        name: 'id',
                        index: 'id',
                        hidden: true,
                        key:true
                    }, {
                        name: 'funeralCommpany.id',
                        index: 'funeralCommpany.id',
                        hidden: true
                    }, {
                        header: "禮儀師姓名",
                        name: 'funeralerName',
                        index: 'funeralerName',
                        width: 90
                    
                    }, {
                        header: "電話1",
                        name: 'phone1',
                        index: 'phone1',
                        width: 100
                    }, {
                        header: "電話2",
                        name: 'phone2',
                        index: 'phone2',
                        width: 100
                    }, {
                        header: "最後修改時間",
                        name: 'lastUpdated',
                        index: 'lastUpdated',
                        width: 120,
                        sorttype: "date"
                    }, {
                        header: "最後修改者",
                        name: 'lastModifyBy.empName',
                        index: 'lastModifyBy.empName',
                        width: 80
                    }],
                    caption: "Manipulating Array Data"
                });
                
                $("#delete1").click(function(){
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
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
                    debugger;
                    var selrow = grid1.jqGrid('getGridParam', 'selrow');
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
                        url: contextRoot + "/funeraler/delete",
                        data: id,
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
                禮儀公司 
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
                禮儀師 
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
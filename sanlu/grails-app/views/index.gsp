<html>
	<head>
		<title>Welcome to Grails</title>
		<meta name="layout" content="main" />
		<script>
			$(document).ready( function() {
				$("#grid1").jqGrid({
					datatype: "local",
					height: 100,
					autowidth:true,
					//pager: '#page1',
					colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
					colModel:[{
						name:'id',
						index:'id',
						width:60,
						sorttype:"int"
					},{
						name:'invdate',
						index:'invdate',
						width:90,
						sorttype:"date"
					},{
						name:'name',
						index:'name',
						width:100
					},{
						name:'amount',
						index:'amount',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'tax',
						index:'tax',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'total',
						index:'total',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'note',
						index:'note',
						width:150,
						sortable:false
					}
					],
					multiselect: true,
					caption: "Manipulating Array Data"
				});

				$("#grid2").jqGrid({
					datatype: "local",
					height: 100,
					autowidth:true,
					//pager: '#page2',
					colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
					colModel:[{
						name:'id',
						index:'id',
						width:60,
						sorttype:"int"
					},{
						name:'invdate',
						index:'invdate',
						width:90,
						sorttype:"date"
					},{
						name:'name',
						index:'name',
						width:100
					},{
						name:'amount',
						index:'amount',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'tax',
						index:'tax',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'total',
						index:'total',
						width:80,
						align:"right",
						sorttype:"float"
					},{
						name:'note',
						index:'note',
						width:150,
						sortable:false
					}
					],
					multiselect: true,
					caption: "Manipulating Array Data"
				});
			});
		</script>
	</head>
	<body>
		<fieldset>
			<legend>
				進行中專案
			</legend>
			<table id="grid1">
			</table>
			<div id="page1">
			</div>
		</fieldset>
		<fieldset>
			<legend>
				場地清單
			</legend>
			<table id="grid2">
			</table>
			<div id="page2">
			</div>
		</fieldset>
		</fieldset>
	</body>
</html>

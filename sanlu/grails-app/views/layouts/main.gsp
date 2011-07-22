<html>
	<head>
		<title>
			<g:layoutTitle default="三蘆關懷會館" />
		</title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/jqgrid/css',file:'ui.jqgrid.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.css')}"/>
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/formValidator/css',file:'validationEngine.jquery.css')}"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
		<script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery-1.6.1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/jqgrid/js/i18n',file:'grid.locale-en.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/jqgrid/js',file:'jquery.jqGrid.src.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/function',file:'chineseCalendar.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/formValidator/languages',file:'jquery.validationEngine-tw.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/formValidator',file:'jquery.validationEngine.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/base',file:'base.js')}"></script>
		<g:layoutHead />
			<!--<g:javascript library="application" />-->
			<style>
			</style>
	</head>
	<body>
		<div id="body">
			<header>
			</header>
			<hr/>
			<g:if test="${session.empLevel}">
				<nav>
					<ul id="nav">
						<li class="current">
							<a href="${request.contextPath}/main">首頁</a>
						</li>
						<li>
							<a href="#">商品</a>
							<ul>
								<li>
									<a href="${request.contextPath}/manager/purchase">商品進貨</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">報表</a>
							<ul>
								<li>
									<a id="agency" href="#agencyDialog1">品項代叫報表</a>
								</li>
								<li>
									<a id="productSale" href="#agencyDialog2">商品提出明細</a>
								</li>
								<li>
									<a id="productDaily" href="#agencyDialog3">商品日執行表</a>
								</li>
							</ul>
						</li>
						<g:if test="${session.empLevel.equals(1)}">
							<li>
								<a href="#">系統管理</a>
								<ul>
									<li>
										<a href="${request.contextPath}/manager/place">場地管理</a>
									</li>
									<li>
										<a href="${request.contextPath}/manager/product">商品管理</a>
									</li>
									<li>
										<a href="${request.contextPath}/manager/funeralcompany">禮儀公司管理</a>
									</li>
									<li>
										<hr />
									</li>
									<li>
										<a href="${request.contextPath}/manager/employee">員工管理</a>
									</li>
								</ul>
							</li>
						</g:if>
						<li style="float:right;">
							<a id="logout" href="${request.contextPath}/login/logout">登出</a>
						</li>
						<li style="float:right;">
							姓名:${session.empName}
						</li>
					</ul>
				</nav>
				<aside>
					<span>&gt;&gt;</span> 首頁
				</aside>
			</g:if>
			<section>
				<g:layoutBody />
			</section>
			<div class="hide">
				<div id="agencyDialog1">
					<fieldset>
						<legend>
							品項代叫報表
						</legend>
						<g:form name="agencyForm" id="agencyForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
							<div class="field-row">
								<span class="th1">報表月份：</span> <select id="exportYear"
								name="exportYear">
								<option value="2010">2010</option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select> <select id="exportMonth" name="exportMonth">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> </span>
							</div>
							<div style="text-align: center;">
								<button id="excelExport1" type="button">
									確定
								</button>
								<button class="dialogClose" type="button">
									取消
								</button>
							</div>
						</g:form>
					</fieldset>
				</div>
			</div>
			<div class="hide">
				<div id="agencyDialog2">
					<fieldset>
						<legend>
							商品提出明細
						</legend>
						<g:form name="productSaleForm" id="productSaleForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
							<div class="field-row">
								<span class="th1">報表月份：</span> <select id="exportYear"
								name="exportYear">
								<option value="2010">2010</option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select> <select id="exportMonth" name="exportMonth">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> </span>
							</div>
							<div style="text-align: center;">
								<button id="excelExport2" type="button">
									確定
								</button>
								<button class="dialogClose" type="button">
									取消
								</button>
							</div>
						</g:form>
					</fieldset>
				</div>
			</div>
			<div class="hide">
				<div id="agencyDialog3">
					<fieldset>
						<legend>
							商品日執行表
						</legend>
						<g:form name="productDailyForm" id="productDailyForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
							<div class="field-row">
								<span class="th1">商品：</span>
                            <span>
                                <select id="productId" name="productId" >
                                    <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </span>
								<span class="th1">報表月份：</span> <select id="exportYear"
								name="exportYear">
								<option value="2010">2010</option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
							</select> <select id="exportMonth" name="exportMonth">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> </span>
							</div>
							<div style="text-align: center;">
								<button id="excelExport3" type="button">
									確定
								</button>
								<button class="dialogClose" type="button">
									取消
								</button>
							</div>
						</g:form>
					</fieldset>
				</div>
			</div>
		</div>
		<script>
		//品項代叫報表
		var agencyForm = $("#agencyForm");
		$("#agency").fancybox({
			'titlePosition': 'inside',
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			onStart: function() {
				var now = new Date()
				agencyForm.find("#exportYear").val(now.getFullYear());
				agencyForm.find("#exportMonth").val((now.getMonth()<9?'0':'')+(now.getMonth()+1));
			},
			onClosed: function() {
				$("#agencyDialog1").find("form").each( function() {
					this.reset();
				});
			}
		});
		$("#excelExport1").click( function() {
			if(agencyForm.validationEngine('validate')) {
				API.formSubmit({
					url: contextRoot + "/excel/agency",
					target: "_self",
					data: {
						exportYear : agencyForm.find("#exportYear").val(),
						exportMonth : agencyForm.find("#exportMonth").val()
					}
				});
				$.fancybox.close();
			}
		});
		//商品提出明細
		var productSaleForm = $("#productSaleForm");
		$("#productSale").fancybox({
			'titlePosition': 'inside',
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			onStart: function() {
				var now = new Date()
				productSaleForm.find("#exportYear").val(now.getFullYear());
				productSaleForm.find("#exportMonth").val((now.getMonth()<9?'0':'')+(now.getMonth()+1));
			},
			onClosed: function() {
				$("#agencyDialog2").find("form").each( function() {
					this.reset();
				});
			}
		});
		$("#excelExport2").click( function() {
			if(productSaleForm.validationEngine('validate')) {
				API.formSubmit({
					url: contextRoot + "/excel/productSale",
					target: "_self",
					data: {
						exportYear : productSaleForm.find("#exportYear").val(),
						exportMonth : productSaleForm.find("#exportMonth").val()
					}
				});
				$.fancybox.close();
			}
		});
		//商品日執行表
		var productDailyForm = $("#productDailyForm");
		$("#productDaily").fancybox({
			'titlePosition': 'inside',
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			onStart: function() {
				var now = new Date()
				productDailyForm.find("#exportYear").val(now.getFullYear());
				productDailyForm.find("#exportMonth").val((now.getMonth()<9?'0':'')+(now.getMonth()+1));
			},
			onClosed: function() {
				$("#agencyDialog3").find("form").each( function() {
					this.reset();
				});
			}
		});
		$("#excelExport3").click( function() {
			if(productDailyForm.validationEngine('validate')) {
				API.formSubmit({
					url: contextRoot + "/excel/productDaily",
					target: "_self",
					data: {
						productId:productDailyForm.find("#productId").val(),
						exportYear : productDailyForm.find("#exportYear").val(),
						exportMonth : productDailyForm.find("#exportMonth").val()
					}
				});
				$.fancybox.close();
			}
		});
		$(".dialogClose").live('click', function() {
			$.fancybox.close();
		});
		//下拉選單
		//一般商品
		$.ajax({
            type: "POST",
            url: contextRoot + "/combobox/normalProduct",
            success: function(map){
                $('#productId').setDropdown(map);
            }
        });
		</script>
	</body>
</html>
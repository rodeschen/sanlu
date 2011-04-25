/**
 * override grid
 */
(function($) {
	$.extend($.jgrid.defaults, {
		rowNum:50,
		scroll:1,
		hidegrid:false
	})
	var _jqGrid = $.fn.jqGrid;
	$.fn.jqGrid = function() {
		if(!arguments.length) {
			alert("argument error");
			return this;
		}
		
		if((this.is("div") || !this.is("[role=grid]")) && typeof arguments[0] === 'object') {
			this.append($("<table />", {
				id:this.attr("id")
			})).addClass("r-grid").removeAttr("id");
			// add pager
			arguments[0].pager && this.append($("<div />" , {
				id : this.attr("id") + "-pager"
			})) && $.extend(arguments[0], {
				pager : this.attr("id") + "-pager",
				hidegrid:false
			});
			//add header
			var _colNames = arguments[0].colNames || [];
			arguments[0].colNames =  [];
			for(var col in arguments[0].colModel){
				arguments[0].colNames.push(_colNames[col] || arguments[0].colModel[col].header || arguments[0].colModel[col].name);
			}
			
			var resGrid =  _jqGrid.call(this.is("table") ? this : this.find("table"), arguments[0]);
			arguments[0].pager && resGrid.navGrid("#" + this.attr("id") + "-pager", {
				del:false,
				add:false,
				edit:false,
				search:false
			});
			return resGrid;
		}
		return _jqGrid.apply(this.is("table") ? this : this.find("table"),arguments);
	}
})(jQuery);
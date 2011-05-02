/**
 * override grid
 */
(function($){
    $.extend($.jgrid.defaults, {
        rowNum: 50,
        scroll: 1,
        hidegrid: false
    })
    var _jqGrid = $.fn.jqGrid;
    $.fn.jqGrid = function(){
        if (!arguments.length) {
            alert("argument error");
            return this;
        }
        
        if ((this.is("div") || !this.is("[role=grid]")) && typeof arguments[0] === 'object') {
			var id = this.attr("id");
            this.append($("<table />", {
                id: id
            })).addClass("r-grid").removeAttr("id");
            // add pager
            arguments[0].pager &&
            this.append($("<div />", {
                id: id + "-pager"
            })) &&
            $.extend(arguments[0], {
                pager: id + "-pager",
                hidegrid: false
            });
            
            var s = arguments[0];
            
            //add header
            var _colNames = s.colNames || [];
            s.colNames = [];
            for (var col in s.colModel) {
                s.colNames.push(_colNames[col] || s.colModel[col].header || s.colModel[col].name);
            }
            // add columns info
            s = $.extend({}, s, {
                postData: $.extend(s.postData || {}, {
                    columnParam: JSON.stringify(s.colModel, null),
                    groupCloumn: JSON.stringify(s.groupingView && s.groupingView.groupField || [], null)
                })
            });
            
            var resGrid = _jqGrid.call(this.is("table") ? this : this.find("table"), s);
            s.pager &&
            resGrid.navGrid("#" + id + "-pager", {
                del: false,
                add: false,
                edit: false,
                search: false
            });
            return resGrid;
        }
       // 
        return _jqGrid.apply(this.is("table") ? $(this) : $(this.find("table")), arguments);
    }
    $.extend($.fn.jqGrid,_jqGrid);
})(jQuery);
$.ajaxSetup({
   jsonp: null,
   jsonpCallback: null
});
//APIS
var API = {
    loadPage: function(href){
        var section = $("section")
        section.animate({
            opacity: 0.01
        }, 100, (function(loadHref){
            return function(){
                section.load(loadHref, function(){
					API.loadInit.call(section);
                    section.animate({
                        opacity: 1
                    }, 200);
                })
                
            }
        })(href));
    },
	
	loadInit : function(){
		var $this = $(this);
		$this.find("button").button();
	}
};


//first 
$(document).ready(function(){
    var section = $("section"), aside = $("aside");
    $("#nav  li > a").click(function(event){
        var $this = $(this), list = "", parent;
        if ($this.attr("href") && $this.attr("href") != "#" && !$this.parent().is(".current")) {
            $("#nav").find("li").removeClass("current");
            $this.parents("li").addClass("current");
            API.loadPage($this.attr("href"));
            do {
                list = (" <span>&gt;&gt;</span> " + $this.text() + list);
                $this = $this.parents("ul:first").siblings("a");
            }
            while ($this.size());
            list.replace("&gt;&gt;", "");
            aside.html(list);
        }
        event.preventDefault();
    });
});

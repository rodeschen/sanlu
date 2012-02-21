function checkError(xhr){
    if (xhr.responseText && xhr.responseText.indexOf("errorMessage:") == 0) {
        alert(xhr.responseText || "程式錯誤，請通知資訊人員!");
    }
    else 
        if (xhr.responseText && xhr.responseText.indexOf("sessionError") == 0) {
            alert("請重新登入");
            window.location.reload();
        }
        else {
            alert("程式錯誤，請通知資訊人員!");
        }
}
/**
 * override grid
 */
(function($){
    $.extend($.jgrid.defaults, {
        rowNum: 50,
        scroll: 1,
        hidegrid: false,
        datatype: "json",
        height: 100,
        rownumbers: true,
        mtype: 'POST',
        autowidth: true,
        forceFit: true,
        loadError: checkError
    });
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
                    groupCloumn: JSON.stringify(s.groupingView && s.groupingView.groupField || [], null),
                    mtype: "post"
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
    };
    $.extend($.fn.jqGrid, _jqGrid);
})(jQuery);



$.ajaxSetup({
    jsonp: null,
    jsonpCallback: null,
    type: "POST",
    error: checkError
});

$.extend($.fn, {
    //put下拉選單
    setDropdown: function(data, append){
        !append && this.html('') && this.append($('<option></option>'));
        var $this = this;
        $.each(data, function(value, data){
            if (typeof data === 'string') {
                $this.append($('<option></option>').val(value).text(data));
            }
            else {
                $this.append($('<option>', data));
            }
            
        });
        return this;
    },
    serializeData: function(){
        var res = {}, fields = this.find(":input,:disabled").serializeArray();
        $("#results").empty();
        $.each(fields, function(i, field){
            if (res[field.name]) {
                $.isArray(res[field.name]) ? res[field.name].push(field.value) : (res[field.name] = [field.value]);
            }
            else {
                res[field.name] = field.value;
            }
        });
        return res;
    },
    injectData: function(datas){
    
    }
});
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    showButtonPanel: true,
    showOn: "button",
    buttonImage: "/sanlu/images/calendar.gif",
    buttonImageOnly: true,
    showOn: 'both'
});

/**
 * override validationEngine
 */
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
    loadInit: function(){
        var $this = $(this);
        $this.find("button,.button").button();
        $this.find("form").each(function(){
            $(this).validationEngine({});
        })
        $this.find(".date").datepicker();
    },
    formSubmit: function(settings){
        settings = $.extend(true, {
            data: {},
            type: 'POST',
            url: "",
            target: "_target"
        }, settings || {});
        var obj = $('<form style="display:none" />');
        obj.attr({
            action: settings.url,
            target: settings.target,
            method: settings.type
        });
        for (var key in settings.data) {
            obj.append('<input type="hidden" name="' + key + '" id="' + key +
            '" value=\'' +
            settings.data[key] +
            '\' />');
        }
        $('body').append(obj);
        obj.submit();
        obj.empty().remove();
    },
    openCalendar: function(s){
        API.formSubmit({
            url: contextRoot + "/calendar",
            target: s.id + "calendar",
            data: $.extend(s.data || {}, {
                type: s.type,
                id: s.id
            })
        });
    },
    openProject: function(s){
        //debugger;
        API.formSubmit({
            url: contextRoot + "/project",
            target: s.id,
            data: $.extend(s.data || {}, {
                id: s.id
            })
        });
    }
};

//first
$(document).ready(function(){
    var section = $("section"), aside = $("aside"), exportDate = $("#exportDate");
    $("#nav  li > a").click(function(event){
        if ($(this).prop("id") == "logout") {
            return;
        }
        var $this = $(this), list = "", parent;
        if ($this.attr("href") && !/#/.test($this.attr("href")) && !$this.parent().is(".current")) {
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
    
    API.loadInit.call(document);
});

<%@ page import="tw.com.sanlu.Calendar" %>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="cmain" />
    <g:set var="entityName" value="${message(code: 'calendar.label', default: 'Calendar')}" /><title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        $(document).ready(function(){
            var view = "week";
            
            var DATA_FEED_URL = "php/datafeed.php";
            var op = {
                //view: view,
                theme: 3,
                showday: new Date(),
                EditCmdhandler: Edit,
                DeleteCmdhandler: Delete,
                ViewCmdhandler: View,
                onWeekOrMonthToDay: wtd,
                quickAddHandler: true,
                quickAddUrl: "add",
				quickUpdateUrl:"update",
				
                //onBeforeRequestData: cal_beforerequest,
                //onAfterRequestData: cal_afterrequest,
                onRequestDataError: cal_onerror
                // autoload:true,  
            };
            var $dv = $("#calhead");
            var _MH = document.documentElement.clientHeight;
            var dvH = $dv.height() + 2;
            op.height = 600;
            op.eventItems = [];
            
            var p = $("#gridcontainer").bcalendar(op).BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
            $("#caltoolbar").noSelect();
            
            $("#hdtxtshow").datepicker({
                picker: "#txtdatetimeshow",
                showtarget: $("#txtdatetimeshow"),
                onReturn: function(r){
                    var p = $("#gridcontainer").gotoDate(r).BcalGetOp();
                    if (p && p.datestrshow) {
                        $("#txtdatetimeshow").text(p.datestrshow);
                    }
                }
            });
            function cal_beforerequest(type){
                var t = "Loading data...";
                switch (type) {
                    case 1:
                        t = "Loading data...";
                        break;
                    case 2:
                    case 3:
                    case 4:
                        t = "The request is being processed ...";
                        break;
                }
                $("#errorpannel").hide();
                $("#loadingpannel").html(t).show();
            }
            function cal_afterrequest(type){
                switch (type) {
                    case 1:
                        $("#loadingpannel").hide();
                        break;
                    case 2:
                    case 3:
                    case 4:
                        $("#loadingpannel").html("Success!");
                        window.setTimeout(function(){
                            $("#loadingpannel").hide();
                        }, 2000);
                        break;
                }
                
            }
            function cal_onerror(type, data){
                $("#errorpannel").show();
            }
            function Edit(data){
                var eurl = "edit.php?id={0}&start={2}&end={3}&isallday={4}&title={1}";
                if (data) {
                    var url = StrFormat(eurl, data);
                    OpenModelWindow(url, {
                        width: 600,
                        height: 400,
                        caption: "Manage  The Calendar",
                        onclose: function(){
                            $("#gridcontainer").reload();
                        }
                    });
                }
            }
            function View(data){
                var str = "";
                $.each(data, function(i, item){
                    str += "[" + i + "]: " + item + "\n";
                });
                alert(str);
            }
            function Delete(data, callback){
            
                $.alerts.okButton = "Ok";
                $.alerts.cancelButton = "Cancel";
                hiConfirm("Are You Sure to Delete this Event", 'Confirm', function(r){
                    r && callback(0);
                });
            }
            function wtd(p){
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
                $("#caltoolbar div.fcurrent").each(function(){
                    $(this).removeClass("fcurrent");
                })
                $("#showdaybtn").addClass("fcurrent");
            }
            //to show day view
            $("#showdaybtn").click(function(e){
                //document.location.href="#day";
                $("#caltoolbar div.fcurrent").each(function(){
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").swtichView("day").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            //to show week view
            $("#showweekbtn").click(function(e){
                //document.location.href="#week";
                $("#caltoolbar div.fcurrent").each(function(){
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").swtichView("week").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
                
            });
            //to show month view
            $("#showmonthbtn").click(function(e){
                //document.location.href="#month";
                $("#caltoolbar div.fcurrent").each(function(){
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").swtichView("month").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            
            $("#showreflashbtn").click(function(e){
                $("#gridcontainer").reload();
            });
            
            //Add a new event
            $("#faddbtn").click(function(e){
                var url = "edit.php";
                OpenModelWindow(url, {
                    width: 500,
                    height: 400,
                    caption: "Create New Calendar"
                });
            });
            //go to today
            $("#showtodaybtn").click(function(e){
                var p = $("#gridcontainer").gotoDate().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
                
                
            });
            //previous date range
            $("#sfprevbtn").click(function(e){
                var p = $("#gridcontainer").previousRange().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
                
            });
            //next date range
            $("#sfnextbtn").click(function(e){
                var p = $("#gridcontainer").nextRange().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            $("button").button();
        });
    </script>
    </head>
    <body>
        <div class="body" style="width:1000px;height:400px;position:relative">
          <div>

      <div id="calhead" style="padding-left:1px;padding-right:1px;">          
            <div class="cHead"><div class="ftitle">My Calendar</div>
            <div id="loadingpannel" class="ptogtitle loadicon" style="display: none;">資料讀取中...</div>
             <div id="errorpannel" class="ptogtitle loaderror" style="display: none;">資料讀取錯誤!!!</div>
            </div>          
            
            <div id="caltoolbar" class="ctoolbar">
              <div id="faddbtn" class="fbutton">
                <div><span title='Click to Create New Event' class="addcal">

                New Event                
                </span></div>
            </div>
            <div class="btnseparator"></div>
             <div id="showtodaybtn" class="fbutton">
                <div><span title='Click to back to today ' class="showtoday">
                Today</span></div>
            </div>
              <div class="btnseparator"></div>

            <div id="showdaybtn" class="fbutton">
                <div><span title='Day' class="showdayview">Day</span></div>
            </div>
              <div  id="showweekbtn" class="fbutton fcurrent">
                <div><span title='Week' class="showweekview">Week</span></div>
            </div>
              <div  id="showmonthbtn" class="fbutton">
                <div><span title='Month' class="showmonthview">Month</span></div>

            </div>
            <div class="btnseparator"></div>
              <div  id="showreflashbtn" class="fbutton">
                <div><span title='Refresh view' class="showdayflash">Refresh</span></div>
                </div>
             <div class="btnseparator"></div>
            <div id="sfprevbtn" title="Prev"  class="fbutton">
              <span class="fprev"></span>

            </div>
            <div id="sfnextbtn" title="Next" class="fbutton">
                <span class="fnext"></span>
            </div>
            <div class="fshowdatep fbutton">
                    <div>
                        <input type="hidden" name="txtshow" id="hdtxtshow" />
                        <span id="txtdatetimeshow">Loading</span>

                    </div>
            </div>
            
            <div class="clear"></div>
            </div>
      </div>
      <div style="padding:1px;">

        <div class="t1 chromeColor">
            &nbsp;</div>
        <div class="t2 chromeColor">
            &nbsp;</div>
        <div id="dvCalMain" class="calmain printborder">
            <div id="gridcontainer" style="overflow-y: visible;">
            </div>
        </div>
        <div class="t2 chromeColor">

            &nbsp;</div>
        <div class="t1 chromeColor">
            &nbsp;
        </div>   
        </div>
     
  </div>
        </div>
        <div style="display:none" >
        <div id="ckbub">
    <table cellspacing="0" cellpadding="0" class="cb-table">
    <tbody><tr><th class="cb-key">時間:</th><td class="cb-value"><div id="bbit-cal-buddle-timeshow"></div>
    <div>
    <select id="cal-start-year" style="text-align:right"><g:each var="i" in="${(2021..1999)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>年 
    <select id="cal-start-month" style="text-align:right"><g:each var="i" in="${(1..12)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>月
    <select id="cal-start-day" style="text-align:right"><g:each var="i" in="${(1..31)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>日 
    <select id="cal-start-hour" style="text-align:right"><g:each var="i" in="${(00..23)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>
    <select id="cal-start-min" style="text-align:right"><g:each var="i" in="${(00..5)}"><option value="<%="${i*10}"%>"><%="${i*10}"%></option></g:each></select>
    </div>
    <div>
    <select id="cal-end-year" style="text-align:right;"><g:each var="i" in="${(2021..1999)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>年
    <select id="cal-end-month" style="text-align:right"><g:each var="i" in="${(1..12)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>月
    <select id="cal-end-day" style="text-align:right"><g:each var="i" in="${(1..31)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>日 
    <select id="cal-end-hour" style="text-align:right"><g:each var="i" in="${(00..23)}"><option value="<%="${i}"%>"><%="${i}"%></option></g:each></select>
    <select id="cal-end-min" style="text-align:right"><g:each var="i" in="${(00..5)}"><option value="<%="${i*10}"%>"><%="${i*10}"%></option></g:each></select>
    </div></td></tr>
    </tbody>
    </table>
    <div id="cltabs" style="width:550px">
     <ul class="ctabs">
         <li><a href="#tabs-1"><span>第一類</span></a></li>
         <li><a href="#tabs-2"><span>第二類</span></a></li>
         <li><a href="#tabs-3"><span>第三類</span></a></li>
     </ul>
     <div id="tabs-1">
		sddd
	</div>
	<div id="tabs-2">
		adsfasdf
	</div>
	<div id="tabs-3">
		dsaf
	</div>
</div>
<div style="margin-top:10px"><input id="bbit-cal-start" type="hidden"/><input id="bbit-cal-end" type="hidden"/><input id="bbit-cal-allday" type="hidden"/>
	<button type="button" id="caladd">建立</button>
	</div>
</div>
    </div>
    
    </body>
    
</html>
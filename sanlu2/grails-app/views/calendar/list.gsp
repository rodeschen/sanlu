<%@ page import="tw.com.sanlu.Calendar" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="cmain" />
        <g:set var="entityName" value="${message(code: 'calendar.label', default: 'Calendar')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
	    <script type="text/javascript">
    $(document).ready(function() {     
        var view="week";          
        
         var DATA_FEED_URL = "php/datafeed.php";
         var op = {
             view: view,
             theme:3,
             showday: new Date(),
             EditCmdhandler:Edit,
             DeleteCmdhandler:Delete,
             ViewCmdhandler:View,    
             onWeekOrMonthToDay:wtd,
             quickAddHandler:function(param){
                 alert("xx");
                 },
             //onBeforeRequestData: cal_beforerequest,
             //onAfterRequestData: cal_afterrequest,
             onRequestDataError: cal_onerror, 
            // autoload:true,  
         };
         var $dv = $("#calhead");
         var _MH = document.documentElement.clientHeight;
         var dvH = $dv.height() + 2;
         op.height = 400;
         op.eventItems =[];

         var p = $("#gridcontainer").bcalendar(op).BcalGetOp();
         if (p && p.datestrshow) {
             $("#txtdatetimeshow").text(p.datestrshow);
         }
         $("#caltoolbar").noSelect();
         
         $("#hdtxtshow").datepicker({ picker: "#txtdatetimeshow", showtarget: $("#txtdatetimeshow"),
         onReturn:function(r){                          
                         var p = $("#gridcontainer").gotoDate(r).BcalGetOp();
                         if (p && p.datestrshow) {
                             $("#txtdatetimeshow").text(p.datestrshow);
                         }
                  } 
         });
         function cal_beforerequest(type)
         {
             var t="Loading data...";
             switch(type)
             {
                 case 1:
                     t="Loading data...";
                     break;
                 case 2:                      
                 case 3:  
                 case 4:    
                     t="The request is being processed ...";                                   
                     break;
             }
             $("#errorpannel").hide();
             $("#loadingpannel").html(t).show();    
         }
         function cal_afterrequest(type)
         {
             switch(type)
             {
                 case 1:
                     $("#loadingpannel").hide();
                     break;
                 case 2:
                 case 3:
                 case 4:
                     $("#loadingpannel").html("Success!");
                     window.setTimeout(function(){ $("#loadingpannel").hide();},2000);
                 break;
             }              
            
         }
         function cal_onerror(type,data)
         {
             $("#errorpannel").show();
         }
         function Edit(data)
         {
            var eurl="edit.php?id={0}&start={2}&end={3}&isallday={4}&title={1}";   
             if(data)
             {
                 var url = StrFormat(eurl,data);
                 OpenModelWindow(url,{ width: 600, height: 400, caption:"Manage  The Calendar",onclose:function(){
                    $("#gridcontainer").reload();
                 }});
             }
         }    
         function View(data)
         {
             var str = "";
             $.each(data, function(i, item){
                 str += "[" + i + "]: " + item + "\n";
             });
             alert(str);               
         }    
         function Delete(data,callback)
         {           
             
             $.alerts.okButton="Ok";  
             $.alerts.cancelButton="Cancel";  
             hiConfirm("Are You Sure to Delete this Event", 'Confirm',function(r){ r && callback(0);});           
         }
         function wtd(p)
         {
            if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }
             $("#caltoolbar div.fcurrent").each(function() {
                 $(this).removeClass("fcurrent");
             })
             $("#showdaybtn").addClass("fcurrent");
         }
         //to show day view
         $("#showdaybtn").click(function(e) {
             //document.location.href="#day";
             $("#caltoolbar div.fcurrent").each(function() {
                 $(this).removeClass("fcurrent");
             })
             $(this).addClass("fcurrent");
             var p = $("#gridcontainer").swtichView("day").BcalGetOp();
             if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }
         });
         //to show week view
         $("#showweekbtn").click(function(e) {
             //document.location.href="#week";
             $("#caltoolbar div.fcurrent").each(function() {
                 $(this).removeClass("fcurrent");
             })
             $(this).addClass("fcurrent");
             var p = $("#gridcontainer").swtichView("week").BcalGetOp();
             if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }

         });
         //to show month view
         $("#showmonthbtn").click(function(e) {
             //document.location.href="#month";
             $("#caltoolbar div.fcurrent").each(function() {
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
         $("#faddbtn").click(function(e) {
             var url ="edit.php";
             OpenModelWindow(url,{ width: 500, height: 400, caption: "Create New Calendar"});
         });
         //go to today
         $("#showtodaybtn").click(function(e) {
             var p = $("#gridcontainer").gotoDate().BcalGetOp();
             if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }


         });
         //previous date range
         $("#sfprevbtn").click(function(e) {
             var p = $("#gridcontainer").previousRange().BcalGetOp();
             if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }

         });
         //next date range
         $("#sfnextbtn").click(function(e) {
             var p = $("#gridcontainer").nextRange().BcalGetOp();
             if (p && p.datestrshow) {
                 $("#txtdatetimeshow").text(p.datestrshow);
             }
         });
         
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
        <div class="display:none" >
    <table cellspacing="0" cellpadding="0" class="cb-table">
    <tbody><tr><th class="cb-key">時間:</th><td class="cb-value"><div id="bbit-cal-buddle-timeshow"></div></td></tr>
    </tbody>
    </table>
    
    </div>
    </body>
    
</html>

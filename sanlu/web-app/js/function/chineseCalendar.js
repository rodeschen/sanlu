
/* 求此西曆年是否為閏年, 返回 0 為平年, 1 為閏年 */
function GetLeap( year ) {
	if ( year % 400 == 0 )
		return 1;
	else if ( year % 100 == 0 )
		return 0;
	else if ( year % 4 == 0 )
		return 1;
	else
		return 0;
}

function tagLunarCal( d, i, w, k, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13) {
	this.BaseDays = d; /* 到西曆 1 月 1 日到農曆正月初一的累積日數 */
	this.Intercalation = i; /* 閏月月份. 0==此年沒有閏月 */
	this.BaseWeekday = w; /* 此年西曆 1 月 1 日為星期幾再減 1 */
	this.BaseKanChih = k; /* 此年西曆 1 月 1 日之干支序號減 1 */
	this.MonthDays = [ m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13 ]; /* 此農曆年每月之大小, 0==小月(29日), 1==大月(30日) */
}

var LunarCal = [
new tagLunarCal( 27, 5, 3, 43, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1 ),
new tagLunarCal( 46, 0, 4, 48, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1 ), /* 1999 */
new tagLunarCal( 35, 0, 5, 53, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1 ), /* 2000 */
new tagLunarCal( 23, 4, 0, 59, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1 ),
new tagLunarCal( 42, 0, 1, 4, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1 ),
new tagLunarCal( 31, 0, 2, 9, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0 ),
new tagLunarCal( 21, 2, 3, 14, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1 ), /* 2004 */
new tagLunarCal( 39, 0, 5, 20, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1 ),
new tagLunarCal( 28, 7, 6, 25, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1 ),
new tagLunarCal( 48, 0, 0, 30, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1 ),
new tagLunarCal( 37, 0, 1, 35, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1 ), /* 2008 */
new tagLunarCal( 25, 5, 3, 41, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1 ),
new tagLunarCal( 44, 0, 4, 46, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1 ),
new tagLunarCal( 33, 0, 5, 51, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1 ),
new tagLunarCal( 22, 4, 6, 56, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 ), /* 2012 */
new tagLunarCal( 40, 0, 1, 2, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 ),
new tagLunarCal( 30, 9, 2, 7, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 ),
new tagLunarCal( 49, 0, 3, 12, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1 ),
new tagLunarCal( 38, 0, 4, 17, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0 ), /* 2016 */
new tagLunarCal( 27, 6, 6, 23, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1 ),
new tagLunarCal( 46, 0, 0, 28, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0 ),
new tagLunarCal( 35, 0, 1, 33, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0 ),
new tagLunarCal( 24, 4, 2, 38, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1 ), /* 2020 */
new tagLunarCal( 42, 0, 4, 44, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ),
new tagLunarCal( 31, 0, 5, 49, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0 ),
new tagLunarCal( 21, 2, 6, 54, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 ),
new tagLunarCal( 40, 0, 0, 59, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1 ), /* 2024 */
new tagLunarCal( 28, 6, 2, 5, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0 ),
new tagLunarCal( 47, 0, 3, 10, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1 ),
new tagLunarCal( 36, 0, 4, 15, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1 ),
new tagLunarCal( 25, 5, 5, 20, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0 ), /* 2028 */
new tagLunarCal( 43, 0, 0, 26, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1 ),
new tagLunarCal( 32, 0, 1, 31, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0 ),
new tagLunarCal( 22, 3, 2, 36, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0 ) ];

/* 西曆年每月之日數 */
var SolarCal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

/* 西曆年每月之累積日數, 平年與閏年 */
var SolarDays = [
0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365, 396,
0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366, 397 ];

var AnimalIdx = ["馬 ", "羊 ", "猴 ", "雞 ", "狗 ", "豬 ", "鼠 ", "牛 ", "虎 ", "兔 ", "龍 ", "蛇 " ];
var LocationIdx = [ "南", "東", "北", "西" ];

function CalConv(date) {
	if(!(date instanceof Date))
		return "";
	FIRSTYEAR = 1998;
	LASTYEAR = 2031;

	SolarYear = date.getFullYear();
	SolarMonth = date.getMonth() + 1;
	SolarDate = date.getDate();
	Weekday = date.getDay();

	if ( SolarYear <= FIRSTYEAR || SolarYear > LASTYEAR )
		return 1;

	sm = SolarMonth - 1;

	if ( sm < 0 || sm > 11 )
		return 2;

	leap = GetLeap( SolarYear );

	if ( sm == 1 )
		d = leap + 28;
	else
		d = SolarCal[sm];

	if ( SolarDate < 1 || SolarDate > d )
		return 3;

	y = SolarYear - FIRSTYEAR;
	acc = SolarDays[ leap*14 + sm ] + SolarDate;
	kc = acc + LunarCal[y].BaseKanChih;
	Kan = kc % 10;
	Chih = kc % 12;
	Location = LocationIdx[kc % 4];
	Age = kc % 60;
	if ( Age < 22 )
		Age = 22 - Age;
	else
		Age = 82 - Age;

	Age =Age + 3;

	if (Age < 10)
		Age=Age+60;

	Animal = AnimalIdx[ Chih ];

	if ( acc <= LunarCal[y].BaseDays ) {
		y--;
		LunarYear = SolarYear - 1;
		leap = GetLeap( LunarYear );
		sm += 12;
		acc = SolarDays[leap*14 + sm] + SolarDate;
	} else
		LunarYear = SolarYear;

	l1 = LunarCal[y].BaseDays;
	for ( i=0; i<13; i++ ) {
		l2 = l1 + LunarCal[y].MonthDays[i] + 29;
		if ( acc <= l2 )
			break;
		l1 = l2;
	}

	LunarMonth = i + 1;
	LunarDate = acc - l1;
	im = LunarCal[y].Intercalation;

	if ( im != 0 && LunarMonth > im ) {
		LunarMonth--;
		if ( LunarMonth == im )
			LunarMonth = -im;
	}

	if ( LunarMonth > 12 )
		LunarMonth -= 12;
	return {
		date : SolarYear + "/" + SolarMonth + "/" + SolarDate,
		chDate : LunarMonth +"/" + LunarDate,
		chDay : LunarDate,
		bad :  "煞" + Location + "-沖" + Animal + Age + "歲"
	}
	//document.write( "<font size=2 color='ff00ff'>【今天 西元 " + SolarYear + "年" + SolarMonth + "月" + SolarDate + "日 -- " );
	//document.write( "農曆 " + LunarMonth + "月 " + LunarDate + "日 -- " );

	//document.write( "煞" + Location + " -- 沖" + Animal + Age + " 歲】</font>" );

	//return 0;
}

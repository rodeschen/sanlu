package tw.com.sanlu
import grails.converters.JSON

import java.io.File
import java.util.Calendar

import jxl.*
import jxl.write.*
import tw.com.sanlu.excel.ExcelUtility

class ExcelController extends BaseController {
	def WorkbookSettings settings = new WorkbookSettings();
	def index = {
		settings.setWriteAccess(null);
	}

	//品項代叫報表
	def agency = {
		// create our workbook and sheet

		String fileName = "品項代叫記錄-"+params.exportYear+"-"+params.exportMonth+".xls";

		def file = new File(ExcelUtility.REPORT_PATH+"/品項代叫記錄-"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/品項代叫記錄.xls").inputStream),settings)
		try{
			def sheet = workbook.getSheet(0)
			def cal = Calendar.instance
			cal.set params.int("exportYear"), params.int("exportMonth")-1, 00
			def cal2 = Calendar.instance
			cal2.set params.int("exportYear"), params.int("exportMonth"), 00

			def products = Product.findAllByProductType(2)
			def criteria = ProductHistory.createCriteria()
			def productHistorys = criteria {
				and {
					eq("isPurchase", false)
					between("date", cal.getTime(), cal2.getTime())
					'in'("product",products)
				}
				order("date", "asc")
			}
			def r = 2
			//title
			sheet.addCell(new Label(0, 0,params.exportMonth + sheet.getCell(0,0).getContents(),new WritableCellFormat(sheet.getCell(0, 0).getCellFormat())))
			WritableCellFormat wFormat = new WritableCellFormat(sheet.getCell(0, r).getCellFormat())
			productHistorys.each() {
				// write out our header

				//日期
				sheet.addCell(new Label(0, r,it.date?.format("yyyy-MM-dd"),wFormat))
				//品項
				sheet.addCell(new Label(1, r,it.product.productName,wFormat))
				//數量
				sheet.addCell(new Label(2, r,((int)it.quantity).toString(),wFormat))
				//案名
				sheet.addCell(new Label(3, r,it.project?.projectName,wFormat))
				//禮儀公司
				sheet.addCell(new Label(4, r,it.project?.funeralCompany.funeralCompanyName,wFormat))
				//執行人員
				sheet.addCell(new Label(5, r,it.lastModifyBy.empName,wFormat))
				//廠商
				sheet.addCell(new Label(6, r,it.vendor,wFormat))
				r++
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			// close
			workbook.write()
			workbook.close()
		}


		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")
		//response.setContentType("application/vnd.ms-excel")

		response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))

		response.outputStream << file.newInputStream()
	}

	//商品提出明細
	def productSale = {
		// create our workbook and sheet
		def file = new File(ExcelUtility.REPORT_PATH+"/商品提出明細-"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/商品提出明細.xls").inputStream),settings)
		try{
			def sheet = workbook.getSheet(0)
			def cal = Calendar.instance
			cal.set params.int("exportYear"), params.int("exportMonth")-1, 00
			def cal2 = Calendar.instance
			cal2.set params.int("exportYear"), params.int("exportMonth"), 00

			def products = Product.findAllByProductType(0)
			def criteria = ProductHistory.createCriteria()
			def productHistorys = criteria {
				and {
					eq("isPurchase", false)
					between("date", cal.getTime(), cal2.getTime())
					'in'("product",products)
				}
				order("date", "asc")
			}
			def r = 2

			WritableCellFormat wFormat = new WritableCellFormat(sheet.getCell(0, r).getCellFormat())
			productHistorys.each() {
				// write out our header

				//日期
				sheet.addCell(new Label(0, r,it.date?.format("yyyy-MM-dd"),wFormat))
				//品項
				sheet.addCell(new Label(1, r,it.product.productName,wFormat))
				//數量
				sheet.addCell(new Label(2, r,((int)it.quantity).toString(),wFormat))
				//案名
				sheet.addCell(new Label(3, r,it.project?.projectName,wFormat))
				//禮儀公司
				sheet.addCell(new Label(4, r,it.project?.funeralCompany?.funeralCompanyName,wFormat))
				//執行人員
				sheet.addCell(new Label(5, r,it.lastModifyBy.empName,wFormat))
				//備註
				sheet.addCell(new Label(6, r,it.memo,wFormat))
				r++
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			// close
			workbook.write()
			workbook.close()
		}


		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")
		//response.setContentType("application/vnd.ms-excel")

		response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))

		response.outputStream << file.newInputStream()
	}

	//商品日執行表
	def productDaily = {
		// create our workbook and sheet
		def product = Product.findById(params.productId)

		def cal = Calendar.instance
		def file = new File(ExcelUtility.REPORT_PATH+"/日執行表_"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/日執行表.xls").inputStream),settings)
		try{
			def sheet = workbook.getSheet(0)
			cal.set params.int("exportYear"), params.int("exportMonth")-1, 00
			def cal2 = Calendar.instance
			cal2.set params.int("exportYear"), params.int("exportMonth"), 00

			def criteria = ProductHistory.createCriteria()
			def productHistorys = criteria {
				and {
					eq("isPurchase", false)
					between("date", cal.getTime(), cal2.getTime())
					eq("product",product)
				}
				order("date", "asc")
			}
			def r = 2

			WritableCellFormat wFormat = new WritableCellFormat(sheet.getCell(0, r).getCellFormat())
			//title
			sheet.addCell(new Label(0, 0,params.exportMonth + sheet.getCell(0,0).getContents(),new WritableCellFormat(sheet.getCell(0, 0).getCellFormat())))
			sheet.addCell(new Label(3, 0,product.productName + sheet.getCell(3,0).getContents(),new WritableCellFormat(sheet.getCell(3, 0).getCellFormat())))
			productHistorys.each() {
				// write out our header
				//日期
				sheet.addCell(new Label(0, r,it.date?.format("yyyy-MM-dd"),wFormat))
				//數量
				sheet.addCell(new Label(1, r,((int)it.quantity).toString(),wFormat))
				//案名
				sheet.addCell(new Label(2, r,it.project?.projectName,wFormat))
				//禮儀公司
				sheet.addCell(new Label(3, r,it.project?.funeralCompany?.funeralCompanyName,wFormat))
				//執行人員
				sheet.addCell(new Label(4, r,it.lastModifyBy.empName,wFormat))
				//備註
				sheet.addCell(new Label(5, r,it.memo,wFormat))
				r++
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			// close
			workbook.write()
			workbook.close()
		}


		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")

		response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))

		response.outputStream << file.newInputStream()
	}

	//產出帳單
	def internalBill = {
		def project = Project.findById(params.projectId)
		def criteria = BillDetail.createCriteria()
		def billDetails = criteria.list {
			and {
				eq("showBill",true)
				eq("project",project)
			}
			projections {  distinct("product") }
			order("startTime", "asc")
		}
		if(project){
			def cal = Calendar.instance
			def file = new File(ExcelUtility.BILL_PATH+"/"+ project.projectName + "-" +cal.getTime().format("yyyy-MM-dd")+"-"+project.funeralCompany.funeralCompanyName+".xls")
			// create our workbook and sheet
			def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/bill.xls").inputStream),settings)

			try{
				def sheet = workbook.getSheet(0)
				sheet.getSettings().setProtected(true);
				def parameter = Parameters.findByType("excelPassword")
				sheet.getSettings().setPassword(parameter.value);

				//單數format
				WritableCellFormat oddFormat = new WritableCellFormat(sheet.getCell(0, 6).getCellFormat())
				oddFormat.setWrap(true)
				//雙數format
				WritableCellFormat evenFormat = new WritableCellFormat(sheet.getCell(0, 7).getCellFormat())
				evenFormat.setWrap(true)

				// write out our header

				//日期
				sheet.addCell(new Label(4, 1,Utility.dateFormat.format(project.closingDate),new WritableCellFormat(sheet.getCell(4,1).getCellFormat())))
				//案號
				sheet.addCell(new Label(2, 1,project.projectNo,new WritableCellFormat(sheet.getCell(2,1).getCellFormat())))
				//承辦人
				sheet.addCell(new Label(8,0,project.emp.empName,new WritableCellFormat(sheet.getCell(8, 0).getCellFormat())))

				//查核人
				sheet.addCell(new Label(11,0,"陳俊霖",new WritableCellFormat(sheet.getCell(11, 0).getCellFormat())))
				//案名
				sheet.addCell(new Label(2, 2,project.projectName,new WritableCellFormat(sheet.getCell(2,2).getCellFormat())))
				//禮儀公司
				sheet.addCell(new Label(4, 2,project.funeralCompany.funeralCompanyName,new WritableCellFormat(sheet.getCell(4,2).getCellFormat())))
				//禮儀師
				sheet.addCell(new Label(11, 2,project.funeraler.funeralerName,new WritableCellFormat(sheet.getCell(11,2).getCellFormat())))

				def count = 1
				def row = 6
				//代叫供品明細：
				def isAgencyTmp = ""
				//提出商品明細：
				def notAgencyTmp = ""
				
				billDetails.each() {

					//def productBills = BillDetail.findAllByProjectAndProductAndShowBill(project,it,true)
					def productBills = BillDetail.findAllWhere(project:project, product:it,showBill:true)
					if(productBills){
						//合併欄位
						sheet.mergeCells(2, row, 3, row);

						//序號
						sheet.addCell(new Label(0, row,count.toString(),count%2!=0?oddFormat:evenFormat))
						//項目
						sheet.addCell(new Label(1, row,it.productName,count%2!=0?oddFormat:evenFormat))
						if(it.productType == 2){
							//代叫供品明細：
							isAgencyTmp+=it.productName + "，"
						}else if(!it.hasPlace){
							//提出商品明細：
							notAgencyTmp+=it.productName + "，"
						}
						def amount = 0;
						def modifiedPrice,modifiedCostPrice,amountReceivable=0,amountCostReceivable=0
						switch(it.costUnit){
							//計價單位類別  0:次
							case "0":
								def tmp = ""
								def place = ""
								productBills.each(){
									if(it.place&&"".equals(place)){
										place = (it.place?"("+it.place.placeName+")":"")
									}
									tmp +=(it.startTime.toCalendar().get(Calendar.MONTH)+1)+"/"+it.startTime.toCalendar().get(Calendar.DATE)+"，"
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									modifiedCostPrice = it.modifiedInternalPrice
									amountReceivable += it.quantity *it.product.costRange * modifiedPrice
									amountCostReceivable +=it.quantity *it.product.costRange * modifiedCostPrice
								}
								tmp = tmp.endsWith("，")?tmp.substring(0, tmp.length()-1):tmp
								sheet.addCell(new Label(2, row,tmp+ place,count%2!=0?oddFormat:evenFormat))
							//次數
								sheet.addCell(new Label(4, row,((int)amount).toString(),count%2!=0?oddFormat:evenFormat))
								break
							case "2":
								def tmpHour =""

								productBills.each(){
									tmpHour += (""==tmpHour?"":";") + Utility.monthDateFormat.format(it.startTime) + (it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"")+ (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									modifiedCostPrice = it.modifiedInternalPrice
									amountReceivable += it.quantity *it.product.costRange * modifiedPrice
									amountCostReceivable +=it.quantity *it.product.costRange * modifiedCostPrice
								}
							//2:區間(時)
								sheet.addCell(new Label(2, row,tmpHour ,count%2!=0?oddFormat:evenFormat))
							//次數
								sheet.addCell(new Label(4, row,((int)amount).toString(),count%2!=0?oddFormat:evenFormat))
								break
							case "3":
								def tmpDay =""
								productBills.each(){
									tmpDay += (""==tmpDay?"":";") + Utility.monthDateFormat.format(it.startTime) + (it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"")+ (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									modifiedCostPrice = it.modifiedInternalPrice
									amountReceivable += it.quantity *it.product.costRange * modifiedPrice
									amountCostReceivable +=it.quantity *it.product.costRange * modifiedCostPrice
								}
							//3:區間(天)
								sheet.addCell(new Label(2, row,tmpDay,count%2!=0?oddFormat:evenFormat))
							//次數
								sheet.addCell(new Label(4, row,((int)amount).toString(),count%2!=0?oddFormat:evenFormat))
								break
							case "4":
								def tmpMonth =""
								productBills.each(){
									tmpMonth += (""==tmpMonth?"":";") + Utility.monthDateFormat.format(it.startTime) + (it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"")+ (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									modifiedCostPrice = it.modifiedInternalPrice
									amountReceivable += it.quantity *it.product.camountReceivable
									amountCostReceivable +=it.quantity *it.product.costRange * modifiedCostPrice
								}
							//4:區間(月)
								sheet.addCell(new Label(2, row,tmpMonth,count%2!=0?oddFormat:evenFormat))
							//次數
								sheet.addCell(new Label(4, row,((int)amount).toString(),count%2!=0?oddFormat:evenFormat))
								break
						}
						//顯示單位
						sheet.addCell(new Label(5, row,it.unit,count%2!=0?oddFormat:evenFormat))
						//單價
						sheet.addCell(new Label(6, row,((int)modifiedPrice).toString(),count%2!=0?oddFormat:evenFormat))
						//應收金額
						//sheet.addCell(new Formula(7, row, "E"+(row+1)+"*G"+(row+1),count%2!=0?oddFormat:evenFormat))
						sheet.addCell(new Number(7, row, (int)amountReceivable,count%2!=0?oddFormat:evenFormat))
						//減號
						sheet.addCell(new Label(8, row, "─",count%2!=0?oddFormat:evenFormat))
						//成本單價
						sheet.addCell(new Label(9, row,((int)modifiedCostPrice).toString(),count%2!=0?oddFormat:evenFormat))
						//實收金額
						//sheet.addCell(new Formula(10, row, "E"+(row+1)+"*J"+(row+1),count%2!=0?oddFormat:evenFormat))
						sheet.addCell(new Number(10, row, (int)amountCostReceivable,count%2!=0?oddFormat:evenFormat))
						//等號
						sheet.addCell(new Label(11, row, "=",count%2!=0?oddFormat:evenFormat))
						//折讓金額
						sheet.addCell(new Formula(12, row, "H"+(row+1)+"-K"+(row+1),count%2!=0?oddFormat:evenFormat))
						row++
					}
					count++
				}
				//表尾

				def totalRow = row
				WritableFont writableFont = new WritableFont(WritableFont.ARIAL,12);
				WritableCellFormat wcf = new WritableCellFormat(writableFont);
				wcf.setBackground(format.Colour.CORAL);
				wcf.setAlignment(format.Alignment.CENTRE);
				//未稅合計
				sheet.mergeCells 0, row, 6, row
				sheet.addCell(new Label(0, row, "未稅合計",wcf))
				//應收金額合計
				sheet.addCell(new Formula(7, row, "SUM(H7:H"+row+")",wcf))
				//減號
				sheet.addCell(new Label(8, row, "─",wcf))
				//成本單價
				sheet.addCell(new Label(9, row, " ",wcf))
				//實收金額
				sheet.addCell(new Formula(10, row, "SUM(K7:K"+row+")",wcf))
				//等號
				sheet.addCell(new Label(11, row, "=",wcf))
				//折讓金額
				sheet.addCell(new Formula(12, row, "H"+(row+1)+"-K"+(row+1),wcf))
				row++
				WritableCellFormat wcf2 = new WritableCellFormat(writableFont);
				wcf2.setVerticalAlignment format.VerticalAlignment.TOP
				wcf2.setWrap(true);
				//以上報價未稅，如需發票另計 5%。=
				sheet.mergeCells 0, row, 2, row
				sheet.addCell(new Label(0, row, "以上報價未稅，如需發票另計 5%=	",wcf2))
				//含稅
				sheet.addCell(new Formula(3, row, "ROUNDUP(H"+row+"*0.05,0)",wcf2))
				//代叫供品明細：
				sheet.mergeCells 4, row, 6, row+2
				sheet.addCell(new Label(4, row, "代叫供品明細：",wcf2))
				sheet.mergeCells 7, row, 12, row+2
				isAgencyTmp = isAgencyTmp.endsWith("，")?isAgencyTmp.substring(0, isAgencyTmp.length()-1):isAgencyTmp
				notAgencyTmp = notAgencyTmp.endsWith("，")?notAgencyTmp.substring(0, notAgencyTmp.length()-1):notAgencyTmp

				sheet.addCell(new Label(7, row, isAgencyTmp,wcf2))
				row+=2
				//應  收  金  額    ┼   5%  稅  金    =
				sheet.mergeCells 0, row, 2, row
				sheet.addCell(new Label(0, row, "應  收  金  額    ┼   5%  稅  金    =		",wcf2))
				//含稅金額
				sheet.addCell(new Formula(3, row, "H"+(totalRow+1)+"+D"+(totalRow+2),wcf2))
				row++
				//提出商品明細：
				sheet.mergeCells 4, row, 6, row+2
				sheet.addCell(new Label(4, row, "提出商品明細：",wcf2))
				sheet.mergeCells 7, row, 12, row+2
				sheet.addCell(new Label(7, row, notAgencyTmp,wcf2))
			}
			catch(Exception e){
				e.printStackTrace();
			}finally{
				// close
				workbook.write()
				workbook.close()
			}

			//def file = new File("addr.xls")
			response.setContentType("application/octet-stream")

			//response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")
			response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))
			response.outputStream << file.newInputStream()
		}
	}

	def bill = {
		//def billDetails = BillDetail.findAllByProject(params.projectId)
		def project = Project.findById(params.projectId)
		def criteria = BillDetail.createCriteria()
		def billDetails = criteria.list {
			eq("project",project)
			projections { //groupProperty("product")
				distinct("product") }
			order("startTime", "asc")
		}
		if(project){
			def cal = Calendar.instance
			def file = new File(ExcelUtility.BILL_PATH+"/"+project.funeralCompany.funeralCompanyName+"-" + project.projectName + "-" +cal.getTime().format("yyyy-MM-dd")+".xls")
			// create our workbook and sheet
			def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/外帳.xls").inputStream),settings)

			try{
				def sheet = workbook.getSheet(0)
				sheet.getSettings().setProtected(true);
				def parameter = Parameters.findByType("excelPassword")
				sheet.getSettings().setPassword(parameter.value);

				def commonFormat = new WritableCellFormat(sheet.getCell(1,1).getCellFormat())
				commonFormat.setBorder(Border.ALL, BorderLineStyle.THIN)
				// write out our header
				//案名
				sheet.addCell(new Label(1, 1,project.projectName,commonFormat))
				//禮儀公司
				sheet.addCell(new Label(5, 1,project.funeralCompany.funeralCompanyName,commonFormat))
				//禮儀師
				//sheet.addCell(new Label(11, 2,project.funeraler.funeralerName,new WritableCellFormat(sheet.getCell(11,2).getCellFormat())))

				def count = 1
				def row = 2
				billDetails.each() {

					//合併欄位
					//sheet.mergeCells(2, row, 3, row);
					//def productBills = BillDetail.findAllByProjectAndProductAndShowBill(project,it,true)
					def productBills = BillDetail.findAllWhere(project:project, product:it,showBill:true)
					if(productBills){
						//項目
						sheet.addCell(new Label(0, row,it.productName,commonFormat))

						def amount = 0;
						def modifiedPrice=0,amountReceivable=0;
						switch(it.costUnit){
							//計價單位類別  0:次
							case "0":
								def tmp = ""
								def place = ""
								productBills.each(){
									if(it.place&&"".equals(place)){
										place = (it.place?"("+it.place.placeName+")":"")
									}
									tmp +=(it.startTime.toCalendar().get(Calendar.MONTH)+1)+"/"+it.startTime.toCalendar().get(Calendar.DATE)+"，"
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									amountReceivable += it.quantity * it.product.costRange * modifiedPrice
								}
								tmp = tmp?.substring(0, tmp.length()-1)
								sheet.addCell(new Label(1, row,tmp+place ,commonFormat))
							//次數
								sheet.addCell(new Label(3, row,((int)amount).toString(),commonFormat))
								break
							case "2":
								def tmpHour =""

								productBills.each(){
									tmpHour += (""==tmpHour?"":";") + Utility.monthDateFormat.format(it.startTime) +(it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"")+ (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									amountReceivable += it.quantity * it.product.costRange * modifiedPrice
								}
							//2:區間(時)
								sheet.addCell(new Label(1, row,tmpHour,commonFormat))
							//次數
								sheet.addCell(new Label(3, row,((int)amount).toString(),commonFormat))
								break
							case "3":
								def tmpDay =""
								productBills.each(){
									tmpDay += (""==tmpDay?"":";") + Utility.monthDateFormat.format(it.startTime) + (it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"") + (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									amountReceivable += it.quantity * it.product.costRange * modifiedPrice
								}
							//3:區間(天)
								sheet.addCell(new Label(1, row,tmpDay,commonFormat))
							//次數
								sheet.addCell(new Label(3, row,((int)amount).toString(),commonFormat))
								break
							case "4":
								def tmpMonth =""
								productBills.each(){
									tmpMonth += (""==tmpMonth?"":";") + Utility.monthDateFormat.format(it.startTime) + (it.startTime.date!=it.endTime.date?("~"+ Utility.monthDateFormat.format(it.endTime)):"")+ (it.place?"("+it.place.placeName+")":"")
									amount += it.quantity *it.product.costRange
									modifiedPrice = it.modifiedPrice
									amountReceivable += it.quantity * it.product.costRange * modifiedPrice
								}

							//4:區間(月)
								sheet.addCell(new Label(1, row,tmpMonth,commonFormat))
							//次數
								sheet.addCell(new Label(3, row,((int)amount).toString(),commonFormat))
						}
						//共計
						sheet.addCell(new Label(2, row,"共計",commonFormat))
						//顯示單位
						sheet.addCell(new Label(4, row,it.unit,commonFormat))

						sheet.addCell(new Label(5, row,"單價",commonFormat))
						//單價
						sheet.addCell(new Label(6, row,((int)modifiedPrice).toString(),commonFormat))
						//共計
						sheet.addCell(new Label(7, row,"共計",commonFormat))
						//應收金額
						//sheet.addCell(new Formula(8, row, "D"+(row+1)+"*G"+(row+1),commonFormat))
						sheet.addCell(new Number(8, row, (int)amountReceivable,commonFormat))
						row++
					}
					count++
				}
				//表尾

				//應收金額合計
				WritableFont writableFont = new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,format.UnderlineStyle.NO_UNDERLINE,format.Colour.RED);
				WritableCellFormat wcf = new WritableCellFormat(writableFont);

				wcf.setBorder(Border.ALL, BorderLineStyle.THIN)
				wcf.setVerticalAlignment format.VerticalAlignment.CENTRE
				wcf.setAlignment format.Alignment.CENTRE
				wcf.setFont(writableFont)
				sheet.mergeCells 7, row, 8, row
				sheet.addCell(new Formula(7, row, "SUM(I3:I"+row+")",wcf))
				//以上項目總計
				sheet.mergeCells 2, row, 6, row
				sheet.addCell(new Label(2, row, "以上項目總計:",commonFormat))
				//備註
				sheet.mergeCells 0, row, 1, row
				sheet.addCell(new Label(0, row, "備註",commonFormat))

				row++
				//以上報價未稅如需發票稅外另計 5%。
				def endLine = 21 * ((int)(row/22)+ ((row%22)>0?1:0))
				sheet.mergeCells 0, row, 8, endLine
				sheet.addCell(new Label(0, row, "以上報價未稅如需發票稅外另計 5%。",commonFormat))

				//禮儀師簽名：
				def singLine = endLine + 1
				sheet.mergeCells 2, singLine, 3, singLine
				sheet.addCell(new Label(2, singLine, "禮儀師簽名：	",commonFormat))

				//年     月     日
				sheet.mergeCells 7, singLine, 8, singLine
				sheet.addCell(new Label(7, singLine, "年     月     日",commonFormat))
				sheet.mergeCells 0, singLine, 1, singLine
				sheet.addCell(new Label(0, singLine, "",commonFormat))
				sheet.mergeCells 4, singLine, 6, singLine
				sheet.addCell(new Label(4, singLine, "",commonFormat))
			}
			catch(Exception e){
				e.printStackTrace();
			}finally{
				// close
				workbook.write()
				workbook.close()
			}

			response.setContentType("application/octet-stream")

			//response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")
			response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))
			response.outputStream << file.newInputStream()
		}
	}
	def resetExcelPW={
		def parameter = Parameters.findByType("excelPassword")
		parameter.setValue params.excelPW
		parameter.setLastModifyBy session.employee
		parameter.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}

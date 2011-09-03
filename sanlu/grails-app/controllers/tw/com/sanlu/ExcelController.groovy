package tw.com.sanlu
import grails.converters.JSON

import java.io.File
import java.util.Calendar

import jxl.*
import jxl.write.*
import tw.com.sanlu.excel.ExcelUtility

class ExcelController extends BaseController {
	def index = {
	}

	//品項代叫報表
	def agency = {
		// create our workbook and sheet

		String fileName = "品項代叫記錄-"+params.exportYear+"-"+params.exportMonth+".xls";
		def file = new File("Excel/品項代叫記錄-"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/品項代叫記錄.xls").inputStream))
		try{
			def sheet = workbook.getSheet(0)
			def cal = Calendar.instance
			cal.set params.int("exportYear"), params.int("exportMonth")-1, 00
			def cal2 = Calendar.instance
			cal2.set params.int("exportYear"), params.int("exportMonth"), 00
			//cal2.add Calendar.MONTH, 1
			//def productHistorys =ProductHistory.findAllByProduct(Product.findAllByIsAgency(true))
			def products = Product.findAllByIsAgency(true)
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

		def file = new File("Excel/商品提出明細-"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/商品提出明細.xls").inputStream))
		try{
			def sheet = workbook.getSheet(0)
			def cal = Calendar.instance
			cal.set params.int("exportYear"), params.int("exportMonth")-1, 00
			def cal2 = Calendar.instance
			cal2.set params.int("exportYear"), params.int("exportMonth"), 00
			//cal2.add Calendar.MONTH, 1
			//def productHistorys =ProductHistory.findAllByProduct(Product.findAllByIsAgency(true))
			def products = Product.findAllByIsAgency(false)
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
		def file = new File("Excel/日執行表_"+params.exportYear+"-"+params.exportMonth+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/日執行表.xls").inputStream))
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
		//def billDetails = BillDetail.findAllByProject(params.projectId)
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
			def file = new File("Excel/帳單-案名-" + project.projectName + "-" +cal.getTime().format("yyyy-MM-dd")+".xls")
			// create our workbook and sheet
			def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/bill.xls").inputStream))

			try{
				def sheet = workbook.getSheet(0)
				sheet.getSettings().setProtected(true);
				def parameter = Parameters.findByType("excelPassword")
				sheet.getSettings().setPassword(parameter.value);

				//單數format
				WritableCellFormat oddFormat = new WritableCellFormat(sheet.getCell(0, 6).getCellFormat())
				//雙數format
				WritableCellFormat evenFormat = new WritableCellFormat(sheet.getCell(0, 7).getCellFormat())

				// write out our header
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
						if(it.isAgency){
							//代叫供品明細：
							isAgencyTmp+=it.productName + "，"
						}else{
							//提出商品明細：
							notAgencyTmp+=it.productName + "，"
						}

						//計價單位類別  0:次
						if(it.costUnit==0){
							def tmp = ""
							productBills.each(){
								tmp +=it.startTime.getMonth()+1+"月"+it.startTime.getDate()+"日"+"，"
							}
							tmp = tmp?.substring(0, tmp.length()-1)
							sheet.addCell(new Label(2, row,tmp,count%2!=0?oddFormat:evenFormat))
							//次數							
							sheet.addCell(new Label(4, row,((int)(productBills.size()*it.costRange)).toString(),count%2!=0?oddFormat:evenFormat))
						}else if(it.costUnit==1){
							productBills.each(){
								//1:區間(時)
								sheet.addCell(new Label(2, row,it.startTime.getMonth()+1+"月"+it.startTime.getDate()+"日",count%2!=0?oddFormat:evenFormat))
								//次數
								sheet.addCell(new Label(4, row,((int)it.quantity).toString(),count%2!=0?oddFormat:evenFormat))
							}
						}else if(it.costUnit==2){
							productBills.each(){
								//2:區間(天)
								sheet.addCell(new Label(2, row,it.startTime.getMonth()+1+"月"+it.startTime.getDate()+"日~"+it.endTime.getMonth()+"月"+it.endTime.getDate()+"日"  ,count%2!=0?oddFormat:evenFormat))
								//次數
								sheet.addCell(new Label(4, row,((int)it.quantity).toString(),count%2!=0?oddFormat:evenFormat))
							}
						}
						//顯示單位
						sheet.addCell(new Label(5, row,it.unit,count%2!=0?oddFormat:evenFormat))
						//單價
						sheet.addCell(new Label(6, row,((int)it.sallingPrice).toString(),count%2!=0?oddFormat:evenFormat))
						//應收金額
						sheet.addCell(new Formula(7, row, "E"+(row+1)+"*G"+(row+1),count%2!=0?oddFormat:evenFormat))
						//減號
						sheet.addCell(new Label(8, row, "─",count%2!=0?oddFormat:evenFormat))
						//成本單價
						sheet.addCell(new Label(9, row,((int)it.price).toString(),count%2!=0?oddFormat:evenFormat))
						//實收金額
						sheet.addCell(new Formula(10, row, "E"+(row+1)+"*J"+(row+1),count%2!=0?oddFormat:evenFormat))
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
				sheet.addCell(new Formula(12, row, "H"+row+"-K"+row,wcf))
				row++
				WritableCellFormat wcf2 = new WritableCellFormat(writableFont);
				wcf2.setVerticalAlignment format.VerticalAlignment.TOP
				wcf2.setWrap(true);
				//以上報價未稅，如需發票另計 5%。=
				sheet.mergeCells 0, row, 2, row
				sheet.addCell(new Label(0, row, "以上報價未稅，如需發票另計 5%=	",wcf2))
				//含稅
				sheet.addCell(new Formula(3, row, "H"+row+"*0.05",wcf2))
				//代叫供品明細：
				sheet.mergeCells 4, row, 6, row+2
				sheet.addCell(new Label(4, row, "代叫供品明細：",wcf2))
				sheet.mergeCells 7, row, 12, row+2
				isAgencyTmp = isAgencyTmp?.substring(0, isAgencyTmp.length()-1)
				notAgencyTmp = notAgencyTmp?.substring(0, notAgencyTmp.length()-1)

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
			def file = new File("Excel/外帳單-案名-" + project.projectName + "-" +cal.getTime().format("yyyy-MM-dd")+".xls")
			// create our workbook and sheet
			def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(ExcelUtility.getResource("excel/外帳.xls").inputStream))

			try{
				def sheet = workbook.getSheet(0)
				sheet.getSettings().setProtected(true);
				def parameter = Parameters.findByType("excelPassword")
				sheet.getSettings().setPassword(parameter.value);

				def commonFormat = new WritableCellFormat(sheet.getCell(1,1).getCellFormat())
				// write out our header
				//案名
				sheet.addCell(new Label(1, 1,project.projectName,commonFormat))
				//禮儀公司
				sheet.addCell(new Label(5, 1,project.funeralCompany.funeralCompanyName,commonFormat))
				//禮儀師
				//sheet.addCell(new Label(11, 2,project.funeraler.funeralerName,new WritableCellFormat(sheet.getCell(11,2).getCellFormat())))

				def count = 1
				def row = 2
				//代叫供品明細：
				def isAgencyTmp = ""
				//提出商品明細：
				def notAgencyTmp = ""
				billDetails.each() {

					//合併欄位
					//sheet.mergeCells(2, row, 3, row);
					//def productBills = BillDetail.findAllByProjectAndProductAndShowBill(project,it,true)
					def productBills = BillDetail.findAllWhere(project:project, product:it,showBill:true)
					if(productBills){
						//項目
						sheet.addCell(new Label(0, row,it.productName,commonFormat))
						//計價單位類別  0:次
						if(it.costUnit==0){
							def tmp = ""
							productBills.each(){
								tmp +=it.startTime.getMonth()+1+"/"+it.startTime.getDate()+""+"，"
							}
							tmp = tmp?.substring(0, tmp.length()-1)
							sheet.addCell(new Label(1, row,tmp))
							//次數
							sheet.addCell(new Label(3, row,((int)(productBills.size()*it.costRange)).toString(),commonFormat))
						}else if(it.costUnit==1){
							productBills.each(){
								//1:區間(時)
								sheet.addCell(new Label(1, row,it.startTime.getMonth()+1+"/"+it.startTime.getDate()+"",commonFormat))
								//次數
								sheet.addCell(new Label(3, row,((int)it.quantity).toString(),commonFormat))
							}
						}else if(it.costUnit==2){
							productBills.each(){
								//2:區間(天)
								sheet.addCell(new Label(1, row,it.startTime.getMonth()+1+"/"+it.startTime.getDate()+"~"+it.endTime.getMonth()+1+"/"+it.endTime.getDate()+"",commonFormat))
								//次數
								sheet.addCell(new Label(3, row,((int)it.quantity).toString(),commonFormat))
							}
						}
						//顯示單位
						sheet.addCell(new Label(4, row,it.unit,commonFormat))
						//單價
						sheet.addCell(new Label(6, row,((int)it.sallingPrice).toString(),commonFormat))
						//應收金額
						sheet.addCell(new Formula(8, row, "D"+(row+1)+"*G"+(row+1),commonFormat))
						row++
					}
					count++
				}
				//表尾

				//應收金額合計
				WritableFont writableFont = new WritableFont(WritableFont.ARIAL,12,WritableFont.NO_BOLD,false,format.UnderlineStyle.NO_UNDERLINE,format.Colour.RED);
				WritableCellFormat wcf = new WritableCellFormat(writableFont);
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
				sheet.mergeCells 0, row, 8, 21
				sheet.addCell(new Label(0, row, "以上報價未稅如需發票稅外另計 5%。"))
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

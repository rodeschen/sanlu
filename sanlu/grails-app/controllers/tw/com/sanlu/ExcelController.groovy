package tw.com.sanlu
import java.io.File

import jxl.*
import jxl.write.*
import java.util.Calendar;

class ExcelController extends BaseController {

	def index = { }

	//品項代叫報表
	def agency = {
		// create our workbook and sheet
		
		def file = new File("Excel//"+params.exportYear+"-"+params.exportMonth+"report1.xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(new File("Excel//品項代叫記錄.xls")))
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
		//def c = [0, 1, 7, 8]
		sheet.addCell(new Label(0, 0,params.exportMonth + sheet.getCell(0,0).getContents(),new WritableCellFormat(sheet.getCell(0, 0).getCellFormat())))
		productHistorys.each() {
			// write out our header
			//sheet.addCell(new Label(c, 0, v.toString()))

			// write out the value for each object
			
			WritableCellFormat wFormat = new WritableCellFormat(sheet.getCell(0, r).getCellFormat())			
			//日期
			sheet.addCell(new Label(0, r,it.date?.format("yyyy-MM-dd"),wFormat))
			//品項
			sheet.addCell(new Label(1, r,"品項:"+it.product.productName+" 數量:"+((int)it.quantity),wFormat))
			//廠商
			sheet.addCell(new Label(2, r,it.vendor,wFormat))
			//禮儀公司
			sheet.addCell(new Label(3, r,it.project.funeralCompany.funeralCompanyName,wFormat))
			//執行人員
			sheet.addCell(new Label(4, r,it.lastModifyBy.empName,wFormat))
			
			r++
		}

		// close
		workbook.write()
		workbook.close()


		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")
		//response.setContentType("application/vnd.ms-excel")
		
		response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")

		response.outputStream << file.newInputStream()
	}
	
	//商品提出明細
	def productSale = {
		// create our workbook and sheet
		
		def file = new File("Excel//"+params.exportYear+"-"+params.exportMonth+"report2.xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(new File("Excel//商品提出明細.xls")))
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
		def r = 3
		//def c = [0, 1, 7, 8]
		productHistorys.each() {
			// write out our header
			//sheet.addCell(new Label(c, 0, v.toString()))

			// write out the value for each object
			WritableCellFormat wFormat = new WritableCellFormat(sheet.getCell(0, r).getCellFormat())

			//日期
			sheet.addCell(new Label(0, r,it.date?.format("yyyy-MM-dd"),wFormat))
			//品項
			sheet.addCell(new Label(1, r,it.product.productName,wFormat))
			//數量
			sheet.addCell(new Label(2, r,((int)it.quantity).toString(),wFormat))
			//禮儀公司
			sheet.addCell(new Label(3, r,it.project?it.project.funeralCompany.funeralCompanyName:"",wFormat))
			//提出人
			sheet.addCell(new Label(4, r,it.lastModifyBy.empName,wFormat))
			//備註
			sheet.addCell(new Label(5, r,it.memo?it.memo:"",wFormat))
			
			r++
		}

		// close
		workbook.write()
		workbook.close()


		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")
		//response.setContentType("application/vnd.ms-excel")
		
		response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")

		response.outputStream << file.newInputStream()
	}
}

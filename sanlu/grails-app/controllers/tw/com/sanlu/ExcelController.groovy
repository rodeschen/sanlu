package tw.com.sanlu
import java.io.File

import jxl.*
import jxl.write.*

class ExcelController {

    def index = { }
	
	def agency = {
		// create our workbook and sheet		
		def file = new File("Excel//"+new Date().format("yyyy-MM-dd")+".xls")
		def workbook = Workbook.createWorkbook(file,Workbook.getWorkbook(new File("Excel//品項代叫記錄.xls")))
		def sheet = workbook.getSheet(0)
	  
		//def productHistorys =ProductHistory.findAllByProduct(Product.findAllByIsAgency(true))
		def products = Product.findAllByIsAgency(true)
		def criteria = ProductHistory.createCriteria()
		def productHistorys = criteria {
			'in'("product",products)
		}
		def r = 4
		productHistorys.each() {
			// write out our header
			//sheet.addCell(new Label(c, 0, v.toString()))
		  
			// write out the value for each object			
			def c = 0
			//日期
			sheet.addCell(new Label(c, r,it.date?.format("yyyy-MM-dd")))
			//品項
			sheet.addCell(new Label(1, r,"品項:"+it.product.productName+" 數量:"+it.quantity))
			//廠商
			sheet.addCell(new Label(7, r,it.vendor))
			//禮儀公司
			sheet.addCell(new Label(8, r,it.project.funeralCompany.funeralCompanyName))
			//執行人員
			sheet.addCell(new Label(10, r,it.lastModifyBy.empName))
			
			r++
		}
	  
		// close
		workbook.write()
		workbook.close()
		
		
		//def file = new File("addr.xls")
		response.setContentType("application/octet-stream")
		response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")
		
		response.outputStream << file.newInputStream()
		}
}

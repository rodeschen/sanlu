package tw.com.sanlu

import java.util.Date;

class Document {
	//private static final int METABYTES = 1024 * 1024 //* 1024
	//private static final int MAX_SIZE = 10 * METABYTES //max size 10GB
	String type
	
	byte[] fileData
	String fileName 
	Integer size
	Date dateCreated
	static constraints = {
		//fileData(nullable:false, minSize:1, maxSize:MAX_SIZE)

	}
}

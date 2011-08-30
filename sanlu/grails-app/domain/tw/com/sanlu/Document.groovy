package tw.com.sanlu


class Document {

	private static final int METABYTES = 1024 * 1024 //* 1024
	private static final int MAX_SIZE = 10 * METABYTES //max size 10GB
	String type
	String key
	byte[] fileData
	String fileName
	int size
	Date dateCreated
	static constraints = {
		fileData(nullable:false, minSize:1, maxSize:MAX_SIZE)

	}
}

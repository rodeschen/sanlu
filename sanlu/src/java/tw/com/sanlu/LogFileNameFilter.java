package tw.com.sanlu;

import java.io.File;
import java.io.FileFilter;

public class LogFileNameFilter implements FileFilter {

	@Override
	public boolean accept(File pathname) {
		if(pathname.isFile()){
			String fileName = pathname.getName();
			return fileName.matches(Utility.LOGSEXP);
		}
		return false;
	}

}

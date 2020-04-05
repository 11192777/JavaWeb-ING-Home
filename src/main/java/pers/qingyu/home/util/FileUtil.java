package pers.qingyu.home.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class FileUtil {

	public static void fileCopy(String filePath, String copyFilePath) throws IOException{
		FileUtils.copyFile(new File(filePath), new File(copyFilePath));
	}
	
}

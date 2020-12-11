package kr.or.funding.utils;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class GetUploadPath {
	private static Properties properties = new Properties();
	
	static {
		String resource = "com/jsp/properties/uploadPath.properties";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			properties.load(reader);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getUploadPath(String key) {
		String UploadPath=null;
		UploadPath = properties.getProperty(key);
		UploadPath = UploadPath.replace("/", File.separator);
		return UploadPath;
	}
	
	public static String getUploadDatePath(String key) {
		String UploadDatePath = getUploadPath(key);
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String savePath = yearPath + monthPath + datePath;
		UploadDatePath += savePath;

		return UploadDatePath;
	}
}

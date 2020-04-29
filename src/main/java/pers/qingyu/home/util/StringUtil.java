package pers.qingyu.home.util;

public class StringUtil {

	public static boolean isEmpty(String str) {
		return str == null || "".equals(str.trim());
	}
	
	public static String fuzzyQueryStringDeal (String str) {
		if (!StringUtil.isEmpty(str)) {
			if (str.indexOf("\\") != -1) {
				str = str.replaceAll("\\\\", "\\\\\\\\");
			}
			if (str.indexOf("%") != -1) {
				str = str.replaceAll("%", "\\\\%");
			}
			if (str.indexOf("_") != -1) {
				str = str.replaceAll("_", "\\\\_");
			}
		}
		return str;
	}
	
	public static String cutOffString (String str, String cutStartStr){
		int index = str.indexOf(cutStartStr);
		return index == 0 ? "" : str.substring(0, index);
	}
}

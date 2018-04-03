package com.study.common;
import java.text.DecimalFormat;

public class FileUtil {
	// 300 "300bytes", 1024 bytes - 1Kb     , 1024Kb - 1Mb  
	public static String fancySize(long size) {
		DecimalFormat df = new DecimalFormat("###,###.0");
		if(size < 1024) {
			return size + "Bytes";
		}else if(size < (1024 * 1024)) {
			return df.format(size/1024.0) + "Kb";
		}else {
			return df.format(size/(1024.0 * 1024.0)) + "";
		}
	}
	
	public static void main(String[] args) {
		System.out.println(14 / 5.0); //실수가 정수 보다 커서 한쪽이 실수면 실수 계산을 한다.
		System.out.println(FileUtil.fancySize(500));
		System.out.println(FileUtil.fancySize(3300));
		System.out.println(FileUtil.fancySize(10000));
	}
}
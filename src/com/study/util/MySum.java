package com.study.util;

public class MySum {
	//단순하게 브레이크
	//조건에 맞을때 브레이크
	public int sum(int start, int last) {
		int tot = 0;
		for(int i = start; i<=last; i++) {
			tot += i;
		}
		return tot;
	}
	
	public static void main(String[] args) {
		MySum my = new MySum();
		int ret = my.sum(10,20);
		System.out.println(ret);
	}
}
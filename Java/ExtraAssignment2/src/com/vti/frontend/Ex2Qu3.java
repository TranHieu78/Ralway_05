package com.vti.frontend;

import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class Ex2Qu3 {
	   public static void main(String[] args) {
	    	Scanner scanner = new Scanner(System.in);
	    	
	        System.out.print("Nhập số phần tử của mảng: ");
	        int n = scanner.nextInt();
	     
	        int [] arr = new int [n];
	        System.out.println("Nhập các phần tử của mảng: ");
	        for (int i = 0; i < n; i++) {
	            System.out.printf("a[%d] = ", i);
	            arr[i] = scanner.nextInt();
	        }
	       
	        Map<Integer, Integer> map = new TreeMap<Integer, Integer>();
	        for (int i = 0; i < n; i++) {
	            addElement(map, arr[i]);
	        }
	        for (Integer key : map.keySet()) {
	                System.out.println("phần tử: " + key + " xuất hiện: " + map.get(key) );

	        }
	    }
	     

	    public static void addElement(Map<Integer, Integer> map, int element) {
	        if (map.containsKey(element)) {
	            int count = map.get(element) + 1;
	            map.put(element, count);
	        } else {
	            map.put(element, 1);
	        }
	    }
}

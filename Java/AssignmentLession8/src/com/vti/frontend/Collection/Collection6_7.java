package com.vti.frontend.Collection;

import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

public class Collection6_7 {
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		Map<Integer, String> students = new TreeMap<>();
		students.put(1, "Trần Đức Hiếu");
		students.put(2, "Phan Văn Kiên");
		students.put(3, "Lê Văn Đại");
		students.put(4, "Phạm Duy Bách");
		students.put(5, "Lê Bảo Bình");

//		for (Map.Entry<Integer, String> entry : students.entrySet()) {
//			System.out.println("ID: " + entry.getKey() + " / " + "Name: " + entry.getValue());
//		}
		
		 Map sortedMap = valueSort(students); 
		  
	 
	        Set set = sortedMap.entrySet(); 
	  
 
	        Iterator i = set.iterator(); 
	  
	        while (i.hasNext()) { 
	            
	            Map.Entry mp = (Map.Entry)i.next(); 
	            System.out.print(mp.getKey() + ": "); 
	            System.out.println(mp.getValue()); 
	            
	        } 

	}

	public static <K, V extends Comparable<V>> Map<K, V> valueSort(final Map<K, V> map) {

		Comparator<K> valueComparator = new Comparator<K>() {

	
			public int compare(K k1, K k2) {
				int comp = map.get(k1).compareTo(map.get(k2));
				if (comp == 0)
					return 1;
				else
					return comp;
			}

		};

		Map<K, V> sorted = new TreeMap<K, V>(valueComparator);

		sorted.putAll(map);

		return sorted;
	}

}

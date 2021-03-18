package com.vti.emtity.Generic;

public class Staff<K, V> extends MyMap<K, V>{

	public Staff(K key, V value) {
		super(key, value);
	}
	
	public K getID() {
		return super.getKey();
	}

	public V getName() {
		return super.getValue();
	}
}

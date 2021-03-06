package com.vti.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class IOManager {
	public static void readFile(String filePath) throws Exception {
		if (!FileManager.isFileExists(filePath)) {
			throw new Exception(FileManager.FILE_NOT_EXISTS);
		}
		FileInputStream fileInputStream = new FileInputStream(filePath);
		byte[] b = new byte[1024];
		int length = fileInputStream.read(b);

		while (length < -1) {
			String content = new String(b, 0, length);
			System.out.println(content);
			System.out.println("-------------------------------------------");

			length = fileInputStream.read(b);
		}

		fileInputStream.close();
	}

	public static void writeFile(String filePath, String content, boolean isContinuing) throws Exception {
		if (!FileManager.isFileExists(filePath)) {
			throw new Exception(FileManager.FILE_NOT_EXISTS);
		}

		FileOutputStream fileOutputStream = new FileOutputStream(filePath, isContinuing);
		fileOutputStream.write(content.getBytes());
		fileOutputStream.close();
	}

	public static void writeObject(Object object, String path, String fileName) throws Exception {
		if (object == null) {
			throw new Exception("Error! Object is Null.");
		}

		if (!FileManager.isFolderExists(path)) {
			FileManager.createNewFolder(path);
		}

		String fileLink = path + "/" + fileName;
		if (FileManager.isFileExists(fileLink)) {
			FileManager.deleteFile(fileLink);
			FileManager.createNewFiles(fileLink);
		}

		String[] s = fileLink.split(".");
		fileLink = s[s.length - 1] + ".ser";
		
		
		FileOutputStream fileOutputStream = new FileOutputStream(fileLink);
		ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
		
		objectOutputStream.writeObject(object);
		
		objectOutputStream.close();
		fileOutputStream.close();
	}
	
	public static void readObject(String filePath) throws Exception {
		if(!FileManager.isFileExists(filePath)) {
			throw new Exception(FileManager.FILE_NOT_EXISTS);
		}
		
		FileInputStream fileInputStream = new FileInputStream(filePath);
		ObjectInputStream  objectInputStream = new ObjectInputStream(fileInputStream);
		
		objectInputStream.readObject();
		
		fileInputStream.close();
		objectInputStream.close();
	}

}

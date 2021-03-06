package com.vti.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;

public  class FileManager {

	public static final String FILE_EXISTS = "File is exits!";
	public static final String FILE_NOT_EXISTS = "Error! File Not Exist.";
	public static final String FOLDER_EXISTS = "Folder is exits!";
	public static final String FOLDER_NOT_EXISTS = "Folder is not exits!";
	public static final String PATH_NOT_FOLDER = "Error! Path is not folder.";

	public static final String SOURCE_FILE_NOT_EXISTS = "Source File is not exits!";
	public static final String DESTINATION_FILE_EXISTS = "Destination File is exits!";

	public static final String NEW_FILE_EXISTS = "Error! New File Exist.";
	public static final String CREATE_FILE_SUCCESS = "Create file success!";
	public static final String CREATE_FILE_FAIL = "Create file fail!";
	public static final String DELETE_FILE_SUCCESS = "Delete file success!";
	public static final String DELETE_FILE_FAIL = "Delete file fail!";

	public static boolean isFileExists(String pathFile) {
		File file = new File(pathFile);
		return file.exists();
	}

	public static boolean isFolderExists(String pathFolder) {
		File file = new File(pathFolder);
		return file.exists();
	}

	public static boolean isFolder(String pathFolder) {
		File file = new File(pathFolder);
		return file.isDirectory();
	}

	public static void createNewFiles(String pathFile) throws Exception {
		File file = new File(pathFile);
		if (isFileExists(pathFile)) {
			throw new Exception(FILE_EXISTS);
		} else if (file.createNewFile()) {
			System.out.println(CREATE_FILE_SUCCESS);
		} else {
			System.out.println(CREATE_FILE_FAIL);
		}
	}

	public static void deleteFile(String pathFile) throws Exception {
		File file = new File(pathFile);
		if (isFileExists(pathFile)) {
			throw new Exception(FILE_EXISTS);
		} else if (file.delete()) {
			System.out.println(CREATE_FILE_SUCCESS);
		} else {
			System.out.println(CREATE_FILE_FAIL);
		}
	}

	public static void getAllFileName(String path) throws Exception {
		File file = new File(path);

		if (isFolder(path)) {
			throw new Exception(PATH_NOT_FOLDER);
		} else {
			System.out.println(file.list());
		}
	}

	public static void copyFile(String sourceFile, String destinationPath, String newName) throws Exception {

		if (!isFileExists(sourceFile)) {
			throw new Exception(SOURCE_FILE_NOT_EXISTS);
		}

		String destinationFile = destinationPath + "//" + newName;

		if (isFileExists(destinationFile)) {
			throw new Exception(DESTINATION_FILE_EXISTS);
		}

		File source = new File(sourceFile);
		File dest = new File(destinationPath);

		Files.copy(source.toPath(), dest.toPath());
	}

	public static void movingFile(String sourceFile, String destinationPath) throws Exception {
		if (!isFileExists(sourceFile)) {
			throw new Exception(FILE_NOT_EXISTS);
		}
		File source = new File(sourceFile);
		File dest = new File(destinationPath);

		Files.move(source.toPath(), dest.toPath());
	}

	public static void renameFile(String pathFile, String newName) throws Exception {
		if (!isFileExists(pathFile)) {
			throw new Exception(FILE_NOT_EXISTS);
		}

		if (!isFileExists(newName)) {
			throw new Exception(FILE_NOT_EXISTS);
		}

		File oldFile = new File(pathFile);
		File newFile = new File(newName);

		oldFile.renameTo(newFile);
	}

	public static void createNewFolder(String path) throws Exception {
		File file = new File(path);
		if (isFileExists(path)) {
			throw new Exception(FOLDER_EXISTS);
		}
		file.mkdir();
	}

	public static void downloadFile(String fileLink, String folder) throws Exception {
		if (!isFolderExists(fileLink)) {
			createNewFolder(folder);
		}

		String[] fileNames = fileLink.split("/");
		String fileName = fileNames[fileNames.length - 1];
		int i = 1;
		while (isFileExists(fileName)) {
			fileName = fileName + i;
			i++;
		}

		String pathFile = folder + "/" + fileName;

		// connect to URL
		URL url = new URL(fileLink);
		URLConnection connection = url.openConnection();

		// get size of file
		int size = connection.getContentLength();

		// read file from internet
		InputStream inputStream = connection.getInputStream();

		// save file
		FileOutputStream output = new FileOutputStream(pathFile);
		int byteDownload = 0;
		byte[] b = new byte[1024];
		// get length
		int length = inputStream.read(b);
		while (length != -1) {

			byteDownload += length;
			System.out.println(byteDownload * 100f / size + "%");

			// write content downloaded from 0 -> length to ouput
			output.write(b, 0, length);
			length = inputStream.read(b);
		}

		// close
		output.close();
		inputStream.close();
		System.out.println("Download success");

	}
}

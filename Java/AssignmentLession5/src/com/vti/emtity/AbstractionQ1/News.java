package com.vti.emtity.AbstractionQ1;

import java.util.Scanner;

public class News implements INews {
	private int id;
	private String title;
	private String publishDate;
	private String author;
	private String content;
	private float averageRate;
	
	int[] rates = new int[3];

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getAverageRate() {
		return averageRate;
	}

	public void AddNew() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("M�?i bạn nhập title: ");
		title = scanner.nextLine();
		
		System.out.println("M�?i bạn nhập publishDate: ");
		publishDate = scanner.nextLine();
				
		System.out.println("M�?i bạn nhập author: ");
		author = scanner.nextLine();
				
		System.out.println("M�?i bạn nhập content: ");
		content = scanner.nextLine();
		
		System.out.println("Hãy nhập 3 đánh giá: (nhập 1 số thực)");
		for(int i = 0; i < 3; i++) {
			rates[i] = scanner.nextInt();
		}
	}

	public void Display() {
		System.out.println("News [id= " + id + ", title= " + title + ", publishDate= " + publishDate + ", author= "
				+ author + ", content= " + content + ", averageRate= " + averageRate + "]");
	}


	public float Calculate() {
		return this.averageRate = (rates[0] + rates[1] + rates[2]) / 3;
	}

}

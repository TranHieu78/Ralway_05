package com.vti.emtity.StaticQ8;

public class HinhTron extends HinhHoc{

	public HinhTron(float a, float b) throws Exception {
		super(a, b);
	}

	public static final double PI = 3.14;

	@Override
	public void tinhchuvi(float a, float b) {
		float chuvi = (float) PI * a;
		System.out.println(chuvi);
	}

	@Override
	public void tinhdientich(float a, float b) {
		float dientich = (float) PI * b*b;
		System.out.println(dientich);
	}
	
}

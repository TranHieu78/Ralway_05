package com.vti.emtity.StaticQ8;

public class HinhChuNhat extends HinhHoc {

	public HinhChuNhat(float a, float b) throws Exception {
		super(a, b);
	}

	@Override
	public void tinhchuvi(float a, float b) {
		float chuvi = (a + b) * 2;
		System.out.println(chuvi);

	}

	@Override
	public void tinhdientich(float a, float b) {
		float dientich = a * b;
		System.out.println(dientich);

	}

}

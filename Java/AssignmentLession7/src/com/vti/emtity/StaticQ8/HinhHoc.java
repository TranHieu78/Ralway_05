package com.vti.emtity.StaticQ8;

public abstract class HinhHoc implements IHinhHoc {
	public static int count = 0;
	private float a;
	private float b;

	public HinhHoc(float a, float b) throws Exception {
		if (count >= 5) {
			throw new Exception("Số lượng hình tối đa là: " + Configs.SO_LUONG_HINH_TOI_DA);
		}
		this.a = a;
		this.b = b;
	}
}

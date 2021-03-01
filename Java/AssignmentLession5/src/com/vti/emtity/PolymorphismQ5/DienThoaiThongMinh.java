package com.vti.emtity.PolymorphismQ5;

public class DienThoaiThongMinh extends DienThoaiDiDong implements TanCong{


	public void tancong() {
	}

	public void suDung3g() {
		System.out.println("Đang sử dụng 3g ....");
	}
	
	public void chupHinh() {
		System.out.println("Đang chupHinh ....");
	}
}

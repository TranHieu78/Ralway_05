package com.vti.backend;

import java.util.ArrayList;
import java.util.Scanner;

import com.vti.emtity.InheritanceQ1.CanBo;
import com.vti.emtity.InheritanceQ1.CongNhan;
import com.vti.emtity.InheritanceQ1.KySu;
import com.vti.emtity.InheritanceQ1.NhanVien;
import com.vti.emtity.InheritanceQ4.Bao;
import com.vti.emtity.InheritanceQ4.Book;
import com.vti.emtity.InheritanceQ4.TaiLieu;
import com.vti.emtity.InheritanceQ4.Tapchi;

public class Excercise5 {

	// Question 2: Tiếp tục Question 1
	// Xây dựng lớp QLCB(quản lý cán bộ) cài đặt các phương thức thực hiện các chức
	// năng sau:
	// a) Thêm mới cán bộ.
	// b) Tìm kiếm theo họ tên.
	// c) Hiện thị thông tin về danh sách các cán bộ.
	// d) Nhập vào tên của cán bộ và delete cán bộ đó
	// e) Thoát khỏi chương trình.

	public ArrayList<CanBo> canBos;
	public ArrayList<TaiLieu> taiLieus;

	public Excercise5() {
		canBos = new ArrayList<>();
		taiLieus = new ArrayList<>();
	}

// a)	Thêm mới cán bộ.
	public void addCanbo() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Số cán bộ muốn nhập");
		int n = scanner.nextInt();
		int choose;
		CanBo canBo = null;
		for (int i = 0; i < n; i++) {
			System.out.println("Bạn muốn nhập cán bộ nào? (1:Công nhân || 2: Kỹ sư || 3: Nhân Viên) ");
			choose = scanner.nextByte();

			switch (choose) {
			case 1:
				canBo = new CongNhan();
				break;
			case 2:
				canBo = new KySu();
				break;
			case 3:
				canBo = new NhanVien();
				break;
			default:
				System.out.println("Nhập sai !");
				i--;
				break;
			}

			canBo.input();
			canBos.add(canBo);
			System.out.println();
			System.out.println("Cán bộ bạn vừa nhập là: ");
			canBo.getInfor();
		}
	}

// b) Tìm kiếm theo họ tên.

	public void findCanBo() {
		Scanner scanner = new Scanner(System.in);

		String hoTen;
		System.out.println("Nhập họ tên cần tìm: ");
		hoTen = scanner.nextLine();

		for (CanBo canBo : canBos) {
			if (hoTen.equals(canBo.getHoTen())) {
				canBo.getInfor();
			}
		}
	}

// c) 	Hiện thị thông tin về danh sách các cán bộ.
	public void inforCanBo() {
		for (CanBo canBo : canBos) {
			System.out.println(canBo);
		}
	}

// d) Nhập vào tên của cán bộ và delete cán bộ đó	

	public void deleteCanbo() {
		Scanner scanner = new Scanner(System.in);
		String ten;
		System.out.println("Nhập tên cán bộ: ");
		ten = scanner.nextLine();

		canBos.removeIf(canBo -> ten.equals(canBo.getHoTen()));
	}

//	Question 4 (Optional):
//		Một thư viện cần quản lý các tài liệu bao gồm Sách, Tạp chí, Báo. Mỗi
//		tài liệu gồm có các thuộc tính sau: Mã tài liệu(Mã tài liệu là duy nhất),
//		Tên nhà xuất bản, số bản phát hành.
//		Các loại sách cần quản lý thêm các thuộc tính: tên tác giả, số trang.
//		Các tạp chí cần quản lý thêm: Số phát hành, tháng phát hành.
//		Các báo cần quản lý thêm: Ngày phát hành.
//		Xây dựng chương trình để quản lý tài liệu (QLTV) cho thư viện một
//		cách hiệu quả.
//		Xây dựng lớp QuanLySach có các chức năng sau
//		a) Thêm mới tài liêu: Sách, tạp chí, báo.
//		b) Xoá tài liệu theo mã tài liệu.
//		c) Hiện thị thông tin về tài liệu.
//		d) Tìm kiếm tài liệu theo loại: Sách, tạp chí, báo.
//		e) Thoát khỏi chương trình.	

// a) Thêm mới tài liêu: Sách, tạp chí, báo.
	public void AddTaiLieu() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Số Tài liệu muốn nhập");
		int n = scanner.nextInt();
		int choose;
		TaiLieu taiLieu = new TaiLieu();
		for (int i = 0; i < n; i++) {
			System.out.println("Bạn muốn nhập tài liệu nào? (1:Sách || 2: Báo || 3: Tạp chí) ");
			choose = scanner.nextByte();

			switch (choose) {
			case 1:
				taiLieu = new Book();
				break;
			case 2:
				taiLieu = new Bao();
				break;
			case 3:
				taiLieu = new Tapchi();
				break;
			default:
				System.out.println("Nhập sai !");
				i--;
				break;
			}

			taiLieu.input();
			taiLieus.add(taiLieu);
			System.out.println();
			System.out.println("Tài liệu bạn vừa nhập là: ");
			taiLieu.getInfor();
		}
	}

// b) Xoá tài liệu theo mã tài liệu.

	public void deleteTaiLieu() {
		Scanner scanner = new Scanner(System.in);
		int id;
		System.out.println("Nhập mã tài liệu: ");
		id = scanner.nextInt();

		taiLieus.removeIf(taiLieu -> taiLieu.getMaTaiLieu() == id);
	}

// c) Hiện thị thông tin về tài liệu.

	public void inforTaiLieu() {
		for (TaiLieu taiLieu : taiLieus) {
			taiLieu.getInfor();
		}
	}

// d) Tìm kiếm tài liệu theo loại: Sách, tạp chí, báo.
	public void findTaiLieu() {
		Scanner scanner = new Scanner(System.in);
		while (true) {
			System.out.println("Bạn muốn xem tài liệu nào? (1:Sách || 2: Báo || 3: Tạp chí || 4: Thoát chương trình) ");
			int chooses = scanner.nextInt();

			switch (chooses) {
			case 1:
				for (TaiLieu taiLieu : taiLieus) {
					if (taiLieu instanceof Book) {
						taiLieu.getInfor();
					}
				}
				break;
			case 2:
				for (TaiLieu taiLieu : taiLieus) {
					if (taiLieu instanceof Bao) {
						taiLieu.getInfor();
					}
				}
				break;
			case 3:
				for (TaiLieu taiLieu : taiLieus) {
					if (taiLieu instanceof Tapchi) {
						taiLieu.getInfor();
					}
				}
				break;
			case 4:
				return;
			default:
				System.out.println("Nhập sai !");
				break;

			}
		}
	}

}
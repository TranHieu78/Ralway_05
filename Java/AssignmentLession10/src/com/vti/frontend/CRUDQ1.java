package com.vti.frontend;

import java.sql.SQLException;

import com.vti.backend.DepartmentDao;

public class CRUDQ1 {
	public static void main(String[] args) throws Exception {
		DepartmentDao departmentDao = new DepartmentDao();
		departmentDao.getAccount();
	}
}

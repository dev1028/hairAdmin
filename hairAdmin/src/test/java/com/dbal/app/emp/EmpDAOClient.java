package com.dbal.app.emp;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dbal.app.emp.mapper.EmpDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/config/*-context.xml")

public class EmpDAOClient {

    @Autowired
    EmpDAO dao;

    @Test
    public void empListTest() {
        EmpVOvo empVO = new EmpVOvo(); 
        //empVO.setDepartment_id("10");
        //empVO.setEmployee_id("100");
        //empVO.setSalary(3000);
        //empVO.setFirst_name("sun");
        empVO.setEmployeeIds(new Integer[] {100,101,102});
        List<EmpVOvo> list = dao.getEmpList(empVO);
        System.out.println(list);
    }

    //@Test
    public void getEmp() {
        EmpVOvo paraVO = new EmpVOvo();
        paraVO.setEmployeeId("100");
        EmpVOvo resultVO = dao.getEmp(paraVO);
        System.out.println(resultVO);
    }

    //@Test @Ignore
    public void insertEmp() {
  
  //      dao.insertEmp(paraVO);
    }
}

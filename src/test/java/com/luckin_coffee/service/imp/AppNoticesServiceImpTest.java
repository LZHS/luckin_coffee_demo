package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.AppNotice;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class AppNoticesServiceImpTest {
    @Autowired
    AppNoticeServiceImp serviceImp;

    @Test
    public void findOne(){
       AppNotice notics= serviceImp.findOne("1597818873300545668");
        System.out.println(notics);
    }
}

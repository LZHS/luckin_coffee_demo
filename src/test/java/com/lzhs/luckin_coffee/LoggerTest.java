package com.lzhs.luckin_coffee;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class LoggerTest {

    @Test
    public  void test01(){
        log.debug("debug....");
        log.info("info....");
        log.error("erroe....");

    }


}

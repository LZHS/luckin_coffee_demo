package com.lzhs.luckin_coffee;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LuckinCoffeeApplicationTests {
    private final Logger logger= LoggerFactory.getLogger(LuckinCoffeeApplicationTests.class);

    @Test
    void contextLoads() {
        logger.debug("debug....");
        logger.info("info....");
        logger.error("error....");

    }

}

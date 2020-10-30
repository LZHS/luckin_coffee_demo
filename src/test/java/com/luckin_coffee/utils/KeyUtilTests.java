package com.luckin_coffee.utils;

import org.junit.jupiter.api.Test;


public class KeyUtilTests {
    @Test
    void contextLoads() {
        for (int i = 0; i < 10; i++) {
            System.out.println(KeyUtil.genUniqueKey());
        }
    }
}

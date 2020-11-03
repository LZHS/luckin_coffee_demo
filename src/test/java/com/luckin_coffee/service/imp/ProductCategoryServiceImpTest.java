package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.product.ProductCategory;
import com.luckin_coffee.service.ProductCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Slf4j
class ProductCategoryServiceImpTest {
    @Autowired
    ProductCategoryService service;

    @Test
    void findOne() {
        ProductCategory category = service.findOne(1);
        log.info(category.toString());
        Assert.assertNotNull(category);
    }

    @Test
    void findAll() {
        List<ProductCategory> categories = service.findAll();
        log.info("categories.size = " + categories.size() + " ; info = " + categories.toString());
        Assert.assertTrue(categories.size() > 0);
    }

    @Test
    void findByCategoryTypeIn() {
        List<ProductCategory> categories = service.findByCategoryTypeIn(Arrays.asList(2, 3, 4));
        log.info("categories.size = " + categories.size() + " ; info = " + categories.toString());
        Assert.assertTrue(categories.size() > 0);
    }

    @Test
    void save() {
        ProductCategory category = new ProductCategory();
        category.setCategoryName("测试 Category");
        category.setCategorySort(9);
        category.setCategoryType(9);

        ProductCategory res = service.save(category);
        log.info("res = " + res.toString());
        Assert.assertNotNull(res);
    }
}
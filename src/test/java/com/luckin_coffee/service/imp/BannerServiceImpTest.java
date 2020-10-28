package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.banner.Banner;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Transient;


@SpringBootTest
@Transactional
class BannerServiceImpTest {
    @Autowired
    BannerServiceImp service;

    @Test
    void saveBanner() {
        Banner banner = new Banner();
        banner.setId(2);
        banner.setName("测试");
        banner.setDescription("");
        Banner res = service.saveBanner(banner);
        Assert.assertEquals(res.getId(), 2);
    }

    @Test
    void findById() {
    }

    @Test
    void updateBanner() {
    }

    @Test
    void removeBannerById() {
    }

    @Test
    void queryBannerList() {
    }

    @Test
    void updateBannerItem() {
    }

    @Test
    void queryBannerItemList() {
    }

    @Test
    void saveBannerItem() {
    }
}
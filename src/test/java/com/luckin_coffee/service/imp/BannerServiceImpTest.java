package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.banner.Banner;
import com.luckin_coffee.beans.banner.BannerItem;
import com.luckin_coffee.utils.KeyUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@SpringBootTest
@Transactional
@Slf4j
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
        log.info(res.toString());
        Assert.assertEquals(res.getId().intValue(), 2);
    }

    @Test
    void findById() {
        Banner res = service.findById(1);
        log.info(res.toString());
        Assert.assertNotNull(res);
    }

    @Test
    void updateBanner() {
        Banner banner = service.findById(1);
        banner.setDescription("Description");
        Banner res = service.saveBanner(banner);
        log.info(res.toString());
        Assert.assertEquals(res.getDescription(), "Description");
    }

    @Test
    void removeBannerById() {
    }

    @Test
    void queryBannerList() {
        List<Banner> banners = service.queryBannerList();
        log.info("查询到的 结果 ：" + banners.size());
        Assert.assertTrue(banners.size() > 0);
    }

    @Test
    void updateBannerItem() {
        BannerItem bannerItem = new BannerItem();
        bannerItem.setId(KeyUtil.genUniqueKey());
        bannerItem.setImgPath("image");
        bannerItem.setAction(0);
        bannerItem.setBannerId(1);
        BannerItem res = service.updateBannerItem(bannerItem);
        log.info(res.toString());
        Assert.assertNotNull(res);
    }

    @Test
    void queryBannerItemList() {
        List<Integer> bannerId = Arrays.asList(1,2);
        List<BannerItem> bannerItems = service.queryBannerItemList(bannerId);
        Assert.assertTrue(bannerItems.size() == 6);
    }

    @Test
    void saveBannerItem() {
    }
}
package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.AppInfo;
import com.luckin_coffee.utils.KeyUtil;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SpringBootTest
public class AppInfoServiceImpTest {

    @Autowired
    private AppInfoServiceImp service;

    @Test
    public void findOne() throws Exception {
        AppInfo appInfo = service.findOne("1597818873300545668");
        Assert.assertNotNull("c查询一条记录", appInfo);
    }

    @Test
    public void save() {
        AppInfo info = new AppInfo();
        info.setAppId(KeyUtil.genUniqueKey());
        info.setAppDescription("测试数据");
        info.setAppUrl("APP 下载地址");
        info.setAppVersion("V1.0.0");
        info.setAppVersionCode(1);
        info.setEnabledStatus(true);
        info.setPlatformtName("Android");
        AppInfo saveInfo = service.save(info);
        Assert.assertNotNull("保存一条记录", saveInfo);
    }

    @Test
    public void findAll() {
        List<AppInfo> appInfos = service.findAll();
        Assert.assertEquals(appInfos.size(), 2);
    }

}

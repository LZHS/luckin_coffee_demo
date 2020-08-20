package com.luckin_coffee.repository;

import com.luckin_coffee.beans.AppInfo;
import com.luckin_coffee.utils.KeyUtil;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class AppInfoServiceRepositoryTest {
    @Autowired
    AppInfoServiceRepository repository;
    @Test
    public void save(){
        AppInfo info=new AppInfo();
        info.setAppId(KeyUtil.genUniqueKey());
        info.setAppDescription("测试数据");
        info.setAppUrl("APP 下载地址");
        info.setAppVersion("V1.0.0");
        info.setAppVersionCode(1);
        info.setEnabledStatus(true);
        info.setPlatformtName("Android");
        AppInfo saveInfo= repository.save(info);
        Assert.assertNotNull("保存 详情测试 ",saveInfo);
    }
}

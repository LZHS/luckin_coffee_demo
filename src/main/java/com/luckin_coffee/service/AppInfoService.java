package com.luckin_coffee.service;

import com.luckin_coffee.beans.AppInfo;

import java.util.List;

public interface AppInfoService {

    AppInfo findOne(String appId);

    List<AppInfo> findAll();

    AppInfo save(AppInfo appInfo);

    List<AppInfo> update(List<AppInfo> appInfos);

}

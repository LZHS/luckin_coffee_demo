package com.luckin_coffee.service;

import com.luckin_coffee.beans.AppNotice;

import java.util.List;

public interface AppNoticeService {

    AppNotice findOne(String appId);

    List<AppNotice> findAll();

    AppNotice save(AppNotice appNotices);

    List<AppNotice> update(List<AppNotice> appNotices);

}

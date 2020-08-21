package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.AppNotice;
import com.luckin_coffee.enums.ResultEnum;
import com.luckin_coffee.exception.CommonException;
import com.luckin_coffee.repository.AppNoticeServiceRepository;
import com.luckin_coffee.service.AppNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class AppNoticeServiceImp implements AppNoticeService {
    @Autowired
    private AppNoticeServiceRepository repository;


    @Override
    public AppNotice findOne(String appId) {
        return repository.findByAppId(appId).orElse(null);
    }

    @Override
    public List<AppNotice> findAll() {
        return repository.findAll();
    }

    @Override
    public AppNotice save(AppNotice appNotics) {
        return repository.save(appNotics);
    }

    @Override
    public List<AppNotice> update(List<AppNotice> appNotics) {
        return repository.saveAll(appNotics);
    }

}

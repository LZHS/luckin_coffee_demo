package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.AppInfo;
import com.luckin_coffee.enums.ResultEnum;
import com.luckin_coffee.exception.CommonException;
import com.luckin_coffee.repository.AppInfoServiceRepository;
import com.luckin_coffee.service.AppInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class AppInfoServiceImp implements AppInfoService {
    @Autowired
    private AppInfoServiceRepository repository;


    @Override
    public AppInfo findOne(String appId) {
       return repository.findById(appId).orElse(null);
    }

    @Override
    public List<AppInfo> findAll() {
        return repository.findAll();
    }

    @Override
    public AppInfo save(AppInfo appInfo) {
        return repository.save(appInfo);
    }

    @Override
    public List<AppInfo> update(List<AppInfo> appInfos) {

        return null;
    }
}

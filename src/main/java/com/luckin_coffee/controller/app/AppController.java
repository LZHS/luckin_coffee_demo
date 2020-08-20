package com.luckin_coffee.controller.app;

import com.luckin_coffee.beans.AppInfo;
import com.luckin_coffee.beans.VO.ResultVO;
import com.luckin_coffee.enums.ResultEnum;
import com.luckin_coffee.exception.CommonException;
import com.luckin_coffee.service.AppInfoService;
import com.luckin_coffee.utils.ResultVOUtil;
import com.sun.xml.bind.v2.schemagen.xmlschema.Appinfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * app 版本查询
 */
@RestController()
@RequestMapping("/app")
@Slf4j
public class AppController {
    @Autowired
    AppInfoService service;

    @GetMapping("/getAppVersion")
    public ResultVO<AppInfo> getAppVersion(@RequestParam("appId") String appId) {
        if (StringUtils.isEmpty(appId)) {
            log.error("AppController - getAppVersion  appId 为空");
            throw new CommonException(ResultEnum.PARAM_ERROR);
        }
        return ResultVOUtil.success(service.findOne(appId));
    }
}

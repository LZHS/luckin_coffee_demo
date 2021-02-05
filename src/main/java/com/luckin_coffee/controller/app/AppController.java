package com.luckin_coffee.controller.app;

import com.luckin_coffee.beans.AppInfo;
import com.luckin_coffee.beans.AppNotice;
import com.luckin_coffee.beans.VO.AppInfoVO;
import com.luckin_coffee.beans.VO.AppNoticeVO;
import com.luckin_coffee.beans.VO.ResultVO;
import com.luckin_coffee.enums.ResultEnum;
import com.luckin_coffee.exception.CommonException;
import com.luckin_coffee.service.AppInfoService;
import com.luckin_coffee.service.AppNoticeService;
import com.luckin_coffee.service.imp.AppNoticeServiceImp;
import com.luckin_coffee.utils.ResultVOUtil;
import com.sun.xml.bind.v2.schemagen.xmlschema.Appinfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * app 版本查询
 */
@RestController()
@RequestMapping("/app")
@Slf4j
public class AppController {
    @Autowired
    AppInfoService appService;
    @Autowired
    AppNoticeService noticeSrvice;

    @GetMapping("/getAppVersion")
    public ResultVO getAppVersion(@RequestParam("appId") String appId) {
        Map<String, Object> result = new HashMap();
        if (StringUtils.isEmpty(appId)) {
            log.error("AppController - getAppVersion  appId 为空");
            throw new CommonException(ResultEnum.PARAM_ERROR);
        }
        // 添加 app 版本信息
        AppInfo info = appService.findOne(appId);
        if (info != null) {
            AppInfoVO  appInfoVO = new AppInfoVO();
            BeanUtils.copyProperties(appService.findOne(appId), appInfoVO);
            result.put("appInfo", appInfoVO);
        }
        // 查询 公告信息
        AppNotice appNotice = noticeSrvice.findOne(appId);
        if (appNotice != null) {
            AppNoticeVO  appNoticeVO = new AppNoticeVO();
            BeanUtils.copyProperties(appNotice, appNoticeVO);
            result.put("appNoticeInfo", appNoticeVO);
        }
        return ResultVOUtil.success(result);
    }

    @GetMapping("/getCode")
    public ResultVO getCode(@RequestParam("phone")String phone){
        ResultVO resultVO=null;

        return  resultVO;
    }

}

package com.luckin_coffee.controller.app;

import com.luckin_coffee.beans.VO.BannerVO;
import com.luckin_coffee.beans.VO.ResultVO;
import com.luckin_coffee.service.BannerService;
import com.luckin_coffee.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 改控制器将控制 首页所有请求
 */
@RestController()
@RequestMapping("/home")
@Slf4j
public class HomeController {

    @Autowired
    BannerService bannerService;

    @GetMapping("/getBanner")
    public ResultVO getAppVersion() {
        List<BannerVO> result = new ArrayList();
        List<Integer> bannerIds = bannerService.queryBannerList().stream().map((elemen) -> {
            BannerVO vo = new BannerVO();
            BeanUtils.copyProperties(elemen, vo);
            result.add(vo);
            return elemen.getId();
        }).collect(Collectors.toList());
        log.info(bannerIds.toString());
        bannerService.queryBannerItemList(bannerIds);

        return ResultVOUtil.success("test");

    }
}

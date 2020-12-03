package com.luckin_coffee.controller.app;

import com.luckin_coffee.beans.VO.BannerVO;
import com.luckin_coffee.beans.VO.ResultVO;
import com.luckin_coffee.beans.banner.Banner;
import com.luckin_coffee.beans.banner.BannerItem;
import com.luckin_coffee.service.BannerService;
import com.luckin_coffee.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
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

    /**
     * 根据 APP 本地最新数据更新Banner 数据
     *
     * @return
     */
    @GetMapping("/getBanner")
    public ResultVO getBanner() {
        List<BannerVO> banners = bannerService.findByIsDisable()
                .stream()
                .map((element) -> {
                    BannerVO bannerVO = new BannerVO();
                    BeanUtils.copyProperties(element, bannerVO);
                    return bannerVO;
                }).collect(Collectors.toList());
        return ResultVOUtil.success(banners);
    }
}

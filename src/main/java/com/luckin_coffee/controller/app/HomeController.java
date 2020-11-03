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

    @GetMapping("/getBanner")
    public ResultVO getAppVersion() {
        List<Banner> banners = bannerService.queryBannerList();
        List<Integer> bannerIds = banners
                .stream()
                .map((element) -> element.getId())
                .collect(Collectors.toList());

        log.info(bannerIds.toString());
        Map<Integer, List<BannerItem>> bannerItems = bannerService
                .queryBannerItemList(bannerIds)
                .stream()
                .collect(Collectors.groupingBy(BannerItem::getBannerId));

        List<BannerVO> result = banners
                .stream()
                .map((element) -> {
                    BannerVO bannerVO = new BannerVO();
                    BeanUtils.copyProperties(element, bannerVO);
                    List<BannerItem> bannerList = bannerItems.get(element.getId());
                    if (bannerList != null && bannerList.size() > 0) {// 有可能出现  bannerItem 没有 对应的 banner 的情况
                        List<BannerVO.BannerItemVO> items = bannerList.stream()
                                .map((item) -> {
                                    BannerVO.BannerItemVO itemVO = new BannerVO.BannerItemVO();
                                    BeanUtils.copyProperties(item, itemVO);
                                    return itemVO;
                                })
                                .collect(Collectors.toList());
                        bannerVO.setBanners(items);
                    }
                    return bannerVO;
                })
                .collect(Collectors.toList());
        return ResultVOUtil.success(result);
    }
}

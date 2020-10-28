package com.luckin_coffee.service;

import com.luckin_coffee.beans.banner.Banner;
import com.luckin_coffee.beans.banner.BannerItem;

import java.util.List;

public interface BannerService {

    /**
     * 创建保存一个 Banner
     *
     * @param bean
     */
    Banner saveBanner(Banner bean);

    /**
     * 根据 id 查询一个 Banner
     *
     * @param id
     * @return
     */
    Banner findById(Integer id);

    /**
     * 更新Banner
     *
     * @param bean
     */
    Banner updateBanner(Banner bean);

    /**
     * 根据ID 删除 banner
     *
     * @param id
     */
    void removeBannerById(Integer id);

    /**
     * 查询所有的 banner
     *
     * @return
     */
    List<Banner> queryBannerList();

    /**
     * 更新BannerItem
     *
     * @param bean
     */
    BannerItem updateBannerItem(BannerItem bean);


    /**
     * 根据 Banner id 查询所有的 bannerItem
     *
     * @return
     */
    List<BannerItem> queryBannerItemList(List<Integer> bannerIds);

    /**
     * 创建保存一个 BannerItem
     *
     * @param bean
     */
    BannerItem saveBannerItem(BannerItem bean);

}

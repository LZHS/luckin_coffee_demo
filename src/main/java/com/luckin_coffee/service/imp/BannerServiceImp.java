package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.banner.Banner;
import com.luckin_coffee.beans.banner.BannerItem;
import com.luckin_coffee.repository.BannerItemServiceRepository;
import com.luckin_coffee.repository.BannerServiceRepository;
import com.luckin_coffee.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerServiceImp implements BannerService {
    @Autowired
    BannerServiceRepository bannerRepository;

    @Autowired
    BannerItemServiceRepository bannerItemRepository;

    @Override
    public Banner saveBanner(Banner bean) {
        return bannerRepository.save(bean);
    }

    @Override
    public Banner findById(Integer id) {
        return bannerRepository.findById(id).get();
    }

    @Override
    public Banner updateBanner(Banner bean) {
        return saveBanner(bean);
    }

    @Override
    public void removeBannerById(Integer id) {
        bannerRepository.deleteById(id);
    }

    @Override
    public List<Banner> queryBannerList() {
        return bannerRepository.findAll();
    }

    @Override
    public BannerItem updateBannerItem(BannerItem bean) {
        return null;
    }

    @Override
    public List<BannerItem> queryBannerItemList(List<Integer> bannerIds) {
        return null;
    }

    @Override
    public BannerItem saveBannerItem(BannerItem bean) {
        return null;
    }
}

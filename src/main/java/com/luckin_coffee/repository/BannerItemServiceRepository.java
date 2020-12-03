package com.luckin_coffee.repository;

import com.luckin_coffee.beans.banner.BannerItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface BannerItemServiceRepository extends JpaRepository<BannerItem,String> , JpaSpecificationExecutor<BannerItem> {
    List<BannerItem> findByIsDisable(Integer isDisable);
}

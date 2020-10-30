package com.luckin_coffee.repository;

import com.luckin_coffee.beans.banner.BannerItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BannerItemServiceRepository extends JpaRepository<BannerItem,String> , JpaSpecificationExecutor<BannerItem> {
}

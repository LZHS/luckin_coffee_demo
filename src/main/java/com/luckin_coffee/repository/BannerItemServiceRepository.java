package com.luckin_coffee.repository;

import com.luckin_coffee.beans.banner.BannerItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BannerItemServiceRepository extends JpaRepository<BannerItem,String> {

}

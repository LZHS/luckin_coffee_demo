package com.luckin_coffee.repository;

import com.luckin_coffee.beans.banner.Banner;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BannerServiceRepository extends JpaRepository<Banner,Integer> {


}

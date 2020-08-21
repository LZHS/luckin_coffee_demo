package com.luckin_coffee.repository;

import com.luckin_coffee.beans.AppNotice;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AppNoticeServiceRepository extends JpaRepository<AppNotice,String> {
    Optional<AppNotice> findByAppId(String appId);
}

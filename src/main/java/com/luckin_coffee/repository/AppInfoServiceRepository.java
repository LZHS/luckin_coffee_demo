package com.luckin_coffee.repository;

import com.luckin_coffee.beans.AppInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppInfoServiceRepository extends JpaRepository<AppInfo,String> {


}

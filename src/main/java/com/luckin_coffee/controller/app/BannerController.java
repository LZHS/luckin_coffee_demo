package com.luckin_coffee.controller.app;

import com.luckin_coffee.beans.banner.Banner;
import com.luckin_coffee.service.BannerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 该控制器将控制 Baner
 */

@RestController()
@RequestMapping("/menu")
@Slf4j
public class BannerController {
    @Autowired
    BannerService service;



}

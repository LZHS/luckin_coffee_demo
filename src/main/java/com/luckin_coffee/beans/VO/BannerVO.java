package com.luckin_coffee.beans.VO;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class BannerVO {

    /**
     * Banner 名称， 通常作为标识
     */
    private String name;
    /**
     * Banner 描述
     */
    private String description;

    /**
     * banner Item  集合
     */
    private List<BannerItemVO> banners;

    @Data
    public static class BannerItemVO {
        /**
         * banner ID
         */
        private String id;
        /**
         * Banner 显示的图片
         */
        private String imgPath;
        /**
         * 跳转类型， 可能无导向（0）、可能导向商品（1）、可能导向活动（2）、可能又有可能导向其他
         */
        private int action;
    }
}

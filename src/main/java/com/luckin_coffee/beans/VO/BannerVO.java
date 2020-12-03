package com.luckin_coffee.beans.VO;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.luckin_coffee.utils.serializer.Date2LongSerializer;
import lombok.Data;

import java.util.Date;


@Data
public class BannerVO {
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

    /**
     * 外键 关联 banner 表
     */
    private int bannerId;

    /**
     * 更新时间.
     */
    private Date updateTime;
}

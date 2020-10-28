package com.luckin_coffee.beans.banner;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.luckin_coffee.utils.serializer.Date2LongSerializer;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@DynamicInsert
public class BannerItem implements Serializable {
    private static final long serialVersionUID = -7740618595947761463L;
    /**
     * banner ID
     */
    @Id
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
     * 创建时间.
     */
    @JsonSerialize(using = Date2LongSerializer.class)
    private Date createTime;

    /**
     * 更新时间.
     */
    @JsonSerialize(using = Date2LongSerializer.class)
    private Date updateTime;
}

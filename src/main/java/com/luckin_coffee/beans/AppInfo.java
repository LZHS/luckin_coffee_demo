package com.luckin_coffee.beans;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.luckin_coffee.utils.serializer.Date2LongSerializer;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@DynamicInsert
public class AppInfo implements Serializable {
    private static final long serialVersionUID = 4996878151888767937L;
    /**
     * app 应用 ID
     */
    @Id
    private String appId;
    /**
     * 平台名称
     */
    private String platformtName;
    /**
     * app 版本号名称
     */
    private String appVersion;
    /**
     * app 版本号
     */
    private Integer appVersionCode;
    /**
     * app 应用 下载地址
     */
    private String appUrl;
    /**
     * app 信息 描述
     */
    private String appDescription;
    /**
     * APP状态,0可用1不可用
     */
    private boolean enabledStatus;

    /** 创建时间. */
    @JsonSerialize(using = Date2LongSerializer.class)
    private Date createTime;

    /** 更新时间. */
    @JsonSerialize(using = Date2LongSerializer.class)
    private Date updateTime;
}

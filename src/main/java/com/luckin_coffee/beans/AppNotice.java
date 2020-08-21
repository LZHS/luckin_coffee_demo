package com.luckin_coffee.beans;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.luckin_coffee.utils.serializer.Date2LongSerializer;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@DynamicInsert
public class AppNotice implements Serializable {
    private static final long serialVersionUID = 957085224654685767L;
    /**
     * 公告 ID
     */
    @Id
    private String noticeId;
    /**
     * App平台对应 APPID
     */
    private String appId;
    /**
     * 公告生效时间
     */
    private String forceTime;
    /**
     * 公告有效时长（单位小时）
     */
    private Integer validDuration;
    /**
     * 公告是否永久有效 0有效1短时间有效
     */
    private boolean isEverValid;
    /**
     * 公告信息 信息 描述
     */
    private String noticeInfo;
    /**
     * APP状态,0可用1不可用
     */
    private boolean enabledStatus;
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

package com.luckin_coffee.beans.VO;

import lombok.Data;

import java.io.Serializable;

@Data
public class AppNoticeVO implements Serializable {
    private static final long serialVersionUID = -956595462568838651L;
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
}

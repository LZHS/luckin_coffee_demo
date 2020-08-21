package com.luckin_coffee.beans.VO;

import lombok.Data;
import java.io.Serializable;

@Data
public class AppInfoVO implements Serializable {
    private static final long serialVersionUID = -6284510999426146173L;
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
     * 是否强制用户更新升级,0可用1不可用
     */
    private boolean isForceUpdate;
}

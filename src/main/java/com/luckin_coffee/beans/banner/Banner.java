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
public class Banner implements Serializable {
    private static final long serialVersionUID = -7749618595947761463L;
    /**
     * banner ID
     */
    @Id
    @GeneratedValue
    private Integer id;
    /**
     * Banner 名称， 通常作为标识
     */
    private String name;
    /**
     * Banner 描述
     */
    private String description;

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

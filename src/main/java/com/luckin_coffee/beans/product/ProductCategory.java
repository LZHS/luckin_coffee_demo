package com.luckin_coffee.beans.product;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.luckin_coffee.utils.serializer.Date2LongSerializer;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

@Entity
@DynamicUpdate
@Data
public class ProductCategory implements Serializable {

    private static final long serialVersionUID = 1976337631555035953L;
    /** 类目id. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    /** 类目名字. */
    private String categoryName;

    /** 类目排序. */
    private Integer categorySort;
    /** 类目编号. */
    private Integer categoryType;

    @JsonSerialize(using = Date2LongSerializer.class)
    private Date createTime;

    @JsonSerialize(using = Date2LongSerializer.class)
    private Date updateTime;


}
package com.luckin_coffee.exception;

import com.luckin_coffee.enums.ResultEnum;
import lombok.Getter;

@Getter
public class CommonException extends RuntimeException{

    private Integer code;

    public CommonException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());
        this.code = resultEnum.getCode();
    }

    public CommonException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}

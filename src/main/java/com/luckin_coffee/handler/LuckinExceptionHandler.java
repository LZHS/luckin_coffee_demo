package com.luckin_coffee.handler;

import com.luckin_coffee.beans.VO.ResultVO;
import com.luckin_coffee.enums.ResultEnum;
import com.luckin_coffee.exception.CommonException;
import com.luckin_coffee.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
@Slf4j
public class LuckinExceptionHandler {

    @ExceptionHandler(value = CommonException.class)
    @ResponseBody
    public ResultVO handlerCommonException(CommonException e) {
        return ResultVOUtil.error(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResultVO handlerException(Exception e) {
        log.error(e.toString());
        return ResultVOUtil.error(ResultEnum.FALL.getCode(), ResultEnum.FALL.getMessage());
    }
}

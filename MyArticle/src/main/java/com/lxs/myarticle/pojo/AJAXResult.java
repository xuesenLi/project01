package com.lxs.myarticle.pojo;

/**
 * @author Mr.Li
 * @date 2019/7/22 - 22:39
 */
public class AJAXResult {
    private boolean success;
    private Object data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}

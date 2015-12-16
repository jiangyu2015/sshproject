package com.dto.common;

/**
 * jiangyukun on 2015-11-05 13:42
 */
public class JsonResponse<T> {
    public static final int SUCCESS_CODE = 0;
    public static final int FAILURE_CODE = 1;
    public static final String SUCCESS_MESSAGE = "success";
    public static final String FAILURE_MESSAGE = "failure";

    private int code;
    private String message;
    private T data;

    public void setSuccess(T data) {
        this.code = 1;
        this.message = SUCCESS_MESSAGE;
        this.data = data;
    }

    public JsonResponse() {
        this.code = SUCCESS_CODE;
        this.message = SUCCESS_MESSAGE;
        this.data = null;
    }

    public JsonResponse(T data) {
        this.code = SUCCESS_CODE;
        this.message = SUCCESS_MESSAGE;
        this.data = data;
    }

    public JsonResponse<T> error() {
        this.setCode(FAILURE_CODE);
        this.setMessage(FAILURE_MESSAGE);
        return this;
    }

    public JsonResponse<T> error(int code) {
        this.setCode(code);
        this.setMessage(FAILURE_MESSAGE);
        return this;
    }

    public JsonResponse<T> error(String message) {
        this.setCode(FAILURE_CODE);
        this.setMessage(message);
        return this;
    }

    public JsonResponse<T> error(int code, String message) {
        if (code == SUCCESS_CODE) throw new IllegalArgumentException("error code can't be 0");
        this.setCode(code);
        this.setMessage(message);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}

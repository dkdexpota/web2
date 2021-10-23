package com.example.dd;

import java.io.Serializable;

public class RequestData implements Serializable {
    private static final long serialVersionUID = 2041275512219239990L;
    private float x;
    private float y;
    private float r;
    private boolean check;
    public RequestData(){}

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getR() {
        return r;
    }

    public void setR(float r) {
        this.r = r;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }
}

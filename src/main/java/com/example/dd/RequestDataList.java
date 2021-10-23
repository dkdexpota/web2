package com.example.dd;

import java.util.ArrayList;
import java.util.List;

public class RequestDataList {
    private List<com.example.dd.RequestData> requestDataList = new ArrayList<>();

    public List<com.example.dd.RequestData> getRequestDataList() {
        return requestDataList;
    }
    public void addData (com.example.dd.RequestData data) {
        this.requestDataList.add(data);
    }
    public int getLen () {return this.requestDataList.size();}
}

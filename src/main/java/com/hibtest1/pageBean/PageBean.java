package com.hibtest1.pageBean;
import com.dto.CommodityDto;
import com.hibtest1.entity.Goods;
import com.hibtest1.entity.Producer;

import java.util.List;

public class PageBean {
    private int allRow;
    private int totalPage;
    private int currentPage;
    private int pageSize;
    private boolean isFirstPage;
    private boolean isLastPage;
    private boolean hasPreviousPage;
    private boolean hasNextPage;
    private List<Goods> listGoods;
    private List<CommodityDto> listCommodityDto;
    private List<Producer> listProducer;

    public List<Producer> getListProducer() {
        return listProducer;
    }

    public void setListProducer(List<Producer> listProducer) {
        this.listProducer = listProducer;
    }

    public List<CommodityDto> getListCommodityDto() {
        return listCommodityDto;
    }

    public void setListCommodityDto(List<CommodityDto> listCommodityDto) {
        this.listCommodityDto = listCommodityDto;
    }

    public List<Goods> getListGoods() {
        return listGoods;
    }
    public void setLisGoods(List<Goods> listGoods) {
        this.listGoods = listGoods;
    }

    public int getAllRow() {
        return allRow;
    }
    public void setAllRow(int allRow) {
        this.allRow = allRow;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public boolean isFirstPage() {
        return isFirstPage;
    }
    public void setFirstPage(boolean isFirstPage) {
        this.isFirstPage = isFirstPage;
    }
    public boolean isLastPage() {
        return isLastPage;
    }
    public void setLastPage(boolean isLastPage) {
        this.isLastPage = isLastPage;
    }
    public boolean isHasPreviousPage() {
        return hasPreviousPage;
    }
    public void setHasPreviousPage(boolean hasPreviousPage) {
        this.hasPreviousPage = hasPreviousPage;
    }
    public boolean isHasNextPage() {
        return hasNextPage;
    }
    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public void init(){
        this.isFirstPage = isFirstPage;
        this.isLastPage = isLastPage;
        this.hasPreviousPage = hasPreviousPage;
        this.hasNextPage = hasNextPage;
    }

    public static int countTatalPage(final int pageSize,final int allRow){
        int toalPage = allRow % pageSize == 0 ? allRow/pageSize : allRow/pageSize + 1;
        return toalPage;
    }

    public static int countOffset(final int pageSize,final int currentPage){
        final int offset = pageSize * (currentPage - 1);
        return offset;
    }

    public static int countCurrentPage(int page){
        final int curpage = (page == 0 ? 1 : page);
        return curpage;
    }
}





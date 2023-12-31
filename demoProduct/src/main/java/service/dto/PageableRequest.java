package service.dto;

import service.dto.enums.ESortType;

public class PageableRequest {
    private String search;

    private String sortField;

    private ESortType sortType;
    private Integer page;

    private Integer limit;

    private Integer totalPage;

    public PageableRequest() {
    }

    public PageableRequest(String search, String sortField, ESortType sortType, Integer page, Integer limit) {
        this.search = search;
        this.sortField = sortField;
        this.sortType = sortType;
        this.page = page;
        this.limit = limit;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getSortField() {
        return sortField;
    }

    public void setSortField(String sortField) {
        this.sortField = sortField;
    }

    public ESortType getSortType() {
        return sortType;
    }

    public void setSortType(ESortType sortType) {
        this.sortType = sortType;
    }
}

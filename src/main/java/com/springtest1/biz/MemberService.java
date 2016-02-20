package com.springtest1.biz;

import com.hibtest1.pageBean.PageBean;

/**
 * Created by dell on 2016/2/20.
 */
public interface MemberService {
//省略其他的代码

/** *//**
     * 分页查询
     * @param currentPage 当前第几页
     * @param pageSize 每页大小
     * @return 封闭了分页信息(包括记录集list)的Bean
     */
    public PageBean queryForPage(int pageSize, int currentPage);

}


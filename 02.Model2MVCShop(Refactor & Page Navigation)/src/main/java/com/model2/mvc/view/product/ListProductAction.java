package com.model2.mvc.view.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class ListProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Search search = new Search();
		String menu = request.getParameter("menu");		
		
		int currentPage=1;
		if (request.getParameter("currentPage") != null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}//pagenumber�� �������� �Ѿ�� ȭ��
		
		search.setCurrentPage(currentPage);
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchKeyword(request.getParameter("searchKeyword"));
		
		// web.xml  meta-data �� ���� ��� ���� 
		int pageSize = Integer.parseInt( getServletContext().getInitParameter("pageSize"));//5
		int pageUnit  =  Integer.parseInt(getServletContext().getInitParameter("pageUnit"));//3
		search.setPageSize(pageSize);
				
		// Business logic ����
		ProductService productService = new ProductServiceImpl();
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage	= 
				new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("ListProductAction ::"+resultPage);
		
		// Model �� View ����
		request.setAttribute("map", map);
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		
		request.setAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}

}
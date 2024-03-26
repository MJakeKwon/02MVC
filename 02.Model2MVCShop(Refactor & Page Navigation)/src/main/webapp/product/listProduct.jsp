<!-- ��ǰ�����ȸ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@page import="com.model2.mvc.service.domain.User"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page" %>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	String title="";
	
	String menu=(String) request.getAttribute("menu");
	Page resultPage = (Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
	
	Map<String, Object> map = (HashMap<String, Object>) request.getAttribute("map");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

	int maxPage = 0;
	List<Product> list = null;
	if (map != null) {
		maxPage = ((Integer) map.get("totalCount")).intValue();
		list = (List<Product>) map.get("list");
	}




%>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetProductList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listProduct.do?menu=<%=menu %>"
			method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">
								<%title = menu.equals("manage")?"��ǰ����": "��ǰ �����ȸ"; %>
								<%=title %>
								</td>
							</tr>
						</table>
					</td>
						<td width="12" height="37">
							<img src="/images/ct_ttl_img03.gif"		width="12" height="37" />
						</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
				<tr>
				<td align="right">
					<%
						if (search.getSearchCondition() != null) {
					%>
					<td align="right">	<select name="searchCondition"		class="ct_input_g"	 style="width: 80px">
							<%
								if (search.getSearchCondition().equals("0")) {
							%>
								<option value="0">��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>
							<%
								} else {
							%>
								<option value="0">��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>
							<%
								}
							%>
					</select> 
					<input type="text" name="searchKeyword"
						value="<%=search.getSearchKeyword()%>" class="ct_input_g"
						style="width: 200px; height: 19px"></td>
					<%
					} else {
					%>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0">��ǰ��ȣ</option>
							<option value="1">��ǰ��</option>
							<option value="2">��ǰ����</option>
					</select> <input type="text" name="searchKeyword" class="ct_input_g"
						style="width: 200px; height: 19px"></td>
					<%
					}
					%>
				
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetProductList();">�˻�</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>




			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
				<tr>
					<td colspan="11">
							��ü <%=resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage()%> ������
					</td>
				</tr>

				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<%
					int no = list.size();
					for (int i = 0; i < list.size(); i++) {
						Product prod = (Product)list.get(i);
						System.out.println(prod);
				%>

				<tr class="ct_list_pop">
					<td align="center">
						<%=no--%>
					</td>
					<td></td>
					<td align="left">
						<%
							if (((User) session.getAttribute("user")).getRole().equals("admin")){
						%> 
							<a href="/updateProductView.do?prodNo=<%=prod.getProdNo()%>"><%=prod.getProdName()%></a>
						<%
							} else {
						%>
							 <a href="/getProduct.do?prodNo=<%=prod.getProdNo()%>"><%=prod.getProdName()%></a>
						<%
							}
						%>
					</td>
					<td></td>
					<td><%=prod.getPrice()%></td>
					<td></td>
					<td><%=prod.getRegDate()%></td>
					<td></td>
					<%	if (((User) session.getAttribute("user")).getRole().equals("admin")){	%>
							<% if(prod.getProTranCode().equals("0")){ %>
										<td align="left">�Ǹ���</td>
									<%}else if(prod.getProTranCode().equals("1")) {%>
												<td align ="left"> �����Ϸ�
												<a href ="/updateTranCodeByProd.do?tranNo=<%=prod.getTranNo() %>&tranCode=2">����ϱ�</a>
												</td>
									<%}else if(prod.getProTranCode().equals("2")){ %>
											<td align ="left"> �����</td>
									<%}else if(prod.getProTranCode().equals("3")){ %>
											<td align ="left"> ��ۿϷ�</td>
									<%} %>
									<%}else{ %>
										<%if(prod.getProTranCode().equals("0")){ %>
											<td align ="left">�Ǹ���</td>
											<%} else{ %>
														<td align ="left"> ������</td>
													<%} %>
										<%} %>
							</td>
					</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				<% } %>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			 <tr>
               <td align="center">
               		<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
               </td>
            </tr>
			<!--  ������ Navigator �� -->

		</form>

	</div>
</body>
</html>
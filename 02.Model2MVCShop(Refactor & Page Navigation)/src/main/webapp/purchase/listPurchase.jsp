<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="com.model2.mvc.common.*"%>
<%@ page import="com.model2.mvc.service.domain.*"%>
<%@page import="com.model2.mvc.common.*"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
	Search search = (Search) request.getAttribute("search");
	Page resultPage = (Page)request.getAttribute("resultPage");
   
  	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
   
	int maxPage = 0;
	List<Purchase> list = null;
	if (map != null) {
	maxPage = ((Integer) map.get("totalCount")).intValue();
	   list = (List<Purchase>) map.get("list");
	}
   
%>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listUser.do" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü <%=resultPage.getTotalCount()%> �Ǽ�, ���� <%=resultPage.getCurrentPage()%> ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

			
			
			<%
									if(maxPage==0) {
									%>
			<tr class="ct_list_pop"> 
				<td align="center" colspan="100%">���� ������ �����ϴ�.</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
			<%
			} else {
			%>
			<%
			int no=list.size();
					               for(int i=0; i<list.size(); i++) {
					                  Purchase purcahse = (Purchase)list.get(i);
			%>

				<tr class="ct_list_pop">
					<td align="center"><a href="/getPurchase.do?tranNo=<%= purcahse.getTranNo() %>"><%=no--%></a>
					</td>
					<td></td>
					<td align="left"><a href="/getUser.do?userId=<%= purcahse.getBuyer().getUserId() %>"><%= purcahse.getBuyer().getUserId() %></a></td>
					<td></td>
					<td align="left"><%= purcahse.getBuyer().getUserName() %></td>
					<td></td>
					<td align="left"><%= purcahse.getBuyer().getPhone() %></td>
					<td></td>
					<td align="left">
					<% if(purcahse.getTranCode().equals("1")) { %>
					���ſϷ� // ��� �غ����Դϴ�.
					<% } else if(purcahse.getTranCode().equals("2")) { %>
					�����Ͻ� ��ǰ�� ������Դϴ�.
					<% } else if(purcahse.getTranCode().equals("3")) { %>
					[��ǰ ���� �Ϸ�] == ��ǰ �ŷ��� �������ϴ�.
					<% } %> 
					</td>
					<td></td>
					<td align="left">
					<% if(purcahse.getTranCode().equals("2")) { %>
					<a href="/updateTranCodeByProd.do?tranNo=<%= purcahse.getTranNo() %>&tranCode=3"/>���� ����(���� Ȯ��)</a>
					<% } %> 
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			<%} %>
			<%} %>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<% for(int i=1;i<=maxPage;i++){ %> <a
						href="/listPurchase.do?page=<%=i%>"><%=i %></a> <% } %>
					</td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
		</form>

	</div>

</body>
</html>
<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@page import="com.model2.mvc.service.domain.Purchase"%>

<%
Purchase purchase = (Purchase) request.getAttribute("purchase");
%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

	다음과 같이 구매가 되었습니다.

	<table border=1>
		<tr>
			<td>물품번호</td>
			<td><%=purchase.getPurchaseProd().getProdNo()%></td>
			<td></td>
		</tr>
		<tr>
			<td>구매자아이디</td>
			<td><%=purchase.getBuyer().getUserId()%></td>
			<td></td>
		</tr>
		<tr>
			<td>구매방법</td>
			<td>
			
				<%  if (Integer.parseInt(purchase.getPaymentOption()) == 1) { %> 
						현금구매 
				<%	} else { %>

					신용구매 
				<% } %>

			</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자이름</td>
			<td><%=purchase.getReceiverName()%></td>
			<td></td>
		</tr>
		<tr>
			<td>구매자연락처</td>
			<td><%=purchase.getReceiverPhone()%></td>
			<td></td>
		</tr>
		<tr>
			<td>구매자주소</td>
			<td><%=purchase.getDivyAddr()%></td>
			<td></td>
		</tr>
		<tr>
			<td>구매요청사항</td>
			<td><%=purchase.getDivyRequest()%></td>
			<td></td>
		</tr>
		<tr>
			<td>배송희망일자</td>
			<td><%=purchase.getDivyDate()%></td>
			<td></td>
		</tr>
	</table>

</body>
</html>
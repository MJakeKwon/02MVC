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

	������ ���� ���Ű� �Ǿ����ϴ�.

	<table border=1>
		<tr>
			<td>��ǰ��ȣ</td>
			<td><%=purchase.getPurchaseProd().getProdNo()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�����ھ��̵�</td>
			<td><%=purchase.getBuyer().getUserId()%></td>
			<td></td>
		</tr>
		<tr>
			<td>���Ź��</td>
			<td>
			
				<%  if (Integer.parseInt(purchase.getPaymentOption()) == 1) { %> 
						���ݱ��� 
				<%	} else { %>

					�ſ뱸�� 
				<% } %>

			</td>
			<td></td>
		</tr>
		<tr>
			<td>�������̸�</td>
			<td><%=purchase.getReceiverName()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�����ڿ���ó</td>
			<td><%=purchase.getReceiverPhone()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�������ּ�</td>
			<td><%=purchase.getDivyAddr()%></td>
			<td></td>
		</tr>
		<tr>
			<td>���ſ�û����</td>
			<td><%=purchase.getDivyRequest()%></td>
			<td></td>
		</tr>
		<tr>
			<td>����������</td>
			<td><%=purchase.getDivyDate()%></td>
			<td></td>
		</tr>
	</table>

</body>
</html>
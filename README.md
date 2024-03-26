처음에 왜 구매 후 보이는 유저정보가 그대로 뜨는지 몰랐었다. 작동은 다 되는데 이유를 찾아보니 addPurchaseAction에서 session을 가져오는데 user는 login에서 session을 저장해서였다.
ex)user01로 로그인시 user01이 된다. 즉 user01의 정보를 가져와 계속해서 기본 인적사항이 뜨면서 user에 없는 정보들만 갱신이 되는거였다.
그래서 user의 세션은 유지하고 새롭게 업데이트 되는 정보만 가져오게 설정하였다.
addPurchaseView.jsp 창이 구매 하는 창이니 여기에서 사용되는 receiverName 이용하는 것이였다.
AddPurchaseAction에서 view의 내용들을 purchase.setReceiverName(request.getParameter("receiverName"));이런식으로 set 해준다
이걸 addPurchase.jsp 에서 purchase.getReceiverName()으로 user도메인에 저장된 내용을 get해오는것이다.

배송이 안되던건 listProduct 를 purchase 하면서 배송 때문에 수정 했는데 안해서 안돌아갔던것이다.

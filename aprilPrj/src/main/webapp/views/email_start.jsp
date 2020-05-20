<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:redirect url="http://localhost:8080/groupware/mail/do_retrieve.do" >
        <c:param name="searchWord" value="honggd01"/>
        <c:param name="pageNum" value="1"/>
        <c:param name="pageSize" value="10"/>
        <c:param name="searchDiv" value=""/>
</c:redirect>
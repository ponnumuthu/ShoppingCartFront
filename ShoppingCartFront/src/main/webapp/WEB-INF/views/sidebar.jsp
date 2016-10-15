<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="w3-sidenav w3-black" style="width:13%; height: 100%;">
  <br>
  <table class="sidev">
  <c:forEach items="${categoryList}" var="category">
  <tr >
  <td><a href="viewproduct/${category.name}">${category.name}</a></td>
  </tr>
  </c:forEach>
  
  </table>
</nav>


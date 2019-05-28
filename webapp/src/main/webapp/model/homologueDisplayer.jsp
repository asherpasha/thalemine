<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- homologueDisplayer.jsp -->
<div id="homologue-displayer" class="collection-table">

<div class="header">
<h3>Panther Homologs</h3>
    <p>Data Source: <a target="_blank" href="/${WEB_PROPERTIES['webapp.path']}/portal.do?class=DataSet&externalids=Panther+data+set">Panther</a></p>
</div>

<c:choose>
<c:when test="${homologues != null && !empty homologues}">
<c:set var="hmine" value="http://www.humanmine.org/humanmine/portal.do?externalids=" />
<c:set var="ymine" value="http://yeastmine.yeastgenome.org/yeastmine/portal.do?externalids=" />
<c:set var="endurl" value="&class=Gene&origin=ThaleMine" />


<!-- 'horizontal' table
<table class="tiny-font">
  <thead>
  <tr>
    <c:forEach items="${homologues}" var="entry">
      <th><c:out value="${entry.key}"/></th>
    </c:forEach>
  </tr>
  </thead>
  <tbody>
    <tr>
    <c:forEach items="${homologues}" var="entry">
      <c:set var="genes" value="${entry.value}"/>
      <c:choose>
        <c:when test="${empty genes}">
          <td></td>
        </c:when>
        <c:otherwise>
          <td class="one-line">
            <c:forEach items="${genes}" var="resultElement">
            <c:choose>
             <c:when test="${entry.key eq 'A. thaliana'}">
              <a href="report.do?id=${resultElement.id}">${resultElement.field}</a>
             </c:when>
             <c:otherwise>
              ${resultElement.field}
             </c:otherwise>
            </c:choose>
            </c:forEach>
          </td>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    </tr>
  </tbody>
</table>
-->

<table class="tiny-font">
  <tbody>
    <c:forEach items="${homologues}" var="entry">
<tr><th><c:out value="${entry.key}"/></th>
      <c:set var="genes" value="${entry.value}"/>
      <c:choose>
        <c:when test="${empty genes}">
          <td></td>
        </c:when>
        <c:otherwise>
          <td>
            <c:forEach items="${genes}" var="resultElement">
            <!-- only links to ath (aip request, MINE-918) -->
            <c:choose>
             <c:when test="${entry.key eq 'A. thaliana'}">
              <a href="report.do?id=${resultElement.id}">${resultElement.field}</a>
             </c:when>
             <c:when test="${entry.key eq 'H. sapiens'}">
              <a href="${hmine}${resultElement.field}${endurl}">${resultElement.field}</a>
             </c:when>
             <c:when test="${entry.key eq 'S. cerevisiae'}">
              <a href="${ymine}${resultElement.field}${endurl}">${resultElement.field}</a>
             </c:when>
             <c:otherwise>
              ${resultElement.field}
             </c:otherwise>
            </c:choose>
            </c:forEach>
          </td>
        </c:otherwise>
      </c:choose>
      </tr>
    </c:forEach>

  </tbody>
</table>

</c:when>

<c:when test="${homologues != null && empty homologues}">
  <p style="font-style:italic;">No data found</p>
</c:when>
<c:otherwise>
  <p>There was a problem rendering the displayer.</p>
  <script type="text/javascript">
    jQuery('#homologue-displayer').addClass('warning');
  </script>
</c:otherwise>
</c:choose>
</div>

<!-- /homologueDisplayer.jsp -->

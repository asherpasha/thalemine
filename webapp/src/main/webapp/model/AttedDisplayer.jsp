<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<div id="atted_displayer" class="collection-table">

<!-- co-regulation header -->
<div id="atted-section" class="collection-table column-border" style="margin-bottom: 0px">
    <div class="header">
      <h3>Co-expression</h3>
    </div>
</div>

<%-- Change the link here to your displayer --%>
<script charset="utf-8" type="text/javascript" src="js/atted-displayer-1.3.0.js"></script>

<c:set var="object" value="${reportObject.object}"/>
<c:set var="AGI" value="${object.primaryIdentifier}" />

<div id="atted_displayercontainer"></div>

<script type="text/javascript">
    let id = "${AGI}";
    let webapp_url = "https://bar.utoronto.ca/thalemine";
    let attedcallback = function(values) {
        let options = {
            type: 'table',
            url: webapp_url,
            token: $SERVICE.token,
            query: {"model":{"name":"genomic"},"select":["Gene.primaryIdentifier","Gene.symbol"],"orderBy":[{"Gene.primaryIdentifier":"ASC"}],"where":[{"path":"Gene.primaryIdentifier","op":"ONE OF","code":"A","values":values}]}
        };
        if (values == null || values.length < 1) {
            jQuery('#query-container').html("");
            jQuery('#attedexport').hide();
       } else {
            jQuery('#attedexport').show();
            imtables.loadDash('#query-container',
                {start : 0, size : 25},
                {service: $SERVICE, query : options.query}
            ).then(
                withTable,
                FailureNotification.notify
            );
            function withTable(table) {
                table.bus.on('list-action:failure', LIST_EVENTS['list-creation:failure']);
                table.bus.on('list-action:success', LIST_EVENTS['list-creation:success']);
            }
       }
   }
   let attedqueryhook = function() {
       jQuery('#query-container').html("Waiting for results...");
   }
   let opts = {
       target: '#atted_displayercontainer',
       AGIcode: id,
       cutoff: 20,
       service: webapp_url + "/service",
       atted: "https://bar.utoronto.ca/api/proxy/atted_api4"
   };
   let displayer = new AttedDisplayer(opts,attedcallback,attedqueryhook);
</script>

<div id="protocols" style="display: none">
<!-- A place holder element in your page to hold the table -->
<div id="query-container">

</div>
</div>

<p>&nbsp;</p>
</div>
<!-- /ATTED data -->


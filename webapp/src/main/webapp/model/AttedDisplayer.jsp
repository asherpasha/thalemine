<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<div id="atted_displayer" class="collection-table">

<!-- co-regulation header -->
<div id="atted-section" class="collection-table column-border" style="margin-bottom: 0px">

    <div class="header">
      <h3>Co-expression</h3>
<%--       <p>Data source: <a href="http://atted.jp/">ATTED-II</a></p> --%>
    </div>

</div>

<%-- TODO JCVI: Change the link here to your displayer --%>
<script charset="utf-8" type="text/javascript" src="js/atted-displayer-1.2.0.min.js"></script>

<%-- Comment this out because it changes the formatting of the whole report page relative to the rest of the site --%>
<%--<link rel="stylesheet" type="text/css" href="${WEB_PROPERTIES['head.cdn.location']}/css/bootstrap/2.3.2/css/bootstrap.min.css">--%>

<c:set var="object" value="${reportObject.object}"/>
<c:set var="AGI" value="${object.primaryIdentifier}" />

<div id="atted_displayercontainer"></div>
   <script type="text/javascript">
      var id = "${AGI}";
      var webapp_url = "https://bar.utoronto.ca/thalemine";
      var attedcallback = function(values) {
      	var options = {
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
      	  //jQuery('#query-container').imWidget(options);
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
      var attedqueryhook = function() {
          jQuery('#query-container').html("Waiting for results...");
      }
      var opts = {
            target: '#atted_displayercontainer',
            AGIcode: id,
            method: 'mr',
            cutoff: 20,
            guarantee: 10,
            service: webapp_url + "/service",
            atted: "https://apps.araport.org/proxy/atted/API/coex",
            accessToken: "na"
            }
      var displayer = new AttedDisplayer(opts,attedcallback,attedqueryhook);
</script>

<%-- toggle --%>
<script type="text/javascript" charset="utf-8">
jQuery(document).ready(function () {
 jQuery(".tbox").children('doopen').show();
 jQuery(".tbox").children('doclose').hide();
  jQuery('.tbox').click(function () {
  var text = jQuery(this).children('doclose');
  if (text.is(':hidden')) {
       jQuery(this).children('doclose').show("slow");
     } else {
         jQuery(this).children('doopen').show("slow");
      }
   });
  jQuery("doopen").click(function(){
     jQuery(this).toggle("slow");
     return true;
    });
  jQuery("doclose").click(function(){
      jQuery(this).toggle("slow");
        return true;
    });
  });
</script>

<%-- Does not work!
<html:link linkName="#" styleId="sis" style="cursor:pointer">
    <h3 id="attedexport">
        Save / Export
        <img src="images/undisclosed.gif" id="co">
    </h3>

</html:link>
--%>


<script type="text/javascript" charset="utf-8">
    jQuery(document).ready(function () {
        jQuery("#sis").click(function () {
           if(jQuery("#protocols").is(":hidden")) {
             jQuery("#co").attr("src", "images/disclosed.gif");
           } else {
             jQuery("#co").attr("src", "images/undisclosed.gif");
           }
           jQuery("#protocols").toggle("slow");
        });
    })
</script>

<div id="protocols" style="display: none">
<link rel="stylesheet" type="text/css" href="${WEB_PROPERTIES['head.cdn.location']}/js/intermine/im-tables/latest/imtables.css">
<!-- A place holder element in your page to hold the table -->
<div id="query-container">
 <p class="apology">
  Please be patient while the results of your query are retrieved.
 </p>
</div>
</div>

<p>&nbsp;</p>
</div>
<!-- /ATTED data -->



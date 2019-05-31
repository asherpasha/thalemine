<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!-- eFPBrowserDisplayer.jsp -->
<div id="efp_browser_displayer" class="collection-table">

<div class="header">
<h3>eFP Visualization</h3>
    <p>Data Source: <a target="_blank" href="/${WEB_PROPERTIES['webapp.path']}/portal.do?class=DataSet&externalids=Arabidopsis+eFP">BAR</a></p>
</div>

<c:set var="object" value="${reportObject.object}"/>

<c:choose>
<c:when test="${((!empty object.chromosomeLocation && !empty object.chromosome)
                || className == 'Chromosome') && className != 'ChromosomeBand'}">
<br />

<div id="eFPBrowser" class="feature basic-table">
  <c:set var="name" value="${object.primaryIdentifier}"/>
  <c:set var="datasource" value="Developmental_Map"/>

  <style type="text/css">
      #powerby { padding: 5px; text-align: center; }
      #powerby a { color: rgb(136, 136, 136); text-decoration: none; background-color: white; }
      #powerby img { vertical-align: middle; }
  </style>
  <div>
      <input type="hidden" id="agi" value="${name}" />
      <label for="datasource"><strong>Data Source: </strong></label>
      <select id="datasource" name="datasource">
          <option value="Abiotic_Stress">Abiotic Stress</option>
          <option value="Abiotic_Stress_II">Abiotic Stress II</option>
          <option value="Biotic_Stress">Biotic Stress</option>
          <option value="Biotic_Stress_II">Biotic Stress II</option>
          <option value="Chemical">Chemical</option>
          <option value="Development_RMA">Development RMA</option>
          <option value="Developmental_Map">Developmental Map</option>
          <option value="Developmental_Mutants">Developmental Mutants</option>
          <option value="Embryo">Embryo</option>
          <option value="Germination">Germination</option>
          <option value="Guard_Cell">Guard Cell</option>
          <option value="Hormone">Hormone</option>
          <option value="Klepikova_Atlas">Klepikova Atlas</option>
          <option value="Lateral_Root_Initiation">Lateral Root Initiation</option>
          <option value="Light_Series">Light Series</option>
          <option value="Natural_Variation">Natural Variation</option>
          <option value="Regeneration">Regeneration</option>
          <option value="Root">Root</option>
          <option value="Root_II">Root II</option>
          <option value="Seed">Seed</option>
          <option value="Shoot_Apex">Shoot Apex</option>
          <option value="Tissue_Specific">Tissue Specific</option>
      </select>
      <br /><br />
      <div id="eFPimage_loading_progress" style="display: none;">
          <img src="model/images/loading.gif" />
      </div>
      <div id="eFPimage"></div>
  </div>
  <div id="powerby">
      <a onmouseout="this.style.backgroundColor='white';" onmouseover="this.style.backgroundColor='#f1f1d1';" title="BAR Webservices" target="_blank" href="http://bar.utoronto.ca/webservices/">
          Powered by <img border="0/" src="http://bar.utoronto.ca/ntools/bbc_logo_small.gif" height="15" width="15"> BAR Webservices
      </a>
  </div>
  <script type="text/javascript">
    function showImage(obj) {
        var reader = new FileReader();
        reader.onload = function() {
            jQuery('#eFPimage_loading_progress').hide();
            var img = new Image();
            img.src = reader.result;
            jQuery('#eFPimage').html(img);
        };
        reader.readAsDataURL(new Blob([obj], {type: 'image/png'}));
    }

    function loadeFPimage(ds) {
        var bar_eFPBrowser_url = "https://bar.utoronto.ca/webservices/efp_service/efp_service.php";
        var agi = jQuery('#agi').val();
        var datasource = ds || jQuery('#datasource').val();
        var img_not_available = "model/images/eFP_image_not_available.png";

        if(ds !== undefined) {
            jQuery('#datasource option[value="' + ds + '"]').prop('selected', true);
        }

        jQuery('#eFPimage_loading_progress').show();
	// http://bar.utoronto.ca/webservices/efp_service/efp_service.php?request={"agi":"At1g04170","datasource":"Developmental_Map"}
        //var req_url = bar_eFPBrowser_url + "?locus=" + agi + "&source=" + datasource;
        var req_url = bar_eFPBrowser_url + '?request={"agi":"' + agi + '","datasource":"' + datasource + '"}';
        var request = new XMLHttpRequest();
        request.open('GET', req_url, true);
        request.responseType = 'blob';
        request.onload = function () {
            if (this.status === 200) {
                var blob = request.response;
                showImage(blob);
            } else {
                jQuery('#eFPimage_loading_progress').hide();
                jQuery('#eFPimage').html( jQuery('<img>').attr('src', img_not_available) );
            }
        };
        request.onerror = function (e) {
            jQuery('#eFPimage_loading_progress').hide();
            jQuery('#eFPimage').html( jQuery('<img>').attr('src', img_not_available) );
        };
        request.send();
    }

    jQuery(document).ready(function(){
        jQuery('#datasource').bind('change', function() {
            jQuery('#eFPimage').empty();
            jQuery('#eFPimage_loading_progress').show();
            loadeFPimage.apply(this, [undefined])
        });
        jQuery('#datasource').trigger('change');
    });

  </script>
</c:when>
<c:otherwise>
  <p style="font-style:italic;">No BAR eFP visualization available</p>
</c:otherwise>
</c:choose>
</div>
<!-- /eFPBrowserDisplayer.jsp -->

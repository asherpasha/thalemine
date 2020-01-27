<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="im" %>


<!-- dataCategories -->


<html:xhtml/>

<div class="body">

    <%--
    <im:boxarea title="Data" stylename="plainbox">
    <p>ThaleMine integrates data from a large number of sources into a single data warehouse.  This page lists the data that are included in the current release.  Many more data sets will be added in future releases, please contact us if there are any particular data you would like to see included.</p>
    </im:boxarea>
    --%>

    <im:boxarea title="Data" stylename="yellbox">
        <p>ThaleMine integrates data from a large number of sources into a single data warehouse.</p>
        <p>This page lists the data that are included in the current release and it is manually curated; its contents
            are not indexed in our keyword search.</p>
        <p>More data sets will be added in future releases, please <a
                href="mailto:araport@jcvi.org?Subject=Data request"> contact us </a> if there are any particular data
            you would like to see included.</p>
    </im:boxarea>

    <br/>
    <table cellpadding="0" cellspacing="0" border="0" class="dbsources">
        <tr>
            <th>Data Category</th>
            <th>Data</th>
            <th>Source</th>
            <th>PubMed</th>
        </tr>

        <%-- NCBI Genome (FASTA) --%>
        <tr>
            <td rowspan="2" class="leftcol">
                <h2><p>Genome</p></h2>
            </td>
            <td>TAIR10 Genome assembly (5 chromosomes plus chloroplast and mitochondrial assemblies)</td>
            <td>
                <a href="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/735/GCF_000001735.4_TAIR10.1/GCF_000001735.4_TAIR10.1_genomic.fna.gz"
                   target="_blank" class="extlink">NCBI</a>- Release TAIR10 (2018/04/06)
            </td>
            <td>Arabidopsis Genome Initiative - <a href="http://www.ncbi.nlm.nih.gov/pubmed/11130711" target="_blank"
                                                   class="extlink">PubMed: 11130711</a>
        </tr>

        <%-- GFF3 data --%>
        <tr>
            <td>Araport11 GFF3 data from TAIR</td>
            <td>
                <a href="https://www.arabidopsis.org/download_files/Genes/Araport11_genome_release/Araport11_GFF3_genes_transposons.201606.gff.gz"
                   target="_blank" class="extlink">TAIR</a>- Release Araport11 (2016/06/17)
            </td>
            <td>Cheng et al., 2016 - <a href="http://dx.doi.org/10.1111/tpj.13415" target="_blank" class="extlink">PubMed:
                27862469</a></td>
        </tr>

        <tr>
            <td rowspan="3" class="leftcol">
                <h2><p>Proteins</p></h2>
            </td>
            <td>High-quality, manually annotated, non-redundant protein sequence database.</td>
            <td>
                <a href="http://www.uniprot.org/uniprot/?format=xml&query=taxonomy%3A3702+AND+reviewed%3Ayes&compress=yes"
                   target="_blank" class="extlink">Swiss-Prot</a>- Release 2019_09
            </td>
            <td rowspan="2">UniProt Consortium - <a href="http://www.ncbi.nlm.nih.gov/pubmed/17142230" target="_blank" class="extlink">PubMed: 17142230</a></td>
        </tr>
        <tr>
            <td>Computationally analysed records, enriched with automatic annotation</td>
            <td>
                <a href="http://www.uniprot.org/uniprot/?format=xml&query=taxonomy%3A3702+AND+reviewed%3Ano&compress=yes"
                   target="_blank" class="extlink">TrEMBL</a>- Release 2019_09
            </td>
        </tr>

        <tr>
            <td>Protein family and domain assignments to proteins</td>
            <td><a href="ftp://ftp.ebi.ac.uk/pub/databases/interpro/interpro.xml.gz" target="_blank" class="extlink">InterPro</a>- Release v76.0
            </td>
            <td>Mitchell et al., 2019 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/30398656" target="_blank" class="extlink">PubMed: 30398656</a></td>
        </tr>

        <tr>
          <td rowspan="2" class="leftcol"><h2><p>Homology</p></h2></td>
          <td>Orthologue and paralogue relationships based on the inferred speciation and gene duplication events in the phylogenetic tree.</td>
          <td><a href="ftp://ftp.pantherdb.org/ortholog/current_release/RefGenomeOrthologs.tar.gz" target="_blank" class="extlink">Panther</a>- Release 14.1</td>
          <td>Mi et al - <a href="http://www.ncbi.nlm.nih.gov/pubmed/23193289 " target="_blank" class="extlink">PubMed: 23193289</a></td>
        </tr>
        <tr>
          <td>Phytozome Homologs generated with InParanoid</td>
          <td><a href="http://phytozome.jgi.doe.gov/phytomine" target="_blank" class="extlink">Phytozome</a>- realtime</td>
          <td>Goodstein et al - <a href="http://www.ncbi.nlm.nih.gov/pubmed/22110026" target="_blank" class="extlink">PubMed: 22110026</a></td>
        </tr>
        <tr>
          <td rowspan="2" class="leftcol"><h2><p>Gene Ontology</p></h2></td>
          <td>GO annotations from Gene Ontology</td>
          <td><a href="http://current.geneontology.org/annotations/tair.gaf.gz" target="_blank" class="extlink">Gene Ontology</a>- Release 2020-01-01</td>
          <td>Berardini et al., 2004 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/15173566" target="_blank" class="extlink">PubMed: 15173566</a><br />
              Gene Ontology Consortium - <a href="http://www.ncbi.nlm.nih.gov/pubmed/10802651" target="_blank" class="extlink">PubMed:10802651</a></td>
        </tr>
        <tr>
          <td>Several electronic and manual GO annotation methods utilized by UniProt</td>
          <td><a href="http://www.uniprot.org/uniprot/?format=xml&query=taxonomy%3A3702+AND+reviewed%3Ayes&compress=yes" target="_blank" class="extlink">UniProt</a>- Release 2019_11</td>
          <td>UniProt Consortium - <a href="http://www.ncbi.nlm.nih.gov/pubmed/17142230" target="_blank" class="extlink">PubMed: 17142230</a></td>
        </tr>
<%--
        <tr>
          <td rowspan="2" class="leftcol"><h2><p>Plant Ontology</p></h2></td>
          <td>PO anatomy data from TAIR</td>
          <td><a href="https://www.arabidopsis.org/download_files/Public_Data_Releases/TAIR_Data_20180331/po_anatomy_gene_arabidopsis_tair.assoc.gz" target="_blank" class="extlink">TAIR</a>- Release 20180331</td>
          <td rowspan="2">Berardini et al., 2015 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/26201819" target="_blank" class="extlink">PubMed: 26201819</a>
        </tr>
	<tr>
	  <td>PO temporal data from TAIR</td>
          <td><a href="https://www.arabidopsis.org/download_files/Public_Data_Releases/TAIR_Data_20180331/po_temporal_gene_arabidopsis_tair.assoc.gz" target="_blank" class="extlink">TAIR</a>- Release 20180331</td>
	</tr>  

        <tr>
          <td>InterPro domains to GO terms</td>
          <td><a href="http://www.ebi.ac.uk/interpro" target="_blank" class="extlink">InterPro</a>(from <a href="http://www.geneontology.org" target="_blank" class="extlink">Gene Ontology Site</a>)</td>
          <td>Mulder et al - <a href="http://www.ncbi.nlm.nih.gov/pubmed/17202162" target="_blank" class="extlink">PubMed: 17202162</a></td>
        </tr>
--%>

        <tr>
          <td rowspan="2" class="leftcol"><p><h2>Interactions</p><h2></td>
          <td>Curated set of genetic and physical interactions for Arabidopsis thaliana</td>
          <td><a href="https://downloads.thebiogrid.org/Download/BioGRID/Release-Archive/BIOGRID-3.5.180/BIOGRID-ORGANISM-3.5.180.psi25.zip" target="_blank" class="extlink">BioGRID</a>- Release 3.5.180</td>
          <td>Chatr-Aryamontri et al., 2014 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/25428363">PubMed: 25428363</a></td>
        </tr>
        <tr>
          <td>Curated binary and complex protein-protein interactions for Arabidopsis thaliana</td>
          <td><a href="ftp://ftp.ebi.ac.uk/pub/databases/IntAct/current/psi25/species/arath.zip" target="_blank" class="extlink">IntAct</a>- Downloaded 20200121</td>
          <td>Kerrien et al., 2012 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/22121220">PubMed: 22121220</a></td>
        </tr>

        <tr>
          <td rowspan="1" class="leftcol"><p><h2>Expression</h2></p></td>
          <td>Electronic Fluorescent Pictograph (eFP) Visualization paints gene expression information from one of the AtGenExpress data sets or other compendia for a desired gene onto a diagrammatic representation of <em>Arabidopsis thaliana</em> plants.</td>
          <td><a href="http://bar.utoronto.ca/webservices/efp_service/efp_service.php" target="_blank" class="extlink">BAR eFP Webservice</a>- realtime</td>
          <td>Winter et al., 2007 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/17684564" target="_blank" class="extlink">PubMed: 17684564</a><br />
              Brady et al., 2009 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/19401381" target="_blank" class="extlink">PubMed: 19401381</a></td>
        </tr>
    <%--
        <tr>
          <td>AtGenExpress data summarizing global gene expression in Arabidopsis in response to seven basic phytohormones (auxin, cytokinin, gibberellin, brassinosteroid, abscisic acid, jasmonate and ethylene) and their inhibitors (and in related experiments), as part of the AtGenExpress project.</td>
          <td><a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/" target="_blank" class="extlink">AtGenExpress</a>- Weigel World</td>
          <td>Goda et al., 2008 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/18419781" target="_blank" class="extlink">PubMed: 18419781</a></td>
        </tr>
        --%>
	<tr>
	  <td class="leftcol"><p><h2>Co-Expression</h2></p></td>
	  <td>Co-regulated gene relationships deduced from microarray and RNA-seq data via ATTED-II web services</td>
	  <td><a href="http://atted.jp/help/API.shtml" target="_blank" class="extlink">ATTED-II Co-expression</a>- realtime</td>
	  <td>Obayashi et al., 2014 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/24334350" target="_blank" class="extlink">PubMed: 24334350</a></td>
	</tr>
        <tr>
            <td rowspan="3" class="leftcol">
                <h2><p>Publications</p></h2>
            </td>
            <td>Curated associations between publications and genes from UniProt</td>
            <td><a href="http://www.uniprot.org/help/publications" target="_blank" class="extlink">UniProt</a>- Release
                2019_09
            </td>
            <td>UniProt Consortium - <a href="http://www.ncbi.nlm.nih.gov/pubmed/17142230" target="_blank"
                                        class="extlink">PubMed: 17142230</a></td>
            <%-- <td>Magrane et al., 2011 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/21447597" target="_blank" class="extlink">PubMed: 21447597</a></td> --%>
        </tr>
        <tr>
            <td>Publications from InterPro</td>
            <td><a href="ftp://ftp.ebi.ac.uk/pub/databases/interpro/interpro.xml.gz" target="_blank" class="extlink">InterPro</a>- Release v77.0
            </td>
            <td>Mitchell et al., 2019 - <a href="http://www.ncbi.nlm.nih.gov/pubmed/30398656" target="_blank" class="extlink">PubMed: 30398656</a></td>
        </tr>
        <tr>
            <td>Publications from NCBI</td>
            <td><a href="ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/gene2pubmed.gz" target="_blank" class="extlink">NCBI</a>- Downloaded 20200121</td>
            <td>Maglott et al., 2007 - <a href="https://www.ncbi.nlm.nih.gov/pubmed/17148475" target="_blank" class="extlink">PubMed: 17148475</a></td>
        </tr>
        <tr>
            <td class="leftcol">
                <h2><p>GeneRIF</p></h2>
            </td>
            <td>Concise phrase describing gene function and publication associated with NCBI Gene records</td>
            <td><a href="ftp://ftp.ncbi.nlm.nih.gov/gene/GeneRIF/generifs_basic.gz" target="_blank" class="extlink">NCBI</a>- Downloaded 20200121</td>
            <td>Maglott et al., 2007 - <a href="https://www.ncbi.nlm.nih.gov/pubmed/17148475" target="_blank" class="extlink">PubMed: 17148475</a></td>
        </tr>
         
        <%--
        <tr>
          <td class="leftcol"><h2><p>Pathways</p></h2></td>
          <td>KEGG pathways - Wiring diagrams of molecular interactions, reactions, and relations</td>
          <td><a href="http://www.kegg.jp/kegg/pathway.html" target="_blank" class="extlink">KEGG</a>Release 72.0</td>
          <td>Kanehisa et al - <a href="http://www.ncbi.nlm.nih.gov/pubmed/24214961" target="_blank" class="extlink">PubMed: 24214961</a></td>
        </tr>
        --%>
    </table>

</div>
<!-- /dataCategories -->

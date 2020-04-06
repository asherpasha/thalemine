#!/bin/sh
# A script to build intermine.
# This script can be improved in the near future.
# Author: Asher
# Date: April 2019

# Set version number. This is the thalemine.properties.20190419 file
export GRADLE_OPTS="-server -Dorg.gradle.daemon=false -Xms512m -Xmx2g -XX:+UseParallelGC -XX:SoftRefLRUPolicyMSPerMB=1 -XX:MaxHeapFreeRatio=99"

# Clean
./gradlew clean

# BuildDB
./gradlew buildDB

# Load DATA
./gradlew integrate -Psource=psi-mi-ontology
./gradlew integrate -Psource=so
./gradlew integrate -Psource=bar-ncbi-fasta
./gradlew integrate -Psource=bar-tair-gff
./gradlew integrate -Psource=bar-tair-functional-descriptions
./gradlew integrate -Psource=bar-tair-aliases
./gradlew integrate -Psource=go
./gradlew integrate -Psource=bar-go-annotation

./gradlew integrate -Psource=uniprot
./gradlew integrate -Psource=uniprot-fasta
./gradlew integrate -Psource=uniprot-keywords
./gradlew integrate -Psource=panther
./gradlew integrate -Psource=interpro
./gradlew integrate -Psource=protein2ipr
./gradlew integrate -Psource=bar-generif
./gradlew integrate -Psource=psi-intact
./gradlew integrate -Psource=biogrid
./gradlew integrate -Psource=pubmed-gene
./gradlew integrate -Psource=update-publications

./gradlew integrate -Psource=entrez-organism

# Run all post processes
./gradlew postProcess -Pprocess=create-references
./gradlew postProcess -Pprocess=make-spanning-locations
./gradlew postProcess -Pprocess=create-chromosome-locations-and-lengths
./gradlew postProcess -Pprocess=create-intron-features
./gradlew postProcess -Pprocess=create-intergenic-region-features
./gradlew postProcess -Pprocess=transfer-sequences
./gradlew postProcess -Pprocess=do-sources
./gradlew postProcess -Pprocess=create-location-overlap-index
./gradlew postProcess -Pprocess=create-overlap-view
./gradlew postProcess -Pprocess=populate-child-features
./gradlew postProcess -Pprocess=create-attribute-indexes
./gradlew postProcess -Pprocess=summarise-objectstore
./gradlew postProcess -Pprocess=create-autocomplete-index
./gradlew postProcess -Pprocess=create-search-index

# Might have to build user database
#./gradlew buildUserDB
./gradlew cargoRedeployRemote



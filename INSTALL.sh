#!/bin/sh
# A script to build intermine.
# This script can be improved in the near future.
# Author: Asher
# Date: April 2019

# Set version number. This is the thalemine.properties.20190419 file
export VER=20190509
export GRADLE_OPTS="-server -Dorg.gradle.daemon=false -Xms512m -Xmx1g -XX:+UseParallelGC -XX:SoftRefLRUPolicyMSPerMB=1 -XX:MaxHeapFreeRatio=99"

# Clean
./gradlew clean -Dor.gradle.project.release=$VER

# BuildDB
./gradlew buildDB -Dorg.gradle.project.release=$VER

# Load DATA
./gradlew integrate -Psource=so -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=bar-ncbi-fasta -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=bar-tair-gff -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=entrez-organism -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=uniprot -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=uniprot-fasta -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=uniprot-keywords -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=interpro -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=protein2ipr -Dorg.gradle.project.release=$VER
./gradlew integrate -Psource=update-publications -Dorg.gradle.project.release=$VER

# Run all post processes
# Individual post processes can be run as
# ./gradlew postProcess -Pprocess=update-publications
# If db runs out of connections, might have to do post processes individually.
./gradlew postProcess -Dorg.gradle.project.release=$VER

# Might have to build user database
#./gradlew buildUserDB -Dorg.gradle.project.release=$VER
./gradlew cargoRedeployRemote -Dorg.gradle.project.release=$VER



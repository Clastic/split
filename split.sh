#!/bin/bash

SPLITTOOL=./subsplit.sh

if [ ! -f ${SPLITTOOL} ];
then
    wget -O ${SPLITTOOL} https://raw.githubusercontent.com/dflydev/git-subsplit/master/git-subsplit.sh
    chmod +x ${SPLITTOOL}
fi

if [ ! -d ./.subsplit ];
then
    ${SPLITTOOL} init https://github.com/Clastic/Clastic.git
else 
    ${SPLITTOOL} update
fi

${SPLITTOOL} publish "
    src/Clastic/CoreBundle:git@github.com:Clastic/CoreBundle.git
    src/Clastic/NodeBundle:git@github.com:Clastic/NodeBundle.git
    src/Clastic/BackofficeBundle:git@github.com:Clastic/BackofficeBundle.git
    src/Clastic/TextBundle:git@github.com:Clastic/TextBundle.git
    src/Clastic/AliasBundle:git@github.com:Clastic/AliasBundle.git
    src/Clastic/UserBundle:git@github.com:Clastic/UserBundle.git
    src/Clastic/MenuBundle:git@github.com:Clastic/MenuBundle.git
    src/Clastic/MediaBundle:git@github.com:Clastic/MediaBundle.git
    src/Clastic/FrontBundle:git@github.com:Clastic/FrontBundle.git
    src/Clastic/TaxonomyBundle:git@github.com:Clastic/TaxonomyBundle.git
    src/Clastic/BlockBundle:git@github.com:Clastic/BlockBundle.git
    src/Clastic/GeneratorBundle:git@github.com:Clastic/GeneratorBundle.git
    src/Clastic/SecurityBundle:git@github.com:Clastic/SecurityBundle.git
" --heads=master

rm -rf ./.subsplit/.git/subtree-cache/*


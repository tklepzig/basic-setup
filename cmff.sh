#!/bin/bash

prevBranch=`git rev-parse --abbrev-ref HEAD`
git checkout $1
git merge --ff-only $2
git checkout $prevBranch

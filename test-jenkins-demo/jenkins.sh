#!/bin/bash -e
cd "`dirname $0`"
. ./pom.sh


#1. download war, ready env
echo "deploy time: $work_time"
mkdir -p war/
# 配置下载存放目录
war=war/$pom_a-$pom_v.war
# 基于远程传过来的 BUILD_URL下载本次构建
wget  "${BUILD_URL}${pom_g}\$${pom_a}/artifact/$pom_g/$pom_a/$pom_v/$pom_a-$pom_v.war" -O $war
# 执行部署函数
deploy_war

##海量数据存储作业
###问题1:
####1. 计算服务器数量,规划主从：
单机性能（ssd）：写入3k QPS，读取 6k QPS；
$1*10^{7}*365*5/1024^3=16.99T$ 
每台服务器存储空间为4T,所以需要5台服务器（master）；
master用于写请求，每台master对应2台slave用于读请求，如若某台master出现故障，可由任意一台slave顶替；
####2. 计算库表数量：
每张表数据量为5kw；
$1*10^7*365/5*10^7/5台服务器=14.6张表/台$
所以每台服务器，master和slave，各需要15张表；
####3.创建表结构：
```SQL
CREATE TABLE datatable(
    mid char,
    content varchar
);
```
###问题2：
写微博数据，hash（mid % 5），随机分配到master进行存储；
每个slave储存与master相同的数据；
读微博数据，hash (mid % 2），随机选择slave进行读取；
####1.插入表
```SQL
INSERT INTO datatable (mid, content)
VALUES (mid_value, content_value);
```
####2.查询表
```SQL
SELECT content From datatable
WHERE mid = mid_value;
```

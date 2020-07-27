## 快速开始
1.安装

2.配置Shodan Key

## 功能
### 使用网站上的搜索语法
国内速度很慢经过测试一段时间后 `shodan api` 服务器会直接断开连接导致搜索无结果。一般  11M 大小的数据返回没什么问题
比如搜索**海康的摄像头**
```shell script
Hikvision-Webs country:"IN" city:"Tirunelveli"
```
![](https://s1.ax1x.com/2020/07/22/UHNXss.gif)
**国内尽量不要直接搜索，采用导入的方式**
### 使用导入功能
```shell script
shodan download hikvision-in Hikvision-Webs country:"IN"
gzip -d hikvision-in.json.gz
```
![](https://s1.ax1x.com/2020/07/22/UHNwrR.gif)

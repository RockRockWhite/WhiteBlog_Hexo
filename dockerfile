# 构建前端页面镜像
FROM node:18-alpine
# 进入工作文件夹
WORKDIR /usr
RUN apk add --no-cache git
# 拉取项目代码
RUN git clone https://github.com/RockRockWhite/WhiteBlog_Hexo.git
# 进入项目目录
WORKDIR /usr/WhiteBlog_Hexo
# npm解决依赖
RUN npm install hexo-cli -g
RUN npm install

# 设置地区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV TZ=Asia/Shanghai

CMD git pull && npm install && hexo server

EXPOSE 4000
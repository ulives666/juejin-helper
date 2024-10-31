# 使用官方 Node.js 运行时作为父镜像
# FROM node:16.15.0-slim
FROM node:16.15.0-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 复制 package.json 和 package-lock.json 文件
COPY package*.json ./

# 定义环境变量
ENV NODE_ENV prod

# 安装任何依赖项
RUN npm i

# 复制应用源代码到工作目录
COPY ./src ./src
# COPY ./dist ./dist

# 暴露端口 8080 供 Node.js 应用使用
EXPOSE 3000

# 启动应用
# CMD ["npm", "start"]
CMD ["node", "src/main.js"]
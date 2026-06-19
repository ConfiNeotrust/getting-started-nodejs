FROM node
LABEL maintainer="devops@confi.com.vc" \
      description="Aplicação de teste devtron" \
      environment="producao"
      
ENV TINI_VERSION v0.18.0
RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && echo $arch && wget https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${arch} -O /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
COPY /.  .
RUN npm install
CMD ["node","app.js"]


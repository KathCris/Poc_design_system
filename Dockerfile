# Build Stage
FROM node:lts-alpine3.14 as build-stage

ENV APP_HOME=/usr/src/app

RUN mkdir -p $APP_HOME

COPY . $APP_HOME

RUN cd $APP_HOME && npm install

RUN cd $APP_HOME && npm run build

WORKDIR $APP_HOME

# Production Stage
FROM nginx:stable-alpine as production-stage

ENV APP_HOME=/usr/src/app

ENV SERVER_HOME=/usr/share/nginx/html

COPY --from=build-stage $APP_HOME/.nuxt $SERVER_HOME/.nuxt

COPY --from=build-stage $APP_HOME/package.json $SERVER_HOME

COPY --from=build-stage $APP_HOME/node_modules $SERVER_HOME/node_modules

COPY --from=build-stage $APP_HOME/server/ecosystem.config.js $SERVER_HOME

COPY --from=build-stage $APP_HOME/server/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build-stage $APP_HOME/server/start.sh $SERVER_HOME/start.sh

RUN chmod 777 $SERVER_HOME/start.sh

RUN apk add --update nodejs npm

RUN npm install pm2 -g

RUN chown nginx:nginx $SERVER_HOME

WORKDIR $SERVER_HOME

ENTRYPOINT ["/bin/sh", "./start.sh"]

EXPOSE 80

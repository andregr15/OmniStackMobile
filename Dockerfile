FROM node:11.14.0-alpine

EXPOSE 19000
EXPOSE 19001

ENV ADB_IP=""
ENV REACT_NATIVE_PACKAGER_HOSTNAME=""

RUN apt-get update && apt-get install android-tools-adb -y

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY . .

RUN yarn --network-timeout 100000

CMD adb connect $ADB_IP && yarn run android
# ベースイメージの選択。ここではUbuntu 12.04を選びます
FROM ubuntu:12.04

# このDockerfileをメンテナンスしている人
MAINTAINER bandetech
 
# コンテナ内でのワーキングディレクトリのセット。ここにインストーラを入れる
WORKDIR /opt
 
# Alfrescoのインストールに必要なライブラリを事前インストール
RUN apt-get update
RUN apt-get -y install libdbus-glib-1-2 fontconfig libsm6 libice6 libxrender1 libxext6 language-pack-ja fonts-ipafont-gothic fonts-ipafont-mincho
RUN apt-get -y install libxinerama1 libcups2
RUN apt-get -y install curl wget

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get -y maven ant

ADD . /opt

EXPOSE 8080


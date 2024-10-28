FROM amazonlinux:latest

# 必要な開発ツールとライブラリのインストール
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel wget zip tar gzip make

# Pythonのソースコードをダウンロードしてビルド
RUN cd /opt && \
    wget https://www.python.org/ftp/python/3.11.8/Python-3.11.8.tgz && \
    tar xzf Python-3.11.8.tgz && \
    cd Python-3.11.8 && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall && \
    cd / && \
    rm -rf /opt/Python-3.11.8 /opt/Python-3.11.8.tgz

# pipをアップグレード
RUN python3.11 -m pip install --upgrade pip

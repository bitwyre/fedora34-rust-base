FROM fedora:34

USER root

RUN dnf install -y \
    autoconf \
    automake \
    clang \
    clang-analyzer \
    clang-devel \
    clang-libs \
    clang-resource-filesystem \
    clang-tools-extra \
    cmake \
    curl \
    cyrus-sasl-devel \
    elfutils-devel \
    g++ \
    gcc \
    gettext \
    git \
    libgsasl-devel \
    libsass-devel \
    librdkafka-devel \
    libtool \
    llvm \
    llvm-devel \
    llvm-doc \
    llvm-libs \
    llvm-static \
    llvm-test \
    llvm-test-suite \
    musl-clang \
    musl-devel \
    musl-filesystem  \
    musl-gcc \
    musl-libc \
    musl-libc-static \
    nasm \
    ninja-build\
    openssl-devel \
    pkgconfig \
    python3 \
    python3-clang \
    python3-devel \
    python3-libsass \
    python3-pip \
    python3-virtualenv \
    wget \
    yasm

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

RUN dnf clean all

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup default 1.53.0 && \
    rustup target add x86_64-unknown-linux-musl && \
    rustup update

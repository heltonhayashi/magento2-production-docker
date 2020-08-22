FROM ubuntu:18.04
LABEL maintainer = "Hugo Aguiar | hugohdaguiar@gmail.com"

ARG DEBIAN_FRONTEND="noninteractive"
ARG PHP_VERSION=7.2

RUN set -ex; \
	AptPackages="\
		git \
		nginx \
		openssl \
		postfix \
		unzip \
		zip \
		vim \
		supervisor \
		composer \
	"; \
	PHPExtensions="\
		php${PHP_VERSION} \
		php${PHP_VERSION}-fpm \
		php${PHP_VERSION}-bcmath \
		php${PHP_VERSION}-curl \
		php${PHP_VERSION}-gd \
		php${PHP_VERSION}-iconv \
		php${PHP_VERSION}-pdo \
		php${PHP_VERSION}-mbstring \
		php${PHP_VERSION}-memcached \
		php${PHP_VERSION}-json \
		php${PHP_VERSION}-soap \
		php${PHP_VERSION}-xml \
		php${PHP_VERSION}-zip \
		php${PHP_VERSION}-redis \
		php${PHP_VERSION}-cli \
		php${PHP_VERSION}-common \
		php${PHP_VERSION}-xsl \
		php${PHP_VERSION}-dom \
	"; \
	apt-get update; \
	apt-get install --no-install-recommends -qy $AptPackages $PHPExtensions; \
	apt-get clean;


EXPOSE 80
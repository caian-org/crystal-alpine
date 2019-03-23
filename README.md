# Dockerized Crystal on Alpine

<a href="https://crystal-lang.org" target="_blank"><img src="https://crystal-lang.org/assets/media/crystal_logo-stacked_version.svg" alt="img" height="210px" align="right"/></a>

The Crystal compiler, the Shards package manager and various complementary
development headers on top of Alpine Linux.

[![Build Status][travis-shield]][travis-url] [![GitHub tag][tag-shield]][tag-url]

- __Build essential packages__
- __Development headers for:__
    - _GNU C_
    - _ZLib_
    - _OpenSSL_
    - _ReadLine_ <img src="https://cdn.worldvectorlogo.com/logos/docker.svg" alt="img" height="140px" align="right"/>
    - _GNU GMP_
    - _YAML_
    - _XML_
- __Crystal compiler__ (version `0.27.2`)
- __Shards__ (version `0.8.1`)


## Rationale

The Crystal programming language already have an official Docker image at
[`crystallang/crystal`][crystal-docker-url] --- the image being based on Ubuntu
16.04. The [Static Linking][crystal-static-linking] feature, however, is
currently only supported on Alpine Linux. This image brings the Crystal
compiler and other stuff to Alpine, so you can make static-linked binaries.


## Usage

- __You can build yourself:__

```shell
docker build -t crystal .
```

- __Or pull from DockerHub:__

```shell
docker pull caian/crystal:0.27.2-alpine
```

- __Use to build very minimal Docker images of Crystal applications:__

```Dockerfile
FROM caian/crystal:0.27.2-alpine AS build

COPY . /src
WORKDIR /src
RUN shards install
RUN crystal build app.cr -o app

FROM scratch AS run
COPY --from=build /src/app /app
ENTRYPOINT ["/app"]
```

[crystal-docker-url]: https://hub.docker.com/r/crystallang/crystal
[crystal-static-linking]: https://github.com/crystal-lang/crystal/wiki/Static-Linking

[travis-shield]: https://img.shields.io/travis/caian-org/crystal-alpine.svg?style=for-the-badge
[travis-url]: https://travis-ci.org/caian-org/crystal-alpine

[tag-shield]: https://img.shields.io/github/tag/caian-org/crystal-alpine.svg?style=for-the-badge
[tag-url]: https://github.com/caian-org/crystal-alpine/releases


## License

To the extent possible under law, [Caian Rais Ertl][me] has waived all
copyright and related or neighboring rights to this work.

[![License][cc-shield]][cc-url]

[me]: https://github.com/caiertl
[cc-shield]: https://forthebadge.com/images/badges/cc-0.svg
[cc-url]: http://creativecommons.org/publicdomain/zero/1.0

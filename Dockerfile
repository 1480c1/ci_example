FROM alpine:3.12 AS build

RUN apk add --no-cache gcc=9.3.0-r2 cmake=3.17.2-r0 samurai=1.1-r0 musl-dev=1.1.24-r9 git=2.26.2-r0

COPY example.c /
COPY CMakeLists.txt /
COPY .git /

ENV CFLAGS="-static -static-libgcc"

RUN cmake -B build -GNinja -DCMAKE_BUILD_TYPE=Release
RUN ninja -C build

FROM scratch

COPY --from=build build/example /

ENTRYPOINT [ "/example" ]
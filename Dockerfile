# Stage 1 Building from sources
FROM arm32v7/debian:bullseye AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential cmake libsdl2-dev libsdl1.2-dev libsdl2-mixer-dev fontconfig libfontconfig-dev git

WORKDIR /root

COPY ./scripts scripts

RUN chmod +x ./scripts/prepare_build.sh && chmod +x ./scripts/run_build.sh

RUN mkdir src

RUN ./scripts/prepare_build.sh

RUN ./scripts/run_build.sh

# Stage 2 final container image
FROM arm32v7/debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y fontconfig libfontconfig1 alsa-utils mesa-utils libsdl2-2.0-0 libsdl2-dev libsdl1.2-dev libsdl2-mixer-dev

WORKDIR /root

RUN mkdir halflife

COPY --from=builder /root/src/xash3d/build/engine/libxash.so /root/halflife
COPY --from=builder /root/src/xash3d/build/game_launch/xash3d /root/halflife
COPY --from=builder /root/src/xash3d/build/mainui/libxashmenu.so /root/halflife
COPY --from=builder /root/src/hlsdk-xash3d/build/cl_dll/client.so /root/halflife
COPY --from=builder /root/src/hlsdk-xash3d/build/dlls/hl.so /root/halflife
COPY ./scripts/prepare_game.sh prepare_game.sh
COPY ./scripts/launch.sh launch.sh

RUN chmod +x prepare_game.sh && chmod +x launch.sh


FROM ubuntu:16.04

RUN dpkg --add-architecture i386

RUN apt update -y && apt upgrade -y

COPY mobius_2.5.10_amd64_jre8.deb mobius.deb

RUN apt-get install wget -y

RUN apt-get install openjdk-8-jdk g++ make g++-multilib libc6 -y

RUN wget http://snapshot.debian.org/archive/debian/20190501T215844Z/pool/main/g/glibc/multiarch-support_2.28-10_amd64.deb
RUN dpkg -i multiarch-support*.deb

RUN wget https://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb
RUN apt install -f ./libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb -y

RUN wget https://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5_i386.deb
RUN apt install -f ./libssl1.0.0_1.0.2n-1ubuntu5_i386.deb -y

RUN apt install -f ./mobius.deb -y

RUN apt-get install x11vnc xvfb fluxbox -y

COPY run.sh run.sh

RUN chmod +x run.sh

CMD ["./run.sh"]
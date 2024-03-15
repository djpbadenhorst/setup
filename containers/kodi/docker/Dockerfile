FROM thuonghai2711/ubuntu-novnc-pulseaudio:22.04

USER root
RUN sudo apt update
RUN sudo apt install -y kodi

COPY ./desktop.local /home/ubuntu/.config/autostart/kodi.desktop

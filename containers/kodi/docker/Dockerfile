FROM thuonghai2711/ubuntu-novnc-pulseaudio:22.04

RUN sudo apt update
RUN sudo apt install -y kodi

USER root
RUN mkdir -p /home/ubuntu/.config/autostart
RUN echo "" >  /home/ubuntu/.config/autostart/kodi.desktop
RUN echo "[Desktop Entry]" >>  /home/ubuntu/.config/autostart/kodi.desktop
RUN echo "Type=Application" >>  /home/ubuntu/.config/autostart/kodi.desktop
RUN echo "Name=Kodi" >>  /home/ubuntu/.config/autostart/kodi.desktop
RUN echo "Exec=/usr/bin/kodi" >>  /home/ubuntu/.config/autostart/kodi.desktop

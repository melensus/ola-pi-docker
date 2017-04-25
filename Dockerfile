FROM resin/raspberry-pi3-debian:jessie

RUN echo "deb http://apt.openlighting.org/raspbian jessie main" >>  /etc/apt/sources.list 

RUN apt-get update && apt-get install -y --no-install-recommends \
    less \
    libraspberrypi-bin \
    module-init-tools \
    nano \
    net-tools \
    ifupdown \
    iputils-ping \
    i2c-tools \
    usbutils \    
        && rm -rf /var/lib/apt/lists/* \
            && apt-get remove --force dbus-x11 desktop-base desktop-file-utils dillo gdb gdbserver gconf-service gconf2 gconf2-common gnome-icon-theme gnome-themes-standard gpicview gtk2-engines:armhf  hicolor-icon-theme gcc g++ g++-4.6  gcc-4.6  gcc-4.4-base gcc-4.5-base gcc-4.6-base  libc6-dev libtagcoll2-dev  libwibble-dev  libxapian-dev libfm-gtk-bin libfm-gtk1 libgtk2.0-0:armhf libgtk2.0-bin libgtk2.0-common netsurf-gtk penguinspuzzle omxplayer netsurf-common  mupdf menu-xdg  lxde-icon-theme  lxmenu-data  luajit samba-common scratch smartsim squeak-plugins-scratch  squeak-vm  usbmuxd xserver-common xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-fbdev xdg-utils xauth x11-xkb-utils x11-utils x11-common cups-bsd cups-client cups-common libcups2 libcupsimage2 weston python-minecraftpi  protobuf-compiler fakeroot libmtdev1 libwayland0 libxcb-shape0 libxcb-xfixes0 libxcursor1 libxkbcommon0 fonts-freefont-ttf gcc-4.7-base gstreamer1.0-plugins-base gnome-themes-standard-data  gstreamer1.0-x \
                && apt-get install screen vim  deborphan debfoster localepurge ola ola-rdm-tests  ola-conf-plugins libcppunit-dev uuid-dev pkg-config libncurses5-dev libtool autoconf automake  g++ libmicrohttpd-dev libmicrohttpd10 protobuf-compiler python-protobuf libprotobuf-dev libprotoc-dev zlib1g-dev bison flex make libftdi-dev libftdi1 libusb-1.0-0-dev liblo-dev libavahi-client-dev \
                    && apt-get autoremove \
                    && deborphan | xargs apt-get -y  remove --purge \
                    && dpkg -l |  awk ' /^rc/ {print $2}' | xargs apt-get -y remove --purge \
                    && apt-get update && apt-get upgrade\
                    && apt-get autoremove \
                    && apt-get clean \
                    && rm -rf /var/lib/apt/lists/* \
                    && cat /dev/zero > fill \
                    && rm fill \
                    \
                    && sudo apt-get install git \
                    && git clone https://github.com/OpenLightingProject/ola.git ola \
                    && cd ola \
                    && autoreconf \
                    && ./configure --enable-rdm-tests \
                    && make \
                    && sudo make install \
                    && sudo ldconfig 

EXPOSE 9090
EXPOSE 6454
EXPOSE 6454/udp

COMMAND olad

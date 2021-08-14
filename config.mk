#   ___  ______________ _    ____  ___
#   |  \/  |  _  |  _  | |  | |  \/  |
#   | .  . | | | | | | | |  | | .  . |
#   | |\/| | | | | | | | |/\| | |\/| |
#   | |  | \ \_/ | |/ /\  /\  | |  | |
#   \_|  |_/\___/|___/  \/  \/\_|  |_/
# 
#  MODWM - Modular Dynamic Window Manager.
#  ---------------------------------------
#  See LICENSE file for copyright and license details.

# dwm version
VERSION = 6.2

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/local/include
X11LIB = /usr/local/lib

# Xinerama, comment if you don't want it
#XINERAMALIBS  = -lXinerama
#XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD (uncomment)
FREETYPEINC = ${X11INC}/freetype2
KVMLIB = -lkvm

# Uncomment this for the alpha patch / BAR_ALPHA_PATCH
#XRENDER = -lXrender

# Uncomment this for the mdpcontrol patch / MDPCONTROL_PATCH
#MPDCLIENT = -lmpdclient

# Uncomment for the pango patch / BAR_PANGO_PATCH
#PANGOINC = `pkg-config --cflags xft pango pangoxft`
#PANGOLIB = `pkg-config --libs xft pango pangoxft`

# Uncomment for the ipc patch / IPC_PATCH
#YAJLLIBS = -I-lyajl
#YAJLINC = /usr/include/yajl

# Uncomment this for the rounded corners patch / ROUNDED_CORNERS_PATCH
#XEXTLIB = -lXext

# Uncomment this for the swallow patch / SWALLOW_PATCH
#XCBLIBS = -lX11-xcb -lxcb -lxcb-res ${KVMLIB}

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC} ${PANGOINC} ${YAJLLIBS}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}  ${XRENDER} ${MPDCLIENT} ${XEXTLIB} ${XCBLIBS} ${PANGOLIB} ${YAJLLIBS}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc

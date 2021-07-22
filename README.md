# MODWM - Modular Dynamic Window Manager 
"It's dwm on steroids..."
![modwm](modwm.png)

###   [Configure](https://github.com/plasmoduck/modwm#configure) - [Building](https://github.com/plasmoduck/modwm#building) - [Statusbar](https://github.com/plasmoduck/modwm#statusbar) - [Extra Goodies](https://github.com/plasmoduck/modwm#extra-goodies) - [Changelog](https://github.com/plasmoduck/modwm#changelog) - [Patches](https://github.com/plasmoduck/modwm#patches-included)

MODWM is a fork of dwm 6.2 (aaad5f, 2020-07-08). It has a different take on dwm patching. Giving you two config files [patches.def.h](https://github.com/plasmoduck/modwm/blob/master/patches.def.h) to select modules & [config.def.h](https://github.com/plasmoduck/modwm/blob/master/config.def.h) to configure them. It uses preprocessor directives to decide whether or not to include a patch during build time. Essentially this means that this build is modular and for better or worse, contains both the patched _and_ the original code. The aim being that you can select which patches to include and the build will contain that code and nothing more. Due to the complexity of some of the patches MODWM has diverged from mainstream dwm by making some core patches non-optional for maintenance reasons. Credit to bakkeby for his upstream work on [dwm-flexipatch](https://github.com/bakkeby/dwm-flexipatch/) & the [suckless team](https://suckless.org/) for [dwm](https://dwm.suckless.org/) which this project wouldn't be possible without.

## EXAMPLE
To include the `alpha` patch module you would only need to flip this setting from 0 to 1 in [patches.h](https://github.com/plasmoduck/modwm/blob/master/patches.def.h):
```c
#define BAR_ALPHA_PATCH 1
 ```

## DEPENDENCIES
Fonts: JetBrains Mono & Siji

## CONFIGURE
Configuration of MODWM is done by its two config files [patches.def.h](https://github.com/plasmoduck/modwm/blob/master/patches.def.h) & [config.def.h](https://github.com/plasmoduck/modwm/blob/master/config.def.h). Simply edit patches.def.h & select which modules you want, then edit config.def.h to configure them.

## BUILDING
This build is customised for FreeBSD (cause that's what I use). Modify the build flags in [config.mk](https://github.com/plasmoduck/modwm/blob/master/config.mk) to suit your system, Linux for example. Then run:
```c
make install
```
Then you can put something like this at the end of your ~/.xinitrc file:
```c
exec dwm
```

## COLORS
MODWM supports color schemes, you can define your scheme by editing [colors.h](https://github.com/plasmoduck/modwm/blob/master/colors.h).

## STATUSBAR
MODWM also includes a statusbar. It uses 'siji' to draw glyphs (icons) so please install it. You can customize the statusbar by editing the file 'statusbar.sh'. Then source it from your ~/.xinitrc like so ``exec /path/to/modwm/statusbar.sh &``

## EXTRA GOODIES
For more quality suckless software to complement MODWM, check out my suckless utilities [collection](https://github.com/plasmoduck/suckless/)

## SUMMARY
So if you have ever been curious about trying out dwm, but have been discouraged by manual patching, then this may be a good starting point to see what a "fully fledged" dwm can look like. Want to try out the `pertag` patch? Just flip a config and recompile. Once you have found out what works for you and what doesn't then you should be in a better position to choose patches should you want to start patching from scratch.

Alternatively if you have found the patches you want, but don't want the rest of the modwm entanglement on your plate then you may want to have a look at [flexipatch-finalizer](https://github.com/bakkeby/flexipatch-finalizer); a custom pre-processor tool that removes all the unused modwm code leaving you with a build that contains the patches you selected.

Refer to [https://dwm.suckless.org/](https://dwm.suckless.org/) for details on the dwm window manager, how to install it and how it works.

---

### Changelog:

Please see [commits](https://github.com/plasmoduck/modwm/commits/master) for a more up-to-date changelog.

2021-01-30 - Added setstatus patch - Enables to set the status with dwm itself. No more xsetroot bloat! - https://dwm.suckless.org/patches/setstatus/

2021-01-02 - Added Wireless AP name and signal to /statusbars/gruvbox.statusbar this is the default statusbar now.

2020-12-31 - Added new "underline" window title indicator for tiled windows.

2020-11-30 - Added Tatami layout and layout menu patch. Install xmenu for layout menu to work.

2020-10-23 - Added 'colors' to support changing color schemes on the fly. Source them in config.def.h by #include "colors.h"
	     Also added 'statusbar.sh' to support themed statusbars. Please install 'siji' to see glyphs.

2020-10-14 - Changed color scheme and added some extra key bindings for my ~/bin files

2020-09-13 - Added Siji tiling glyphs for the layouts button. Please install [Siji](https://github.com/stark/siji) font to render properly.

2020-09-12 - Added extra keybidings for [suckless tools](https://github.com/plasmoduck/suckless/)

2020-09-09 - Added the bar border patch

2020-09-08 - Added ipc v1.5.5 patch

2020-09-07 - Scratchpads improvement (multi-monitor support)

2020-09-05 - Assortment of fullscreen improvements

2020-08-27 - Added aspectresize patch

2020-08-25 - Unified tag icon handling while adding support for different icons per monitor. Added alttagsdecoration patch.

2020-08-22 - Added logic to auto-hide bars if nothing is drawn on them (e.g. for standalone bars that only show certain clients). Added clientindicators patch and unified indicator code. Simplified Pango integration by settling on common function signatures.

2020-08-21 - Simplification of color configuration; settling on a set of color schemes that is shared between multiple patches (urgentborder, floatborder and titlecolor patches made non-optional)

2020-08-20 - Added experimental flexwintitle patch based on bartabgroups

2020-08-13 - Added bartabgroups patch

2020-08-11 - Added decoration hints and focusmaster patches

2020-08-10 - Added cool autostart, insets and steam patches

2020-08-02 - Added reorganizetags patch

2020-07-19 - Added barmodules patch - making extrabar, leftlayout, staticstatus and statusallmons patches redundant, added powerline patch

2020-07-18 - **Note**: Up until now building modwm without any patches selected would have given you something more or less identical with mainstream dwm. In order to reduce complexity when it comes to maintainance future versions of dwm-flexipatch may diverge from this by making some patches non-optional. For the classic dwm-flexipatch and its many patch integration hints refer to branch [dwm-flexipatch-1.0](https://github.com/bakkeby/dwm-flexipatch/tree/dwm-flexipatch-1.0) which will be subject to bug fixes and mainstream dwm updates as far as feasible.

2020-07-05 - Extrabar compatibility improvements (staticstatus, status2d, dwmblocks) and fix for systray randomly causing dwm to crash when first systray application starts

2020-06-24 - Added resizepoint, statusbutton and sendmon_keepfocus patches

2020-06-21 - Added floatpos and bar_height patches

2020-06-19 - Added tagothermonitor patch

2020-06-15 - Added sizehints patch

2020-06-14 - Added RULE macro to replace rules setup making the default config less of an abomination and making it simpler to include new rules based patches

2020-06-11 - Added the pango patch

2020-06-10 - Added the staticstatus patch

2020-05-31 - Added the keymodes patch

2020-05-29 - Added the color emoji patch

2020-05-26 - Added the status2d patch (with alpha, systray, statuspadding and dwmblocks compatibility, no statuscolors or extrabar compatibility)

2020-05-21 - Added the moveplace and moveresize patches

2020-05-03 - Added the shiftviewclients patch and the no transparent borders patch which removes opacity from window borders when the alpha patch is not used

2020-05-02 - Added dwmblocks patch

2020-04-27 - Upgraded the tagmonfixfs patch to better support moving fullscreen windows to adjacent monitors

2020-04-26 - Expanded monitor rules patch to include nmaster, showbar and topbar options

2020-04-23 - Improved swallow and switchtag compatibility

2020-04-16 - Upgraded the scratchpad patch to the multiple scratchpads patch \[[ref](https://lists.suckless.org/hackers/2004/17205.html)\]. Updated the statuscolors patch with the width computation fix \[[ref](https://lists.suckless.org/hackers/2004/17207.html)\].

2020-04-13 - Added statuscmd patch

2020-03-31 - Added the rounded corners patch

2020-03-27 - Revamped the dragmfact patch to support both horizontal and vertical layout splits as well as centered master variants

2020-03-25 - Added dragcfact patch

2020-03-23 - Added stacker patch

2020-03-21 - Reworked a series of layouts to re-allocate remaining pixels following an even (or cfacts) split with the aim of presenting a pixel perfect layout. This affects the following layouts: tile, bstack, bstackhoriz, centered master, centered floating master, columns, deck, and corresponding flextile-deluxe layouts

2020-02-11 - Added swaptags and vtcolor patches

2020-02-09 - Added alternative scratchpad patch

2020-02-02 - Added fsignal and transferall patches

2020-01-29 - Added swapfocus and shiftview patches

2020-01-26 - Added transfer patch

2020-01-24 - Added barpadding patch (incl. statusallmons, statuspadding, statuscolors, systray, alpha, holdbar and extrabar patch compatibility). Moved patches.h to patches.def.h to mimic the config pattern of having default and personal settings.

2020-01-17 - Added inplacerotate patch

2019-12-15 - Updated dragmfact patch to include fix patch to make it work with multiple monitors

2019-11-26 - Added dmenumatchtop patch, added improvements to the switchtag patch based on ideas from the switchtotag patch

2019-11-21 - Added fakefullscreenclient patch

2019-10-24 - Added dragmfact, extrabar, exresize and nodmenu patches

2019-10-22 - Added ispermanent and swallow patches

2019-10-16 - Introduced [flexipatch-finalizer](https://github.com/bakkeby/flexipatch-finalizer)

2019-10-11 - Added the patch to ignore Xft errors when drawing text in the status bar

2019-10-10 - Added mdpcontrol, scratchpad and spawn_cwd cpatches

2019-10-08 - Added columns layout and fakefullscreen patch

2019-10-07 - Added sortscreens and dwmc patches, fixed minor cross-compatibility issues for combo, holdbar, leftlayout, hidevacanttags, taggrid and activetagindicatorbar

2019-10-06 - Added statuscolors and statusallmons patches, fixed minor cross-compatibility issues for killunsel, fullscreen, noborder, tagintostack patches

2019-10-05 - Added killunsel, taggrid, hidevacanttags and cmdcustomize patches

2019-10-04 - Added maximize, movestack, monoclesymbol, noborder, tagall and tagintostack  patches

2019-10-03 - Added onlyquitonempty and switchcol patches

2019-10-02 - Added restartsig, emptyview, focusurgent and focusadjacenttag patches

2019-10-01 - Added leftlayout, fullscreen, holdbar and unfloatvisible patches

2019-09-30 - Replaced flextile with flextile-deluxe, refactored monitor rules to support predetermined layouts per tag

2019-09-15 - Added focusonclick, xrdb, viewontag, urgentborder and winview patches

2019-09-14 - Added setborderpx, selfrestart and push (no master variant), sticky and warp patches

2019-09-13 - Added titlecolor and push patches

2019-09-12 - Added activetagindicatorbar, alwaysfullscreen and autoresize patches

2019-09-11 - Added monitor rules, combo and ewmhtags patches

2019-09-10 - Minor tweaks to awesomebar patch (incl. alpha and systray compatibility). Added floatbordercolor patch.

2019-09-09 - Added deck, fibonacci (dwindle and spiral), gridmode, gapplessgrid, horizgrid, nrowgrid, centeredmaster and flextile layouts. Added alternativetags and awesomebar patches.

2019-09-08 - Added cfacts and vanitygaps patches, added bstack and bstackhoriz layouts

2019-09-07 - Added cyclelayouts, resizecorners, rotatestack, savefloats, statuspadding, switchtag, center and windowrolerule patches

2019-09-06 - Added attachabove, attachaside, attachbelow, attachbottom, autostart, fancybar, focusonnetactive and losefullscreen patches

2019-09-05 - Alpha, systray, togglefullscreen, tagallmon, tagmonfixfs, tagswapmon, pertag and zoomswap patches added

### Patches included:

   - [activetagindicatorbar](https://dwm.suckless.org/patches/activetagindicatorbar/)
      - this patch changes the rectangle indicating if a tag is used by a client into a bar above the tag name

   - [alpha](https://dwm.suckless.org/patches/alpha/)
      - adds transparency for the status bar

   - [alternativetags](https://dwm.suckless.org/patches/alternativetags/)
      - adds alternative tags which can be toggled on the fly for the sole purpose of providing visual aid

   - [alttagsdecoration](https://dwm.suckless.org/patches/alttagsdecoration/)
      - provides the ability to use alternative text for tags which contain at least one window

   - [alwaysfullscreen](https://dwm.suckless.org/patches/alwaysfullscreen/)
      - prevents the focus to drift from the active fullscreen client when using focusstack\(\)

   - [aspectresize](https://dwm.suckless.org/patches/aspectresize/)
      - allows windows to be resized with its aspect ratio remaining constant

   - [attachabove](https://dwm.suckless.org/patches/attachabove/)
      - new windows are placed above selected client

   - [attachaside](https://dwm.suckless.org/patches/attachaside/)
      - new windows are placed on top of the stack

   - [attachbelow](https://dwm.suckless.org/patches/attachbelow/)
      - new windows are placed below selected client

   - [attachbottom](https://dwm.suckless.org/patches/attachbottom/)
      - new windows are placed at the bottom of the stack

   - [autoresize](https://dwm.suckless.org/patches/autoresize/)
      - by default, windows that are not visible when requesting a resize/move will not get resized/moved, with this patch, however, they will

   - [autostart](https://dwm.suckless.org/patches/autostart/)
      - makes dwm run `~/.dwm/autostart_blocking.sh` and `~/.dwm/autostart.sh &` on startup

   - [awesomebar](https://dwm.suckless.org/patches/awesomebar/)
      - enhanced taskbar that allows focus / hiding / unhiding of windows by clicking on the status bar

   - [bar_border](https://codemadness.org/paste/dwm-border-bar.patch)
      - adds a border around the bar similarly to how client windows have borders
  
   - [bar_height](https://dwm.suckless.org/patches/bar_height/)
      - allows the bar height to be explicitly set rather than being derived from font

   - [barmodules](https://github.com/bakkeby/patches/wiki/barmodules/)
      - splits the dwm bar into modules allowing for re-arrangement of the bar and easier integration for new features

   - [barpadding](https://dwm.suckless.org/patches/barpadding/)
      - adds vertical and horizontal space between the statusbar and the edge of the screen

   - [bartabgroups](https://dwm.suckless.org/patches/bartabgroups/)
      - turns the titlebar area into a mfact-respecting tab-bar showing each client's title

   - [center](https://dwm.suckless.org/patches/center/)
      - adds an iscentered rule to automatically center clients on the current monitor

   - [cfacts](https://dwm.suckless.org/patches/cfacts/)
      - the cfacts patch provides the ability to assign different weights to clients in their respective stack in tiled layout

   - [clientindicators](https://dwm.suckless.org/patches/clientindicators/)
      - draws a dot indicator overlayed on each tag icon for each client
      - the selected client is drawn as a larger horizontal line

   - [cmdcustomize](https://dwm.suckless.org/patches/cmdcustomize/)
      - allows color attributes to be set through the command line

   - [colorbar](https://dwm.suckless.org/patches/colorbar/)
      - lets you change the foreground and background color of every statusbar element

   - color_emoji
      - enables color emoji in dmenu by removing a workaround for a BadLength error in the Xft library when color glyphs are used
      - enabling this will crash dwm on encountering such glyphs unless you also have an updated Xft library that can handle them

   - [combo](https://dwm.suckless.org/patches/combo/)
      - allows you to select multiple tags by pressing all the right keys as a combo, e.g. hold MOD and press and hold 1 and 3 together to view those two tags

   - [cool_autostart](https://dwm.suckless.org/patches/cool_autostart/)
      - allows dwm to execute commands from an array in the config.h file
      - when dwm exits all processes from the autostart array will be killed automatically

   - [cyclelayouts](https://dwm.suckless.org/patches/cyclelayouts/)
      - lets you cycle through all your layouts

   - [decoration_hints](https://dwm.suckless.org/patches/decoration_hints/)
      - make dwm respect \_MOTIF\_WM\_HINTS property, and not draw borders around windows requesting for it
      - some applications use this property to notify window managers to not draw window decorations
      - not respecting this property leads to issues with applications that draw their own borders, like chromium (with "Use system title bar and borders" turned off) or vlc in fullscreen mode

   - [dmenumatchtop](https://dwm.suckless.org/patches/dmenumatchtop)
      - updates the position of dmenu to match that of the bar
      - i.e. if topbar is 0 then dmenu will appear at the bottom and if 1 then dmenu will appear at the top

   - [dragcfact](https://github.com/bakkeby/patches/wiki/dragcfact/)
      - lets you resize clients' size (i.e. modify cfact) by holding modkey + shift + right-click and dragging the mouse

   - [dragmfact](https://github.com/bakkeby/patches/wiki/dragmfact/)
      - lets you resize the split in layouts (i.e. modify mfact) by holding the modkey + shift + left-click and dragging the mouse
      - this is a bespoke patch that supports vertical and horizontal layout splits as well as centered master variants

   - [dwmblocks](https://gist.github.com/danbyl/54f7c1d57fc6507242a95b71c3d8fdea)
      - signal integration to use dwm with a patched [dwmblocks](https://github.com/torrinfail/dwmblocks)
      - combined with the statuscmd patch this gives a clickable statusbar

   - [dwmc](http://dwm.suckless.org/patches/dwmc/)
      - a simple dwmc client using a fork of fsignal to communicate with dwm

   - [emptyview](https://dwm.suckless.org/patches/emptyview/)
      - allows no tag at all to be selected
      - dwm will start with no tag selected and when a client with no tag rule is started and no tag is selected then it will be opened on the first tag

   - [ewmhtags](https://dwm.suckless.org/patches/ewmhtags/)
      - adds EWMH support for \_NET_NUMBER_OF_DESKTOPS, \_NET_CURRENT_DESKTOP, \_NET_DESKTOP_NAMES and \_NET_DESKTOP_VIEWPORT, which allows for compatibility with other bars and programs that request workspace information, e.g. polybar's xworkspaces module

   - [exresize](https://dwm.suckless.org/patches/exresize/)
      - this patch allows the user to change size and placement of floating windows using only the keyboard
      - it also allows for temporary vertical and horizontal extension of windows similar to other WMs fill command

   - [~extrabar~](https://dwm.suckless.org/patches/extrabar/)
      - ~enables an extra status bar in dwm in a similar manner to the dualstatus patch~
      - ~if the primary status is at the top via topbar then the extra status bar will be placed at the bottom and vice versa~

   - extrastatus
      - formerly extrabar - now only splits the status into to statuses by using a status separator

   - [fakefullscreen](https://dwm.suckless.org/patches/fakefullscreen/)
      - only allow clients to "fullscreen" into the space currently given to them
      - as an example, this will allow you to view a fullscreen video in your browser on one half of the screen, while having the other half available for other tasks

   - [fakefullscreenclient](https://github.com/bakkeby/patches/wiki/fakefullscreenclient/)
      - similarly to the fakefullscreen patch this patch only allows clients to "fullscreen" into the space currently given to them
      - as an example, this will allow you to view a fullscreen video in your browser on one half of the screen, while having the other half available for other tasks
      - the "twist" with this patch is that fake fullscreen can be toggled on a per client basis rather than applying to all clients globally

   - [fancybar](https://dwm.suckless.org/patches/fancybar/)
      - shows the titles of all visible windows in the status bar

   - flexwintitle
      - based on the bartabgroups patch, this is a layout aware barmodules module for handling window titles intended to be used with flextile-deluxe

   - [~floatbordercolor~](https://dwm.suckless.org/patches/float_border_color/)
      - ~this patch allows a different border color to be chosen for floating windows~

   - [floatpos](https://github.com/bakkeby/patches/wiki/floatpos/)
      - adds a float rule allowing the size and position of floating windows to be specified
      - control the size and position of floating windows similar to exresize, moveresize, moveplace patches
      - specify size and position using absolute, relative or fixed co-ordinates or
      - position floating windows in a grid-like manner

   - [focusadjacenttag](https://dwm.suckless.org/patches/focusadjacenttag/)
      - provides the ability to focus the tag on the immediate left or right of the currently focused tag
      - it also allows to send the focused window either on the left or the right tag

   - [focusmaster](https://dwm.suckless.org/patches/focusmaster/)
      - a simple patch that just puts focus back to the master client

   - [focusonclick](https://dwm.suckless.org/patches/focusonclick/)
      - this patch makes you switch focus only by mouse click and not sloppy (focus follows mouse pointer)

   - [focusonnetactive](https://dwm.suckless.org/patches/focusonnetactive/)
      - by default, dwm responds to \_NET_ACTIVE_WINDOW client messages by setting the urgency bit on the named window
      - this patch activates the window instead

   - [focusurgent](https://dwm.suckless.org/patches/focusurgent/)
      - adds a keyboard shortcut to select the next window having the urgent flag regardless of the tag it is on

   - [fsignal](https://dwm.suckless.org/patches/fsignal/)
      - send "fake signals" to dwm for handling, using xsetroot
      - this will not conflict with the status bar, which also is managed using xsetroot

   - [fullscreen](https://dwm.suckless.org/patches/fullscreen/)
      - applies the monocle layout with the focused client on top and hides the bar
      - when pressed again it shows the bar and restores the layout that was active before going fullscreen

   - [hidevacanttags](https://dwm.suckless.org/patches/hide_vacant_tags/)
      - prevents dwm from drawing tags with no clients (i.e. vacant) on the bar

   - [holdbar](http://dwm.suckless.org/patches/holdbar/)
      - with this patch dwm's built-in status bar is only shown when HOLDKEY is pressed
      - additionally the bar will now overlay the display

   - [ignore-xft-errors-when-drawing-text](https://groups.google.com/forum/m/#!topic/wmii/7bncCahYIww)
      - sometimes dwm crashes when it cannot render some glyphs in window titles (usually emoji)
      - this patch is essentially a hack to ignore any errors when drawing text on the status bar and may be removed if a more appropriate solution comes up

   - [inplacerotate](https://dwm.suckless.org/patches/inplacerotate/)
      - allows rotation of all clients in the master or stack area without affecting the other area

   - [insets](https://dwm.suckless.org/patches/insets/)
      - lets custom insets from each edge of the screen to be defined
      - an example use case would be to make space for an external bar

   - [ipc](https://github.com/mihirlad55/dwm-ipc)
       - implements inter-process communication through a UNIX socket for dwm
       - allows for the window manager to be queried for information, e.g. listen for events such as tag or layout changes, as well as send commands to control the window manager via other programs

   - [ispermanent](https://dwm.suckless.org/patches/ispermanent/)
      - adds rule option for clients to avoid accidental termination by killclient for sticky windows

   - [keymodes](https://dwm.suckless.org/patches/keymodes/)
      - this patch adds key modes (like in vim or emacs) where chains of keyboard shortcuts can be performed

   - [~leftlayout~](http://dwm.suckless.org/patches/leftlayout/)
      - ~moves the layout symbol in the status bar to the left hand side~

   - [losefullscreen](https://github.com/bakkeby/patches/wiki/losefullscreen/)
      - by default in dwm it is possible to make an application fullscreen, then use the focusstack keybindings to focus on other windows beneath the current window
      - it is also possible to spawn new windows (e.g. a terminal) that end up getting focus while the previous window remains in fullscreen
      - this patch ensures that in such scenarios the previous window loses fullscreen

   - [maximize](https://dwm.suckless.org/patches/maximize/)
      - adds helper functions for maximizing, horizontally and vertically, floating windows using keybindings

   - [mdpcontrol](https://dwm.suckless.org/patches/mpdcontrol/)
      - adds keyboard bindings to control MDP (Music Player Daemon)

   - [monitorrules](https://github.com/bakkeby/patches/wiki/monitorrules/)
      - adds rules per monitor, e.g. have default layouts per monitor
      - the use case for this is if the second monitor is vertical (i.e. rotated) then you may want to use a different default layout for this monitor than what is used for the main monitor (for example normal vertical split for main monitor and horizontal split for the second)

   - [monoclesymbol](https://dwm.suckless.org/patches/monoclesymbol/)
      - always display the the monocle-symbol as defined in config.h if the monocle-layout is activated
      - do not display the number of open clients in the current tag

   - [moveresize](https://dwm.suckless.org/patches/moveresize/)
      - allows you to move and resize dwm's clients using keyboard bindings

   - [movestack](https://dwm.suckless.org/patches/movestack/)
      - allows you to move clients around in the stack and swap them with the master

   - [noborder](https://dwm.suckless.org/patches/noborder/)
      - removes the border when there is only one window visible

   - [nodmenu](https://dwm.suckless.org/patches/nodmenu/)
      - enable modifying dmenu in config.def.h which resulted previously in a compilation error because two lines of code hardcode dmenu into dwm
      - allows complete removal of dmenu, should you want to do that

   - [no_transparent_borders](https://github.com/szatanjl/dwm/commit/1529909466206016f2101457bbf37c67195714c8)
      - when terminals have transparency then their borders also become transparent
      - this patch ensures that borders have no transparency
      - note that this patch is only relevant if you are not using the alpha patch

   - [onlyquitonempty](https://dwm.suckless.org/patches/onlyquitonempty/)
      - makes it so dwm will only exit via quit() if no windows are open (in order to prevent accidental loss of work)

   - [pango](https://dwm.suckless.org/patches/pango/)
      - adds simple markup for status messages using pango markup

   - [pertag](https://dwm.suckless.org/patches/pertag/)
      - adds nmaster, mfact, layouts and more per tag rather than per monitor

   - [powerline](https://gitlab.com/udiboy1209-suckless/dwm/-/commit/071f5063e8ac4280666828179f92788d893eea40#4b1a539194be7467cefbda22f675a3b7c19ceca7)
      - adds drawing of powerline arrows (and diagonal lines) for both the status bar and the tags

   - [push](https://dwm.suckless.org/patches/push/)
      - this patch provides a way to move clients up and down inside the client list

   - [reorganizetags](https://dwm.suckless.org/patches/reorganizetags/)
      - shifts all clients per tag to leftmost unoccupied tags
      - e.g. if clients A, B, C are tagged on tags 1, 5, 9 respectively, when reorganized they will now be on tag 1, 2, and 3

   - [resizecorners](https://dwm.suckless.org/patches/resizecorners/)
      - by default, windows only resize from the bottom right corner
      - with this patch the mouse is warped to the nearest corner and you resize from there

   - [resizepoint](https://github.com/bakkeby/patches/wiki/resizepoint/)
      - practically the same as resizecorners, but the cursor does not warp to any of the window corners

   - [restartsig](https://dwm.suckless.org/patches/restartsig/)
      - adds a keyboard shortcut to restart dwm or alternatively by using kill -HUP dwmpid
      - additionally dwm can quit cleanly by using kill -TERM dwmpid

   - [rotatestack](https://dwm.suckless.org/patches/rotatestack/)
      - let's you rotate through the stack using keyboard shortcuts

   - [roundedcorners](https://github.com/mitchweaver/suckless/blob/master/dwm/patches/mitch-06-rounded_corners-f04cac6d6e39cd9e3fc4fae526e3d1e8df5e34b2.patch)
      - adds rounded corners to client windows

   - [savefloats](https://dwm.suckless.org/patches/save_floats/)
      - saves size and position of every floating window before it is forced into tiled mode
      - if the window is made floating again then the old dimensions will be restored

   - [scratchpad](https://dwm.suckless.org/patches/scratchpad/)
      - the scratchpad patch allows you to spawn or restore a floating terminal window

   - [scratchpad_alt_1](https://github.com/GasparVardanyan/dwm-scratchpad)
      - this alternative patch enables a scratchpad feature in dwm similar to the scratchpad feature in i3wm

   - [selfrestart](https://dwm.suckless.org/patches/selfrestart/)
      - restart dwm without the unnecessary dependency of an external script

   - [sendmon_keepfocus](https://github.com/bakkeby/patches/wiki/sendmon_keepfocus/)
      - minor patch that allow clients to keep focus when being sent to another monitor

   - [setborderpx](https://dwm.suckless.org/patches/statuspadding/)
      - this patch allows border pixels to be changed during runtime

   - [shiftview](https://github.com/chau-bao-long/dotfiles/blob/master/suckless/dwm/shiftview.diff)
      - adds keybindings for left and right circular shift through tags
      - also see focusadjacenttag

   - [shiftviewclients](https://github.com/bakkeby/patches/wiki/shiftviewclients/)
      - variant of the shiftview patch which skips tags that have no clients

   - [sizehints](https://dwm.suckless.org/patches/sizehints/)
      - makes dwm obey even "soft" sizehints for new clients

   - [sortscreens](https://www.mail-archive.com/hackers@suckless.org/msg09400.html)
      - this patch aims to address some inconsistencies when it comes to focusmon, tagmon and similar functionality by explicitly sorting screens left to right (or top to bottom in a vertical layout)

   - [spawn_cwd](https://dwm.suckless.org/patches/spawn_cwd/)
      - spawns programs from currently focused client's working directory

   - [stacker](https://dwm.suckless.org/patches/stacker/)
      - provides comprehensive utilities for managing the client stack

   - [~staticstatus~](https://dwm.suckless.org/patches/staticstatus/)
      - ~allows the status text to be fixed to the bar on a specific monitor rather than being drawn on the focused monitor~

   - [status2d](https://dwm.suckless.org/patches/status2d/)
      - allows colors and rectangle drawing in the dwm status bar

   - [~statusallmons~](https://dwm.suckless.org/patches/statuspadding/)
      - ~this patch draws and updates the statusbar on all monitors~

   - [statusbutton](https://dwm.suckless.org/patches/statusbutton/)
      - adds a clickable button to the left hand side of the statusbar

   - [statuscmd](https://dwm.suckless.org/patches/statuscmd/)
      - adds the ability to execute shell commands based on the mouse button and position when clicking the status bar

   - [statuscolors](https://dwm.suckless.org/patches/statuscolors/)
      - enables colored text in the status bar allowing multiple color combinations for use in the status script

   - [statuspadding](https://dwm.suckless.org/patches/statuspadding/)
      - adds configuration options for horizontal and vertical padding in the status bar

   - [steam](https://github.com/bakkeby/patches/wiki/steam)
      - a minor patch that works around the issue of floating Steam windows jumping around the screen when they receive focus

   - [sticky](https://dwm.suckless.org/patches/sticky/)
      - adds toggleable keyboard shortcut to make a client 'sticky', i.e. visible on all tags

   - [swallow](https://dwm.suckless.org/patches/swallow/)
      - this patch adds "window swallowing" to dwm as known from Plan 9's windowing system rio
      - clients marked with isterminal in config.h swallow a window opened by any child process, e.g. running xclock in a terminal
      - closing the xclock window restores the terminal window in the current position

   - [swapfocus](https://dwm.suckless.org/patches/swapfocus/)
      - this patch depends on the pertag patch and makes it possible to switch focus with a single shortcut (mod-s) instead of having to think if you should use mod-j or mod-k for reaching the previously used window

   - [swaptags](https://dwm.suckless.org/patches/swaptags/)
      - allows swapping the contents of the currently selected tag with another tag by using keyboard shortcuts

   - [switchcol](https://dwm.suckless.org/patches/switchcol/)
      - allows you to switch focus between the master and stack columns using a single keybinding

   - [switchtag](https://github.com/bakkeby/patches/wiki/switchtag/)
      - when an application opens on a specific tab this patch adds the option to also switch to that tag when the application starts
      - optionally, the previous view can also be restored when the client is closed

   - [systray](https://dwm.suckless.org/patches/systray/)
      - adds system tray in the status bar

   - [tagall](https://dwm.suckless.org/patches/tagall/)
      - adds keyboard shortcuts to move all (or only floating) windows from one tag to another

   - [tagallmon](https://github.com/bakkeby/patches/wiki/tagallmon/)
      - move all visible windows to an adjacent monitor

   - [tagintostack](https://dwm.suckless.org/patches/tagintostack/)
      - makes new clients attach into the stack area when you toggle a new tag into view
      - this means your master area will remain unchanged when toggling views

   - [taggrid](https://dwm.suckless.org/patches/taggrid/)
      - adds an option to place tags in rows like in many other window managers

   - [tagmonfixfs](https://github.com/bakkeby/patches/wiki/tagmonfixfs/)
      - allows moving a fullscreen window to another monitor while remaining in fullscreen

   - [tagothermonitor](https://dwm.suckless.org/patches/tagothermonitor/)
      - adds functions and keybindings to tag a window to a desired tag on an adjacent monitor

   - [tagswapmon](https://github.com/bakkeby/patches/wiki/tagswapmon/)
      - swap all visible windows on one monitor with those of an adjacent monitor

   - [~titlecolor~](https://dwm.suckless.org/patches/titlecolor/)
      - ~adds a new color scheme used by the (selected) window title in the bar~

   - [togglefullscreen](https://github.com/bakkeby/patches/wiki/togglefullscreen/)
      - allows you to toggle fullscreen on and off using a single shortcut key

   - [transfer](https://dwm.suckless.org/patches/transfer/)
      - lets you transfer the currently focused client between the master and stack area while increasing or decreasing the master area (nmaster) accordingly

   - [transferall](https://dwm.suckless.org/patches/transfer/)
      - lets you transfer all clients between the master and stack area while increasing or decreasing the master area (nmaster) accordingly

   - [unfloatvisible](https://dwm.suckless.org/patches/unfloatvisible/)
      - resets isfloating on any visible windows that have it set and optionally also applies a layout

   - [killunsel](https://dwm.suckless.org/patches/killunsel/)
      - kills all visible clients that are not selected (only the selected client will remain)

   - [~urgentborder~](https://dwm.suckless.org/patches/urgentborder/)
      - ~this patch makes "urgent" windows have different colors~

   - [vanitygaps](https://github.com/bakkeby/patches/blob/master/dwm/dwm-vanitygaps-6.2.diff)
      - adds configurable gaps between windows differentiating between outer, inner, horizontal and vertical gaps

   - [viewontag](https://dwm.suckless.org/patches/viewontag/)
      - follow a window to the tag it is being moved to

   - [vtcolor](https://dwm.suckless.org/patches/vtcolors/)
      - this patch adds the ability for dwm to read colors from the linux virtual console essentially allowing you to use the same color scheme as your regular tty

   - [warp](https://dwm.suckless.org/patches/warp/)
      - warps the mouse cursor to the center of the currently focused window or screen when the mouse cursor is (a) on a different screen or (b) on top of a different window

   - [windowrolerule](https://github.com/bakkeby/patches/wiki/windowrolerule/)
      - sometimes a single application opens different windows depending on the task at hand and this is often reflected in the WM_WINDOW_ROLE(STRING) x property
      - this patch adds the role field to the rule configuration so that one can differentiate between, say, Firefox "browser" vs "Preferences" vs "Manager" or Google-chrome "browser" vs "pop-up".

   - [winview](http://dwm.suckless.org/patches/winview/)
      - allows switching the view to that of a given client from the all-window view (Mod-0) using a keyboard shortcut

   - [xrdb](http://dwm.suckless.org/patches/xrdb/)
      - allows dwm to read colors from xrdb (.Xresources) during runtime

   - [zoomfloating](https://www.reddit.com/r/suckless/comments/ie5fe3/zoomfloating_my_own_simple_original_patch/)
      - a simple patch that allows floating windows to be zoomed into the master stack position

   - [zoomswap](https://dwm.suckless.org/patches/zoomswap/)
      - allows a master and a stack window to swap places rather than every window on the screen changing position

### Layouts included:

   - [bstack](https://dwm.suckless.org/patches/bottomstack/)
      - bottomstack layout

   - [bstackhoriz](https://dwm.suckless.org/patches/bottomstack/)
      - bottomstack horizontal layout

   - [centeredmaster](https://dwm.suckless.org/patches/centeredmaster/)
      - centeredmaster layout

   - [centeredfloatingmaster](https://dwm.suckless.org/patches/centeredmaster/)
      - centeredfloatingmaster layout

   - [columns](https://dwm.suckless.org/patches/columns/)
      - same as the default tile layout except clients in the master area are arranged in columns (i.e. left to right)

   - [deck](https://dwm.suckless.org/patches/deck/)
      - deck layout - clients in the stack area are arranged on top of each other (like monocle)

   - [fibonacci](https://dwm.suckless.org/patches/fibonacci/)
      - fibonacci (dwindle and spiral) layouts

   - [flextile-deluxe](https://github.com/bakkeby/patches/wiki/flextile-deluxe/)
      - a re-envisioned, flexible and over-the-top version of the original [flextile](https://dwm.suckless.org/patches/flextile/) patch supporting
         - multiple split layouts (horizontal, vertical, centered, floating, fixed)
         - tile arrangement on a per split basis (stack horizontally, stack vertically, grids, fibonacci)
         - pertag, cfacts, rmaster, vanitygaps compatibility
         - tile, deck, monocle, centeredmaster, bstack, bstackhoriz, gapplessgrid and more
      - this gives you a lot of versatility in terms of layout

   - [gapplessgrid](https://dwm.suckless.org/patches/gaplessgrid/)
      - gappless grid layout

   - [gridmode](https://dwm.suckless.org/patches/gridmode/)
      - gridmode (grid) layout

   - [horizgrid](https://dwm.suckless.org/patches/horizgrid/)
      - horizontal grid layout

   - [nrowgrid](https://dwm.suckless.org/patches/nrowgrid/)
      - nrowgrid layout, number of rows in grid controlled by nmaster

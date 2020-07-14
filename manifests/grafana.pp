# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include isoc::grafana

class isoc::grafana (
  $image_renderer = true,
  $image_renderer_packages = [ "libXcomposite", "libXdamage", "libXtst", "cups", "libXScrnSaver", "pango", "atk", "adwaita-cursor-theme", "adwaita-icon-theme", "at", "at-spi2-atk", "at-spi2-core", "cairo-gobject", "colord-libs", "dconf", "desktop-file-utils", "ed", "emacs-filesystem", "gdk-pixbuf2", "glib-networking", "gnutls", "gsettings-desktop-schemas", "gtk-update-icon-cache", "gtk3", "hicolor-icon-theme", "jasper-libs", "json-glib", "libappindicator-gtk3", "libdbusmenu", "libdbusmenu-gtk3", "libepoxy", "liberation-fonts", "liberation-narrow-fonts", "liberation-sans-fonts", "liberation-serif-fonts", "libgusb", "libindicator-gtk3", "libmodman", "libproxy", "libsoup", "libwayland-cursor", "libwayland-egl", "libxkbcommon", "m4", "mailx", "nettle", "patch", "psmisc", "redhat-lsb-core", "redhat-lsb-submod-security", "rest", "spax", "time", "trousers", "xdg-utils", "xkeyboard-config" ],
){
    if $image_renderer {
        package {$image_renderer_packages:
            ensure => present
        }
    }
}

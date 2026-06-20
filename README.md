<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/c768e2b8-692f-4179-ab01-5a7197e3cc8a">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/5c17d5b2-910c-486b-890b-3cf63801d490">
  <img height="72pt" alt="Darkly" src="https://github.com/user-attachments/assets/5c17d5b2-910c-486b-890b-3cf63801d490" />
</picture>
<br>
<br>

![Darkly](https://github.com/user-attachments/assets/624352f7-ac29-46e4-b2e8-bb7df3ecb7ed)

Forked from the ***lightly*** theme, this style brings a fresh and unique look to your applications

***

### What to expect?

The main goal is to provide a style for **Qt applications**.

Other than that we maintain a style for **Plasma window decorations** and a **color scheme**.

Most changes are optional, if you don't like them, you can turn them off in the settings.

***

### GTK style

If you want **a matching style for your gtk applications**, I recommend checking out this project:

<https://github.com/wrymt/darkly-gtk>

***

## Installation

## Automatic

### Thanks to @DeltaCopy, you can use one of these install methods:

#### Fedora copr

<https://copr.fedorainfracloud.org/coprs/deltacopy/darkly/>

#### AUR

<https://aur.archlinux.org/packages/darkly>

<https://aur.archlinux.org/packages/darkly-bin>

#### Pre-built packages

<https://github.com/Bali10050/Darkly/releases>

***
#### Solus
Thanks to @Hurican-Solas

```
sudo eopkg install darkly
```


## Manual

### Installation script

> [!NOTE]
> A script called `install.sh` is now available which both builds and installs this application style.

`./install.sh` will remove if existing, build and install Darkly using QT6 dependencies.

`./install.sh remove` will remove Darkly.

***

### Flatpak

Due to flatpak's [restriction on file system access](https://docs.flatpak.org/en/latest/sandbox-permissions.html) (in short no access to system libraries, /dev, etc), Darkly flatpak bundle is only an extension of KDE runtime.

**Important (primarily) for users of immutable distros!**\
Darkly won't show as an option in `System settings > Theme > Application styles` without system installation. Also, both Darkly runtime version and the KDE runtime version must match (if they don't match, the app won't use Darkly)

This brings some untentended behaviour (for any application style, not Darkly in particular), for example:
- Changing color scheme partly applies for QWidget apps (not at all for QML-based)
- Changing application style doesn't apply until the app is restarted

Manifests should have the latest versions of KDE Runtime and SDK. Change the version accordingly. (you can find the version of runtime for each app by running `flatpak list --app --columns=app,runtime`)

Flatpak manifests can be found inside the flatpak directory.

#### QT6.9 Build with:
```
org.flatpak.Builder flatpak-build --repo=local --force-clean --ccache flatpak/org.kde.KStyle.Darkly6.9.json
```

#### QT6.10 Build with:
```
org.flatpak.Builder flatpak-build --repo=local --force-clean --ccache flatpak/org.kde.KStyle.Darkly6.10.json
```

#### Bundle with:
```
flatpak build-bundle local/ darkly.flatpak runtime/org.kde.KStyle.Darkly/x86_64/<runtime_version>
```
Where `<runtime_version>` can be 6.9 or 6.10

#### Install with:

`flatpak install darkly.flatpak`


### Post installation steps:

If you want to apply Darkly as the application style.

Adjust flatpak settings (via Flatseal or command)

- Set environment variables: `QT_STYLE_OVERRIDE=Darkly` and `QT_QPA_PLATFORMTHEME=kde`
- `sudo flatpak override --env=QT_QPA_PLATFORMTHEME=kde` (`sudo` only applies for flatpaks in /var/lib/flatpak, otherwise use `--user` without sudo)

- Allow filesystem access to `xdg-config/darklyrc:ro`

***

#### Void Linux

```
sudo xbps-install -Sy git extra-cmake-modules base-devel qt6-base-devel \
      kf6-kcoreaddons-devel kf6-kcmutils-devel kf6-kconfig-devel \
      kf6-kguiaddons-devel kf6-ki18n-devel kf6-kiconthemes-devel \
      kf6-kwindowsystem-devel kf6-kirigami-devel kf6-kdecoration-devel \
      kf6-frameworkintegration-devel
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>Arch Linux</u>

```
sudo pacman -S --needed cmake extra-cmake-modules kdecoration qt6-declarative kcoreaddons \
      kcmutils kcolorscheme kconfig kguiaddons kiconthemes kwindowsystem git gcc make
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>Fedora</u>

##### Fedora

```
sudo dnf install git cmake extra-cmake-modules "cmake(KDecoration3)" kwin-devel \
      kf6-kcolorscheme-devel kf6-kguiaddons-devel kf6-ki18n-devel kf6-kiconthemes-devel \
      kf6-kirigami-devel kf6-kcmutils-devel kf6-frameworkintegration-devel \
      libepoxy-devel
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>openSUSE Tumbleweed</u>

```
sudo zypper in --no-recommends git ninja cmake kf6-extra-cmake-modules kf6-kconfig-devel \
      kf6-frameworkintegration-devel gmp-ecm-devel kf6-kconfigwidgets-devel \
      kf6-kguiaddons-devel kf6-ki18n-devel kf6-kiconthemes-devel kf6-kwindowsystem-devel \
      kf6-kcolorscheme-devel kf6-kcoreaddons-devel kf6-kcmutils-devel \
      qt6-quick-devel kf6-kirigami-devel qt6-base-devel kdecoration6-devel \
      qt6-tools qt6-widgets-devel gcc-c++ extra-cmake-modules libepoxy-devel \
      kirigami2-devel qt6-quickwidgets-devel
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>KDE neon</u>

```
sudo apt install git build-essential cmake kf6-extra-cmake-modules \
      kf6-extra-cmake-modules kf6-frameworkintegration-dev \
      kf6-kcmutils-dev kf6-kcolorscheme-dev kf6-kconfig-dev kf6-kconfigwidgets-dev \
      kf6-kcoreaddons-dev kf6-kguiaddons-dev kf6-ki18n-dev kf6-kiconthemes-dev \
      kf6-kirigami-dev kf6-kpackage-dev kf6-kservice-dev kf6-kwindowsystem-dev \
      libx11-dev libkdecorations2-dev gettext qt6-svg-dev qt6-base-dev \
      qt6-declarative-dev
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>Distrobox (Fedora 41)</u>

```
distrobox create --name lightly --image registry.fedoraproject.org/fedora-toolbox:41
distrobox enter lightly
```

```
sudo dnf install git cmake extra-cmake-modules "cmake(KDecoration3)" kwin-devel \
    kf6-kcolorscheme-devel kf6-kguiaddons-devel kf6-ki18n-devel kf6-kiconthemes-devel \
    kf6-kirigami-devel kf6-kcmutils-devel \
    libepoxy-devel

git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib64 \
      -DBUILD_TESTING=OFF ..

cd ./kdecoration/config/
make -j $(nproc)
cd ../../
make -j $(nproc)
make install
```

```
Set environment variable on plasma startup:

echo "export QT_PLUGIN_PATH=$HOME/.local/lib64/plugins:\$QT_PLUGIN_PATH" > $HOME/.config/plasma-workspace/env/localthemes.sh && chmod +x $HOME/.config/plasma-workspace/env/localthemes.sh
```

---

#### <u>Kubuntu (25.04)</u>

```
sudo apt-get install cmake build-essential libkdecorations3-dev \
      extra-cmake-modules qt6-base-dev libkf6coreaddons-dev \
      libkf6colorscheme-dev libkf6config-dev libkf6guiaddons-dev \
      libkf6i18n-dev libkf6iconthemes-dev libkf6windowsystem-dev \
      libkf6kcmutils-dev libkirigami-dev libkf6style-dev
```

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>Termux</u>

```bash
pkg install -y cmake extra-cmake-modules kdecoration kf6-kcoreaddons kf6-kcmutils \
      kf6-kcolorscheme kf6-kconfig kf6-kguiaddons kf6-ki18n kf6-kiconthemes \
      kf6-kwindowsystem kf6-kirigami kf6-frameworkintegration qt6-qtbase \
      qt6-qtdeclarative qt6-qtsvg git
```

```bash
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

---

#### <u>NixOS</u>

To install Darkly on NixOS, add the following line to your nixos flake
```nix
environment.systemPackages = with pkgs; [ darkly ];
qt.platformTheme = "qtct";
```
For home-manager, add the following line
```nix
qt.style.package = with pkgs; [ darkly ];
qt.platformTheme.name = "qtct";
```
To apply the theme, use qt6ct and select Darkly

If you want to compile Darkly from its source, do the following
1. add `inputs.darkly.url = "github:Bali10050/Darkly";` to `flake.nix`

2. use the following package name for home-manager or NixOS
```nix
inputs.darkly.packages.${pkgs.system}.darkly-qt6
```

---

### Alpine Linux / postmarketOS
 
```
doas apk add --virtual build-deps bash build-base clang21-extra-tools git cmake extra-cmake-modules kdecoration-dev \
      kcmutils-dev kcolorscheme-dev kwindowsystem-dev kirigami-dev frameworkintegration-dev
```
 
```
git clone --single-branch --depth=1 https://github.com/Bali10050/Darkly.git
cd Darkly
./install.sh
```

```
doas apk del build-deps
```

---

### Transparency
Plasma by default uses the qqc2-desktop-style, that means Qt Quick applications will mostly look like Qt applications.
However we don't really have control over how those applications look.
This also means that if you want to use transparency, you'll need something that can blur things that don't support it by default.
I recommend checking out [kwin-effects-better-blur-dx](https://github.com/xarblu/kwin-effects-better-blur-dx) or [kwin-effects-glass](https://github.com/4v3ngR/kwin-effects-glass) to get around this issue

> [!NOTE]
> These effects conflict with the stock blur effect and other effects replacing it.

***

### Older plasma versions

For plasma versions below 6.3, please use [v0.5.16](https://github.com/Bali10050/Darkly/releases/tag/v0.5.16) or the [Darkly-6.2](https://github.com/Bali10050/Darkly/tree/Darkly-6.2) branch.

For plasma versions below 6.5, please use [v0.5.25](https://github.com/Bali10050/Darkly/releases/tag/v0.5.25) or the [Darkly-6.4](https://github.com/Bali10050/Darkly/tree/Darkly-6.4) branch.



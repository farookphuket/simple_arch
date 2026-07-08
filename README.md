# Simple Arch (Modular Version)

`simple_arch` is an automated configuration suite designed to simplify the deployment of Arch Linux with a clean, fully-optimized **DWM (Dynamic Window Manager)** environment[cite: 1]. 

This updated version features a **Modular Architecture** and a **Sudo Cache System**, allowing you to enter your password once at startup and let the entire process run unattended.

---

## 🚀 How to Use (Quick Start)

After performing a fresh, clean Arch Linux installation and establishing an internet connection, open your terminal and run the following single-line command:

```bash

git clone [https://github.com/farookphuket/simple_arch.git](https://github.com/farookphuket/simple_arch.git) && cd ~/simple_arch && sh setup.sh

```


> Note: The script will open an interactive setup menu. Once you confirm and enter your sudo password at the prompt, the installation becomes fully automated. You do not need to sit and wait to re-enter passwords.


📂 Project StructureThe project has been separated into independent modules for easier maintenance and cleaner customization:  

```
simple_arch/
├── README.md              # Project documentation and guide
├── setup.sh               # Master installer script (Manages sudo cache & calls modules)
└── modules/{01_core_tools.sh,02_sound_system.sh,03_fonts_assets.sh,04_user_apps.sh}               # Sub-installation components
    ├── 01_core_tools.sh   # Installs Xorg display server & essential command-line tools
    ├── 02_sound_system.sh # Migrates system sound to modern PipeWire audio stack
    ├── 03_fonts_assets.sh # Clones custom fonts, themes, wallpapers & compiles Suckless tools
    └── 04_user_apps.sh    # Deploys personal user applications & development environment


```


## 🎙️ Modern Sound System (PipeWire)

> The system automatically switches from legacy sound architectures to PipeWire. 
It installs the pipewire-audio, pipewire-pulse, and wireplumber stacks to ensure seamless audio stream management.  OBS Studio Fix: Included natively. Microphone and USB wireless devices route perfectly into OBS Studio capture paths.  Audio Control: pavucontrol and alsa-utils are pre-installed to let you granularly scale, override, or mute input captures directly.  📦 Core User Applications Directory (Module 04)Below is the breakdown of user applications bundled automatically inside modules/04_user_apps.sh:  



## 🛠️ Everyday Desktop Utilities

1. spectacle – A highly functional screenshot tool that captures your screen and allows easy image annotation/editing.
2. galculator – A lightweight, fast-loading desktop calculator.  
3. libreoffice-fresh-th – Full office productivity suite deployed with native Thai language rendering support.  
4. simple-scan – A streamlined utility for managing physical document scanners.  
5. gparted – Graphical partition manager for organizing drives safely.  
6. gthumb – A versatile image viewer, browser, and basic editor.  
7. vlc / vlc-plugins-all – The robust open-source media player packed with every critical codec out of the box.  
8. obs-studio – Advanced screen recording and video streaming software.  


## 💻 Web Development & Environment (Laravel & Next.js Stack)

1. code – Visual Studio Code (OSS version) text editor.  
2. neovim – High-performance extensible terminal text editor.  
3. tmux – Terminal multiplexer to manage multiple window sessions efficiently.  
4. docker / docker-compose – Complete containerization environment (Systemd daemon starts automatically on boot). 
5. nodejs / npm / yarn – Full JavaScript environment necessary for frontend Next.js development workflow.  
6. composer – PHP dependency manager required for backend Laravel service architectures.  
7. dbeaver – Universal graphical client database management tool.  
8. sqlitebrowser – Compact visual GUI browser to inspect local SQLite files.  
9. postman-bin – Desktop client tool for sending and testing backend API endpoints.  
10. ollama – Local machine learning platform to execute AI language models directly in your terminal.  


## 🌐 Internet Browsers 

> Internet Browsers & Power Toolsgoogle-chrome 

– Primary stable web browser environment.  
- firefox – Secondary privacy-focused stable browser.  
- chromium – Open-source web engine base browser.  
- yazi – Blazing fast terminal-based file manager utilizing asynchronous directory indexing.  
- fastfetch – System info hardware fetching application.  
- yt-dlp – Advanced CLI video downloader tool.  


## 📝 Customizing Your App List 

> If you wish to add or remove software packages from your personalized system build, 
you do not need to modify the main script logic. 

> Simply open modules/04_user_apps.sh and edit the array declarations[cite: 2]:  

```

CORE_USER_APPS=(
  "spectacle"[cite: 3]
  "your-new-package-here"
)

```

Developed and maintained by Farook Phuket. Built for clean efficiency.



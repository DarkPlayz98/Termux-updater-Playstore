#!/data/data/com.termux/files/usr/bin/bash

# Silent initial setup for visual tools
if ! command -v figlet &> /dev/null || ! command -v lolcat &> /dev/null; then
    apt-get update > /dev/null 2>&1
    apt-get install figlet lolcat -y > /dev/null 2>&1
fi

show_menu() {
    clear
    figlet -f slant "DARK TOOLBOX" | lolcat
    echo -e "\e[1;36m========================================================\e[0m"
    echo -e "\e[1;32m  1.\e[0m Select Fast Mirror & Upgrade System"
    echo -e "\e[1;32m  2.\e[0m Install AI & Bot Toolkit (Node.js, Python, Git)"
    echo -e "\e[1;32m  3.\e[0m Setup PM2 (Run Node.js bots in the background)"
    echo -e "\e[1;32m  4.\e[0m Grant Android Storage Permissions"
    echo -e "\e[1;32m  5.\e[0m Deep System Clean (Free up storage)"
    echo -e "\e[1;32m  6.\e[0m Exit"
    echo -e "\e[1;36m========================================================\e[0m"
    echo -n -e "\e[1;33mSelect an option [1-6]: \e[0m"
}

while true; do
    show_menu
    read choice
    case $choice in
        1)
            echo -e "\n\e[1;36mSelect a server mirror for the fastest download speed:\e[0m"
            echo -e "\e[1;32m  1)\e[0m Global CDN (Cloudflare - Most Reliable)"
            echo -e "\e[1;32m  2)\e[0m Asia / India Region (Tsinghua - Recommended for lowest ping)"
            echo -e "\e[1;32m  3)\e[0m Europe (Grimler)"
            echo -n -e "\e[1;33mChoose your mirror [1-3]: \e[0m"
            read mirror_choice

            case $mirror_choice in
                1) REPO_URL="https://packages.termux.dev/apt/termux-main" ;;
                2) REPO_URL="https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main" ;;
                3) REPO_URL="https://grimler.se/termux/termux-main" ;;
                *) echo -e "\e[1;31mInvalid selection. Defaulting to Global CDN.\e[0m"; REPO_URL="https://packages.termux.dev/apt/termux-main" ;;
            esac

            echo -e "\n\e[1;33m[*] Locking in mirror and bypassing dead Play Store repos...\e[0m"
            echo "deb $REPO_URL main" > $PREFIX/etc/apt/sources.list
            
            apt-get update -o Acquire::AllowInsecureRepositories=true > /dev/null 2>&1
            apt-get install termux-keyring -y --allow-unauthenticated > /dev/null 2>&1
            
            echo -e "\e[1;32m[*] Pulling latest packages from selected mirror...\e[0m"
            apt-get update -y && apt-get upgrade -y
            
            echo -e "\n\e[1;32m[✔] System updated lightning fast!\e[0m"
            sleep 3
            ;;
        2)
            echo -e "\n\e[1;33m[*] Installing essential Android dev tools...\e[0m"
            pkg install -y git nodejs python wget curl openssh build-essential
            echo -e "\n\e[1;32m[✔] Environment ready for bot and AI development!\e[0m"
            sleep 3
            ;;
        3)
            echo -e "\n\e[1;33m[*] Installing PM2 via npm...\e[0m"
            npm install -g pm2
            echo -e "\n\e[1;32m[✔] PM2 Installed! Use 'pm2 start index.js' to keep bots alive.\e[0m"
            sleep 3
            ;;
        4)
            echo -e "\n\e[1;33m[*] Requesting Android storage access...\e[0m"
            termux-setup-storage
            echo -e "\e[1;32m[✔] Please click 'Allow' on the Android popup if it appears.\e[0m"
            sleep 3
            ;;
        5)
            echo -e "\n\e[1;33m[*] Sweeping old dependencies and apt cache...\e[0m"
            apt-get autoremove -y && apt-get clean
            echo -e "\n\e[1;32m[✔] Storage optimized!\e[0m"
            sleep 3
            ;;
        6)
            echo -e "\n\e[1;35m[✦] Toolbox closed. Maintained by Itz_MeDark\e[0m"
            exit 0
            ;;
        *)
            echo -e "\n\e[1;31m[!] Invalid option. Please type a number from 1 to 6.\e[0m"
            sleep 2
            ;;
    esac
done

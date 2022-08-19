#!/bin/bash

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

echo ""
echo "   ======================================================================"
echo -e "   ======                \e[1;91mMTIE MIGUEL MARTINEZ\e[0m                      ======"
echo -e "   ==                                                                  =="
echo -e "   ==   \e[39m                 ░░  ░░                           \e[0m             =="
echo -e "   ==   \e[39m               ░░  ░░  ░░                         \e[0m             =="
echo -e "   ==   \e[39m                   ░░                             \e[0m             =="
echo -e "   ==                                                                  =="
echo -e "   ==   \e[96m             ██████████████                       \e[0m             =="
echo -e "   ==   \e[96m           ██░░░░░░░░░░░░░░████                   \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░░░░░░░░░░░░░░░██                 \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░░░░░░░░░░░░░░░░░██      ██  ██   \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░░░░░░░░░░░░░░░░░██    ██░░██░░██ \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░  ██░░░░░░░░░░░░██    ██░░░░░░██ \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░████░░░░░░░░░░░░██    ██░░░░░░██ \e[0m             =="
echo -e "   ==   \e[96m         ██░░░░░░░░░░░░░░░░░░░░░░░░██    ██░░██   \e[0m             =="
echo -e "   ==   \e[96m         ██          ░░░░░░░░░░░░░░░░████░░░░██   \e[0m             =="
echo -e "   ==   \e[96m           ██        ██░░░░      ░░░░░░░░░░██     \e[0m             =="
echo -e "   ==   \e[96m             ████████████░░████████████████       \e[0m             =="
echo -e "   ==   \e[96m                 ████    ████                     \e[0m             =="
echo -e "   ==                                                                  =="
echo -e "   ==           ███╗   ███╗███╗   ███╗███╗   ███╗██╗   ██╗             =="
echo -e "   ==           ████╗ ████║████╗ ████║████╗ ████║██║   ██║             =="
echo -e "   ==           ██╔████╔██║██╔████╔██║██╔████╔██║██║   ██║             =="
echo -e "   ==           ██║╚██╔╝██║██║╚██╔╝██║██║╚██╔╝██║╚██╗ ██╔╝             =="
echo -e "   ==           ██║ ╚═╝ ██║██║ ╚═╝ ██║██║ ╚═╝ ██║ ╚████╔╝              =="
echo -e "   ==           ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝  ╚═══╝               =="
echo -e "   ==                                                                  =="
echo -e "   ======           \e[1;91mINSTALLATION OF DOCKER IN VPS\e[0m                  ======"
echo -e "   ======================================================================"
echo ""

echo -e "${GREEN}-> Do you want to continue with the installation [Y/n]:? ${NORMAL}\c  "
read condicion

echo ""
while [ $condicion != "Y" ] && [ $condicion != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${GREEN}-> Do you want to continue with the installation [Y/n]:? ${NORMAL}\c"
    read condicion
done

if [ $condicion == "n" ]; then
    echo "   ======================================================================"
    echo -e "   ======               ${YELLOW}Thanks, come back soon!\e[0m                    ======"
    echo -e "   ======                \e[1;91mMTIE MIGUEL MARTINEZ\e[0m                      ======"
    echo "   ======================================================================"
    exit 1
fi

echo "   ======================================================================"
echo -e "   ======               \e[91mUpdating operating system\e[0m                  ======"
echo "   ======================================================================"
apt update && sudo apt upgrade -y

echo ""
echo "   ======================================================================"
echo -e "   ======          \e[33mRemoving previous versions of Docker\e[0m            ======"
echo -e "   ======                  \e[33min case they exist\e[0m                      ======"
echo "   ======================================================================"
apt remove docker-ce docker-ce-cli containerd.io -y
apt remove docker docker-engine docker.io containerd runc -y

echo ""
echo "   ======================================================================"
echo -e "   ======              \e[32mAdd Docker’s official GPG key:\e[0m              ======"
echo -e "   ======                   \e[33m- ca-certificates\e[0m                      ======"
echo -e "   ======                   \e[33m- curl\e[0m                                 ======"
echo -e "   ======                   \e[33m- gnupg\e[0m                                ======"
echo -e "   ======                   \e[33m- lbs-release\e[0m                          ======"
echo "   ======================================================================"
apt update
echo "   ======================================================================"
apt install \
ca-certificates \
curl \
gnupg \
lsb-release

echo ""
echo "   ======================================================================"
echo -e "   ======             \e[91mInstalling and upgrading packages\e[0m            ======"
echo "   ======================================================================"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo ""
echo "   ======================================================================"
echo -e "   ======        \e[96mAdding repository for Docker installations\e[0m        ======"
echo "   ======================================================================"

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ""
echo "   ======================================================================"
echo -e "   ======                \e[96mDocker installation begins\e[0m                ======"
echo "   ======================================================================"
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo ""
echo "   ======================================================================"
echo -e "   ======                      \e[32mEnabling docker\e[0m                     ======"
echo "   ======================================================================"
systemctl enable docker
systemctl status docker

echo ""
echo -e "${YELLOW}-> You want to create a new user for Docker [Y/n]:? ${NORMAL}\c  "
read condicion

echo ""
while [ $condicion != "Y" ] && [ $condicion != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> You want to create a new user for Docker [Y/n]:? ${NORMAL}\c"
    read condicion
done

if [ $condicion == "n" ]; then
    echo ""
    echo "   ======================================================================"
    echo -e "   ======               ${YELLOW}Thanks, come back soon!\e[0m                    ======"
    echo -e "   ======                \e[1;91mMTIE MIGUEL MARTINEZ\e[0m                      ======"
    echo "   ======================================================================"
    exit 1
fi

echo ""
echo "   ======================================================================"
echo -e "   ======         \e[1;91mComplete the requested information\e[0m               ======"
echo "   ======================================================================"

echo ""
echo -e "${GREEN}-> Enter the username to manage docker: ${NORMAL}\c  "
read uDocker

echo ""
echo "   ======================================================================"
echo -e "   ======                                                          ======"
echo -e "   ======              \e[32mCreating the user" ${uDocker} "\e[0m                ======"
echo -e "   ======                                                          ======"
adduser $uDocker
echo -e "   ======        \e[32mAssigning user ${uDocker} to Docker group\e[0m          ======"
echo -e "   ======                                                          ======"
usermod -aG docker $uDocker
echo "   ======================================================================"

echo ""
echo "   ======================================================================"
echo -e "   ======                      ${GREEN}Congratulations!!!\e[0m                  ======"
echo -e "   ======                     ${YELLOW}Now you have Docker\e[0m                  ======"
echo -e "   ======                ${YELLOW}and Docker Compose installed!\e[0m             ======"
echo -e "   ======                    \e[91mMTIE MIGUEL MARTINEZ\e[0m                  ======"
echo "   ======================================================================"

echo ""
echo -e "${YELLOW}-> Do you want to continue with the installation of the Traefik and Portainer containers? [Y/n]:? ${NORMAL}\c  "
read condicion

echo ""
while [ $condicion != "Y" ] && [ $condicion != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> Do you want to continue with the installation of the Traefik and Portainer containers? [Y/n]:? ${NORMAL}\c"
    read condicion
done

if [ $condicion == "n" ]; then
    echo ""
    echo "   ======================================================================"
    echo -e "   ======               ${YELLOW}Thanks, come back soon!\e[0m                    ======"
    echo -e "   ======                \e[91mMTIE MIGUEL MARTINEZ\e[0m                      ======"
    echo "   ======================================================================"
    exit 1
fi

./02-deploy.sh $uDocker
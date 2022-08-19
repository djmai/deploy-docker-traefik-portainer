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

REPO_GIT="https://github.com/kike28/app-docker-server.git"
FOLDER_WORK=$(pwd)
FOLDER_OPT="/opt"
uDocker=$1

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
echo -e "   ======           \e[1;91mTRAEFIK AND PORTAINER DEPLOYMENT\e[0m               ======"
echo -e "   ======================================================================"
echo ""

echo ""
echo -e "${YELLOW}-> Do you want to initialize the project deployment? [Y/n]:? ${NORMAL}\c  "
read condicion

echo ""
while [ $condicion != "Y" ] && [ $condicion != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> Do you want to initialize the project deployment? [Y/n]:? ${NORMAL}\c"
    read condicion
done

if [ $condicion == "n" ]; then
    echo ""
    echo "   ========================================================================="
    echo -e "               ${YELLOW}Thanks, come back soon!\e[0m              "
    echo -e "                \e[91mMTIE MIGUEL MARTINEZ\e[0m                "
    echo "   ========================================================================="
    exit 1
fi

echo ""
echo -e "${YELLOW}-> Want to move the core folder to ${FOLDER_OPT} ? [Y/n]:? ${NORMAL}\c  "
read mv_core

echo ""
while [ $mv_core != "Y" ] && [ $mv_core != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> Want to move the core folder to ${FOLDER_OPT} ? [Y/n]:? ${NORMAL}\c"
    read mv_core
done

if [ $mv_core == "Y" ]; then
    FOLDER_WORK=$FOLDER_OPT
    # echo "   ========================================================================="
    echo -e "    ${GREEN}Moving core folder to ${FOLDER_WORK}!\e[0m     "
    # mv core /opt
    # echo "   ========================================================================="
fi

echo ""
echo "   ========================================================================="
echo -e "                                ${RED}Traefik${NORMAL}                   "
echo -e "                     ${YELLOW}Mail configuration for SSL${NORMAL}          "
# echo "   ========================================================================="

echo ""
echo -e "${YELLOW}-> Please enter a valid email address? [tucorreo@mail.com]: ${NORMAL}\c  "
read eTraefik

regex='^(([A-Za-z0-9]+((\.|\-|\_|\+)?[A-Za-z0-9]?)*[A-Za-z0-9]+)|[A-Za-z0-9]+)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+)*)+\.([A-Za-z]{2,})+$'
while [[ ! ("${eTraefik}" =~ $regex) ]]; do
    echo -e "${RED}-> ERROR: It is not a valid email address${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> Please enter a valid email address? [tucorreo@mail.com]: ${NORMAL}\c"
    read eTraefik
done

echo ""
echo -e "     ${GREEN}Saving mail in:\e[0m             "
echo -e "     \e[91m$FOLDER_WORK/traefik-data/traefik.yml\e[0m      "
sed -i 's/USER_EMAIL_LETSENCRYPT/'$eTraefik'/g' $FOLDER_WORK/core/traefik-data/traefik.yml

echo ""
echo "   ========================================================================="
echo -e "                ${GREEN}Installing apache2-utils${NORMAL}            "
apt install -y apache2-utils

echo ""
echo "   ========================================================================="
echo -e "                          ${RED}Traefik${NORMAL}                   "
echo -e "             ${YELLOW}Username and Password Generation${NORMAL}       "

echo ""
echo -e "${YELLOW}-> Enter the username for Traefik: ${NORMAL}\c  "
read uTraefix

echo ""
echo -e "${YELLOW}-> Enter the password for the Traefik user: ${NORMAL}\c  "
read -s pTraefix

gPassword=$(htpasswd -nb $uTraefix $pTraefix)
sed -i 's/USER_BASIC_AUTH/'${gPassword}'/g' $FOLDER_WORK/core/traefik-data/configurations/dynamic.yml

echo ""
echo "   ========================================================================="
echo -e "                          ${RED}Traefik${NORMAL}                   "
echo -e "     ${YELLOW}Assignment of permissions 600 to the file${NORMAL}       "
echo -e "     ${GREEN}${FOLDER_WORK}/core/traefik-data/acme.json${NORMAL}       "
echo "   ========================================================================="
chmod 600 $FOLDER_WORK/core/traefik-data/acme.json

echo ""
echo "   ========================================================================="
echo -e "                          ${CYAN}Docker${NORMAL}                   "
echo -e "     ${YELLOW}Assigning user and permissions to the project folder${NORMAL}       "
echo -e "     ${GREEN}${FOLDER_WORK}/core${NORMAL}       "
echo "   ========================================================================="

if [ -z "$uDocker" ]
then
    echo ""
    echo -e "${GREEN}-> Enter the username to manage docker: ${NORMAL}\c  "
    read uDocker
fi
chown -R $uDocker:$uDocker $FOLDER_WORK/core

echo ""
echo "   ======================================================================"
echo -e "   ======                      ${GREEN}Congratulations!!!\e[0m                  ======"
echo -e "   ======               ${YELLOW}All folders and configurations\e[0m             ======"
echo -e "   ======                       ${YELLOW}are already made!\e[0m                  ======"
echo -e "   ======                     \e[91mMTIE MIGUEL MARTINEZ\e[0m                 ======"
echo "   ======================================================================"

echo ""
echo -e "${YELLOW}-> You want to run docker compose ? [Y/n]:? ${NORMAL}\c  "
read compose

echo ""
while [ $compose != "Y" ] && [ $compose != "n" ]; do
    echo -e "${RED}-> ERROR: Not a valid option${NORMAL}" >&2;
    echo ""
    echo -e "${YELLOW}-> You want to run docker compose ? [Y/n]:? ${NORMAL}\c"
    read compose
done

if [ $compose == "n" ]; then
    echo -e "   ======================================================================"
    echo -e "      \e[32mThank you!!!\e[0m"
    echo -e "      ${CYAN}Now you can manually run the file${NORMAL}"
    echo -e "    "
    echo -e "          ${YELLOW}- docker-compose.yml${NORMAL}"
    echo -e "    "
    echo -e "      ${CYAN}located in the${NORMAL}"
    echo -e "    "
    echo -e "          ${YELLOW}- ${FOLDER_WORK}/core${NORMAL}"
    echo -e "    "
    echo -e "      ${CYAN}folder with the following command inside the core folder${NORMAL}"
    echo -e "    "
    echo -e "          ${YELLOW}> docker compose up -d${NORMAL}"
    echo -e "    "
    echo -e "      ${CYAN}if you want to run docker compose from this location run the following${NORMAL}"
    echo -e "    "
    echo -e "          ${YELLOW}> docker compose -f ${FOLDER_WORK}/core/docker-compose.yml up -d${NORMAL}"
    echo "   ======================================================================"
    exit 1
fi

echo ""
echo -e "${YELLOW}-> Enter the domain or subdomain name for Traefik [mydomain.com or subdomain.mydomain.com]:? ${NORMAL}\c  "
read domainTraefik
sed -i 's/DOMAIN_TRAEFIK/'${domainTraefik}'/g' $FOLDER_WORK/core/docker-compose.yml

echo ""
echo -e "${YELLOW}-> Enter the domain or subdomain name for Portainer [mydomain.com or subdomain.mydomain.com]:? ${NORMAL}\c  "
read domainPortainer
sed -i 's/DOMAIN_PORTAINER/'${domainPortainer}'/g' $FOLDER_WORK/core/docker-compose.yml

echo ""
echo -e "   ======================================================================"
echo -e "      ${GREEN}Running: docker compose -f ${FOLDER_WORK}/core/docker-compose.yml up -d\e[0m     "
docker compose -f ${FOLDER_WORK}/core/docker-compose.yml up -d


echo -e "   ======================================================================"
echo -e "      \e[32mCONGRATULATIONS!!!\e[0m"
echo -e "      ${CYAN}You have successfully installed the project\e[0m"
echo -e "    "

login $uDocker
docker compose ps
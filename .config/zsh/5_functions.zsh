function set_kguproxy() {
    kguproxy="http://proxy.ksc.kwansei.ac.jp:8080"
    
    export HTTP_PROXY=$kguproxy
    export HTTPS_PROXY=$kguproxy
    export FTP_PROXY=$kguproxy
    export ALL_PROXY=$kguproxy
    export http_proxy=$kguproxy
    export https_proxy=$kguproxy
    export ftp_proxy=$kguproxy
    export all_proxy=$kguproxy
    export no_proxy="127.0.0.1,localhost"
    export NO_PROXY="$no_proxy"


    # Git にもプロキシ設定
    git config --global http.proxy ${HTTP_PROXY}
    git config --global https.proxy ${HTTPS_PROXY}
    
    # curl
    echo "proxy = \"${kguproxy}\"" > ${HOME}/.curlrc
}

function unset_proxy(){
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset ALL_PROXY
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
    unset no_proxy
    unset NO_PROXY

    # Git
    git config --global --unset http.proxy
    git config --global --unset https.proxy

    # Curl
    echo "" > ${HOME}/.curlrc
}

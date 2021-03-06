# Install useful software

function helping(){
    # Show help
    # https://www.atareao.es/tutorial/scripts-en-bash/una-ayuda-para-tus-scripts/
    echo "NAME"
    echo "    install - install useful software"
    echo "SYNOPSIS"
    echo "    sudo ./install.sh [-h --help] [-a --all]"
    echo "                      [-g --git] [-t --testing]"
    echo "                      [-tr --trash]"
    echo "DESCRIPTION"
    echo "    This script installs the following software:"
    echo "    - Git"
    echo "OPTIONS"
    echo "    -a --all"
    echo "        Install all available software."
    echo "    -g --git"
    echo "        Install git."
    echo "    -h --help"
    echo "        Show help."
    echo "    -t --testing"
    echo "        Function for test purpose."
    echo "    -tr --trash"
    echo "        Install trash-cli."
    echo "        https://www.atareao.es/podcast/una-papelera-para-el-terminal/"
}

function install_all(){
    # Install all avilable software
    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    install_git
    install_trash
}

function install_git(){
    # Install Git
    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    echo
    echo "# Init git"
    apt install -y git-all
}

function install_trash(){
    # Install trash-cli
    # https://www.atareao.es/podcast/una-papelera-para-el-terminal/
    apt install -y trash-cli
}

function testing(){
    # Only for test purpose
    echo "# Init test"
}

# Main
# Check any argument provided.
if [ $# -eq 0 ]
then
    echo "[ERROR] Not arguments supplied"
    echo
    helping
    exit 1
fi
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -a|--all)
            install_all
            shift # delete past argument from the argument list
            shift # delete past value from the argument list
            ;;
        -g|--git)
            install_git
            shift
            shift
            ;;
        -h|--help)
            helping
            exit
            ;;
        -t|--testing)
            testing
            shift
            shift
            ;;
        -tr|--trash)
            install_trash
            shift
            shift
            ;;
        *)
            echo "ERROR: unknown option"
            echo
            helping
            exit 1
            ;;
    esac
done

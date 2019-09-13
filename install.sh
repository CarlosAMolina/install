# Install useful software

function help(){
    # Show help
    # https://www.atareao.es/tutorial/scripts-en-bash/una-ayuda-para-tus-scripts/
    echo "NAME"
    echo "    install - install useful software"
    echo "SYNOPSIS"
    echo "    sudo ./install.sh [-h --help] [-a --all]"
    echo "                            [-g --git] [-t --testing]"
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
}

function install_git(){
    # Install Git
    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    apt install -y git-all
}

function install_all(){
    # Install all avilable software
    # https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
    echo
    echo "# Init git"
    install_git
}

function testing(){
    # Only for test purpose
    echo "# Init test"
}

# Main
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
            help
            exit
            ;;
        -t|--testing)
            testing
            exit
            ;;
        *)
            echo "ERROR: unknown option"
            echo
            help
            exit 1
            ;;
    esac
done

if [ "$OPCION3" == "" ]
then
    help
    exit
fi

pkg_detect_manager() {

    if validator_command_exists apt; then
        echo "apt"
        return
    fi

    if validator_command_exists dnf; then
        echo "dnf"
        return
    fi

    if validator_command_exists pacman; then
        echo "pacman"
        return
    fi

    if validator_command_exists zypper; then
        echo "zypper"
        return
    fi

    return 1
}

pkg_update() {

case "$(pkg_detect_manager)" in

apt)

sudo apt update

;;

dnf)

sudo dnf check-update

;;

pacman)

sudo pacman -Sy

;;

esac

}

sudo apt install -y git curl unzip

sudo pacman -S git curl unzip

sudo dnf install git curl unzip
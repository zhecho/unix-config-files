#!/bin/bash
#
# MacOS reinstall script
#
# Check if a hostname argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 new_hostname"
    exit 1
fi

# Assign the first argument to a variable
NEW_HOSTNAME="$1"

# Change HostName, LocalHostName, and ComputerName
echo "Changing HostName, LocalHostName, and ComputerName to '$NEW_HOSTNAME'..."

sudo scutil --set HostName "$NEW_HOSTNAME"
sudo scutil --set LocalHostName "$NEW_HOSTNAME"
sudo scutil --set ComputerName "$NEW_HOSTNAME"

echo "Hostname change complete."
echo "Installing software..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew install clipy && \
brew install wget && \
brew install keepassxc && \
brew install btop k9s kubectl wireshark tmux nvim tcpdump terraform && \
brew install --cask firefox && \
brew install --cask wireshark wireshark-chmodbpf && \
brew install --cask docker && \
brew install telegram && \
brew install skaffold helm kubecm tree minikube mtr powerlevel10k && \
brew install vlc sipcalc && \
brew tap hashicorp/tap && \
brew install hashicorp/tap/hashicorp-vagrant && \
brew install quemu && \
brew install --cask virtualbox

# Installing Fonts https://github.com/romkatv/powerlevel10k/blob/master/font.md
font_urls=(
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)
font_dir="$HOME/Downloads"
echo "Downloading Powerlevel10k fonts..."
for url in "${font_urls[@]}"; do
  file_name=$(basename "${url}")
  echo "Downloading ${file_name}..."
  wget -L -P "${font_dir}" "${url}"
  sleep 1
done

mv "${font_dir}/MesloLGS*" "$HOME/Library/Fonts/."


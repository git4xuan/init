##install golang-tools
wget https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh

bash goinstall.sh --64

## install for zshrc zsh needed to install
touch "$HOME/.zshrc"
{
    echo '# GoLang'
    echo 'export GOROOT=$HOME/.go'
    echo 'export PATH=$PATH:$GOROOT/bin'
    echo 'export GOPATH=$HOME/go'
    echo 'export PATH=$PATH:$GOPATH/bin'
} >> "$HOME/.zshrc"

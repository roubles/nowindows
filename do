#!/usr/bin/env bash
#
# maclock CLI Installer
#
# MIT LICENSE - Copyright (c) May 2015 Rouble Matta
#
# Permission is hereby  granted, free of charge, to  any person obtaining a copy
# of this software and associated documentation files (the "Software"), to  deal
# in  the Software without restriction, including  without limitation the rights
# to use,  copy,  modify,  merge,  publish, distribute, sublicense,  and/or sell
# copies  of  the  Software, and  to permit  persons  to  whom  the  Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS  PROVIDED  "AS IS",  WITHOUT WARRANTY  OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT  NOT  LIMITED  TO  THE  WARRANTIES  OF MERCHANTABILITY,
# FITNESS FOR  A  PARTICULAR PURPOSE  AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS  OR  COPYRIGHT  HOLDERS  BE LIABLE FOR  ANY  CLAIM,  DAMAGES  OR OTHER
# LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE  OR OTHER DEALINGS IN THE
# SOFTWARE.

APP_NAME='nowindows'
URL="https://raw.githubusercontent.com/roubles/$APP_NAME/master/scripts/loginfix.sh"
INSTALL_PATH="/usr/local/bin/loginfix.sh"

function create_usrlocalbin() {
    if [ ! -d /usr/local/bin/ ]; then
        echo "Creating /usr/local/bin ..."
        mkdir -p /usr/local/bin/ 
    fi
}

function download_script() {
    echo "Downloading script from: $URL..."
    curl -sSL $URL > $INSTALL_PATH
    if [ ! -f $INSTALL_PATH ]; then
        echo "Error installing script."
        exit 4
    fi
}

function chmod_script() {
  chmod a+x $INSTALL_PATH
}

create_usrlocalbin
download_script
chmod_script
defaults write com.apple.loginwindow LoginHook $INSTALL_PATH
output="$(defaults read com.apple.loginwindow LoginHook 2>&1)"
if [ "$output" = "/usr/local/bin/loginfix.sh" ]; then
    echo 'Installation successful'
    exit 0
else
    echo "Installation unsuccessful. Output of default read com.apple.loginwindow LoginHook: $output"
    exit 2
fi

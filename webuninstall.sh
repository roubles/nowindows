#!/usr/bin/env bash
#
# maclock CLI UNInstaller
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

INSTALL_PATH="/usr/local/bin/loginfix.sh"

rm -rf $INSTALL_PATH
defaults delete com.apple.loginwindow LoginHook
echo 'Un-Installation complete!'
output=`defaults read com.apple.loginwindow LoginHook`
if [ "$output" = *"does not exist"* ]; then
    echo 'Uninstallation successful'
else
    echo 'Uninstallation unsuccessful'
fi
exit 0

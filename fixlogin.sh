#!/bin/bash
echo "#!/bin/bash" > /tmp/loginfix.sh
echo "rm /Users/*/Library/Preferences/ByHost/com.apple.loginwindow.*" >> /tmp/loginfix.sh
mv /tmp/loginfix.sh /usr/bin/loginfix.sh
chmod +x /usr/bin/loginfix.sh
defaults write com.apple.loginwindow LoginHook /usr/bin/loginfix.sh
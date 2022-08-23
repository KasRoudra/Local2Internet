# Local2Internet

# Author       : KasRoudra
# Github       : https://github.com/KasRoudra
# Messenger    : https://m.me/KasRoudra
# Email        : kasroudrakrd@gmail.com
# Date         : 26-09-2021
# Main Language: Ruby
# Description  : Host a website at localhost and make it publicly available all over the internet

black="\033[0;30m"
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"  
blue="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
white="\033[0;37m"

logo="""
#{red}
▒█░░░ █▀▀█ █▀▀ █▀▀█ █░░ █▀█ ▀█▀ █▀▀▄ ▀▀█▀▀ █▀▀ █▀▀█ █▀▀▄ █▀▀ ▀▀█▀▀ 
#{yellow}▒█░░░ █░░█ █░░ █▄▄█ █░░ ░▄▀ ▒█░ █░░█ ░░█░░ █▀▀ █▄▄▀ █░░█ █▀▀ ░░█░░ 
#{green}▒█▄▄█ ▀▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀ █▄▄ ▄█▄ ▀░░▀ ░░▀░░ ▀▀▀ ▀░▀▀ ▀░░▀ ▀▀▀ ░░▀░░
#{blue}                                                    [By KasRoudra]
"""

ask = green + '[' + white + '?' + green + '] '+ yellow
success = green + '[' + white + '√' + green + '] '
error = red + '[' + white + '!' + red + '] '
info= yellow + '[' + white + '+' + yellow + '] '+ cyan
pw= yellow + '[' + white + '+' +yellow + ']'+' Please Wait!'
puts pw
root=`cd $HOME && pwd`.strip
checkphp=`pidof php`
checkngrok=`pidof ngrok`
checkcf=`pidof cloudflared`
checkwt=`pidof wget`
checkcurl=`pidof curl`
checkuz=`pidof unzip`
checknode=`pidof http-server`
checkpy=`pidof python`
checkloclx=`pidof loclx`
inpy=`dpkg -l | grep -o python`
inphp=`dpkg -l | grep -o php`
inwget=`dpkg -l | grep -o wget`
inuz=`dpkg -l | grep -o unzip`
incurl=`dpkg -l | grep -o curl`
innode=`dpkg -l | grep -o node`
arc=`uname -m`
system("stty -echoctl")
if not inpy.include?"python"
    puts "\n#{info}Installing Python......."
    system("apt install python -y")
end
if not inphp.include?"php"
    puts "\n#{info}Installing PHP......."
    system("apt install php -y")
end
if not inwget.include?"wget"
    puts "\n#{info}Installing Wget......."
    system("apt install wget -y")
end
if not inuz.include?"unzip"
    puts "\n#{info}Installing Unzip......."
    system("apt install unzip -y")
end
if not incurl.include?"curl"
    puts "\n#{info}Installing Curl......."
    system("apt install curl -y")
end
if not innode.include?"node"
    puts "\n#{info}Installing Nodejs......."
    system("apt install nodejs -y")
end
if checkphp!=""
    system("killall php")
end
if checkngrok!=""
    system("killall ngrok")
end
if checkcf!=""
    system("killall cloudflared")
end
if checkwt!=""
    system("killall wget")
end
if checkcurl!=""
    system("killall curl")
end
if checkuz!=""
    system("killall unzip")
end
if checkpy!=""
    system("killall python3")
end
if checknode!=""
    system("killall http-server")
end
if checkloclx!=""
    system("killall loclx")
end
inpy2=`dpkg -l | grep -o python`
inphp2=`dpkg -l | grep -o php`
inwget2=`dpkg -l | grep -o wget`
inuz2=`dpkg -l | grep -o unzip`
incurl2=`dpkg -l | grep -o curl`
innode2=`dpkg -l | grep -o node`
if not inpy2.include?"python"
    puts "\n#{error}Error! Python can't be installed!"
    exit
end
if not inphp2.include?"php"
    puts "\n#{error}Error! PHP can't be installed!"
    exit
end
if not inwget2.include?"wget"
    puts "\n#{error}Error! Wget can't be installed!"
    exit
end
if not inuz2.include?"unzip"
    puts "\n#{error}Error! Unzip can't be installed!"
    exit
end
if not incurl2.include?"curl"
    puts "\n#{error}Error! Curl can't be installed!"
    exit
end
if not innode2.include?"node"
    puts "\n#{error}Error! NodeJS can't be installed!"
    exit
end
begin
nodecheck=`npm list -g --depth=0 | grep -o http-server`
if not nodecheck.include?"http-server"
    puts "\n#{info}Installing Http-server......."
    system("npm install -g http-server")
end
rescue
    puts "\n#{info}Installing Http-server......."
    system("apt install nodejs -y && npm install -g http-server")
end
if Dir.exist?"/data/data/com.termux/files/home"
    termux=true
    begin
    inp=`proot -V`
    if not inp.include?"Visit"
        puts "\n#{info}Installing proot......."
       system("pkg install proot -y")
    end
    rescue
        puts "\n#{info}Installing proot......."
        system("pkg install proot -y")
    end
else
    termux=false
end
if not File.file?(root+"/.ngrokfolder/ngrok")
while true
    system("rm -rf ngrok.zip")
    puts "\n#{info}Downloading Ngrok......."
    if arc.include?"arm"
        system("wget -q --show-progress https://github.com/KasRoudra/files/raw/main/ngrok/ngrok-stable-linux-arm.zip -O ngrok.zip")
        system("unzip ngrok.zip && rm -rf ngrok.zip")
        break
    elsif arc.include?"aarch64"
        system("wget -q --show-progress https://github.com/KasRoudra/files/raw/main/ngrok/ngrok-stable-linux-arm64.tgz -O ngrok.tgz")
        system("tar -zxf ngrok.tgz && rm -rf ngrok.tgz")
        break
    elsif arc.include?"x86_64"
        system("wget -q --show-progress https://github.com/KasRoudra/files/raw/main/ngrok/ngrok-stable-linux-amd64.zip -O ngrok.zip")
        system("unzip ngrok.zip && rm -rf ngrok.zip")
        break
    else
        system("wget -q --show-progress https://github.com/KasRoudra/files/raw/main/ngrok/ngrok-stable-linux-386.zip -O ngrok.zip")
        system("unzip ngrok.zip && rm -rf ngrok.zip")
        break
    end
end
system("mkdir $HOME/.ngrokfolder && mv -f ngrok $HOME/.ngrokfolder && chmod +x $HOME/.ngrokfolder/ngrok ")
end
if not File.file?(root+"/.cffolder/cloudflared")
    system("rm -rf cloudflared")
while true
    puts "\n#{info}Downloading Cloudflared......."
    if arc.include?"arm"
        system("wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O cloudflared")
        break
    elsif arc.include?"aarch64"
        system("wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O cloudflared")
        break
    elsif arc.include?"x86_64"
        system("wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared")
        break
    else
        system("wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386 -O cloudflared")
        break
    end
end
system("mkdir $HOME/.cffolder && mv -f cloudflared $HOME/.cffolder && chmod +x $HOME/.cffolder/cloudflared")
end
if not File.file?(root+"/.loclxfolder/loclx")
while true
    system("rm -rf loclx.zip")
    puts "\n#{info}Downloading Loclx......."
    if arc.include?"arm"
        system("wget -q --show-progress https://lxpdownloads.sgp1.digitaloceanspaces.com/cli/loclx-linux-arm.zip -O loclx.zip")
        break
    elsif arc.include?"aarch64"
        system("wget -q --show-progress https://lxpdownloads.sgp1.digitaloceanspaces.com/cli/loclx-linux-arm64.zip -O loclx.zip")
        break
    elsif arc.include?"x86_64"
        system("wget -q --show-progress https://lxpdownloads.sgp1.digitaloceanspaces.com/cli/loclx-linux-amd64.zip -O loclx.zip")
        break
    else
        system("wget -q --show-progress https://lxpdownloads.sgp1.digitaloceanspaces.com/cli/loclx-linux-386.zip -O loclx.zip")
        break
    end
end
system("unzip loclx.zip && rm -rf loclx.zip")
system("mkdir $HOME/.loclxfolder && mv -f loclx $HOME/.loclxfolder && chmod +x $HOME/.loclxfolder/loclx ")
end
while true
system("clear")
puts logo+"\n\n"
print ask+"Choose one of the following:\n\n1.Start\n2.About\n0.Exit\n"+yellow+"---> "+ green
type=gets.chomp
case type
when "1"
while true
print "\n"+ask+"Enter the Directory:\n\n"+yellow+"---> "+ green
path=gets.chomp
if not Dir.exist?(path)
    puts "\n#{error}Error! Path do not exist!"
    system("sleep 2")
else
    break
end
end
while true
print "\n#{ask}Enter the a hosting protocol:\n\n1.Python\n2.PHP\n3.NodeJS\n(Default: #{green}Python#{yellow})---> #{green}"
host=gets.chomp
if host=="1" or host=="2" or host=="3" or host==""
if host==""
    host="1"
end
break
else
    puts "\n#{error}Please choose right protocol 1, 2 or 3!"
    system("sleep 2")
end
end
while true
print "\n#{ask}Enter port:\n(Default: #{green}8888#{yellow})---> #{green}"
port=gets.chomp
cp=port.to_i
if port==""
    port="8888"
    break
else
    if cp==0
        puts "\n#{error}Port must be a number!"
        system("sleep 2")
    else
        break
    end
end
end
if termux
    puts "\n\n#{info}Please enable hotspot......."
    system("sleep 3")
end
puts "\n#{info}Starting local server......."
system("rm -rf $HOME/.cffolder/.log.txt")
system("rm -rf $HOME/.loclxfolder/.log.txt")
case host
when "1"
    system("cd #{path} && python3 -m http.server #{port} > /dev/null 2>&1 &")
when "2"
    if File.file?(path+"/index.php")
    system("cd #{path} && php -S 127.0.0.1:#{port} > /dev/null 2>&1 &")
    else
        puts "\n#{error}Index.php not found!"
    end
when "3"
    system("cd #{path} && http-server -p #{port} > /dev/null 2>&1 &")
else
    puts "\n#{error}Wrong input!"
end
system("sleep 2")
status=`curl -s --head -w %{http_code} 127.0.0.1:#{port} -o /dev/null`
if status.include?"000"
    puts "\n#{error}Local server error!"
    exit
else
    puts "\n#{success}Local server started succesfully!\n"
    system("sleep 2")
end
puts "\n#{info}Starting tunnelers......."
if termux
    system("cd $HOME/.ngrokfolder && termux-chroot ./ngrok http #{port} > /dev/null 2>&1 &")
    system("cd $HOME/.cffolder && termux-chroot ./cloudflared tunnel -url 127.0.0.1:#{port} --logfile .log.txt > /dev/null 2>&1 &")
    system("cd $HOME/.loclxfolder && termux-chroot ./loclx tunnel http --to :#{port} > .log.txt 2> /dev/null &")
else
    system("cd $HOME/.ngrokfolder && ./ngrok http #{port} > /dev/null 2>&1 &")
    system("cd $HOME/.cffolder && ./cloudflared tunnel -url 127.0.0.1:#{port} --logfile .log.txt > /dev/null 2>&1 &")
    system("cd $HOME/.loclxfolder && ./loclx tunnel http --to :#{port} > .log.txt 2> /dev/null &")
end
system("sleep 8")
ngroklink=`curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io"`
if ngroklink.include?"ngrok"
ngrokcheck=true
else
ngrokcheck=false
end
cflink=`grep -o 'https://[-0-9a-z]*\.trycloudflare.com' "$HOME/.cffolder/.log.txt"`
if cflink.include?"cloudflare"
cfcheck=true
else
cfcheck=false
end
loclxlink=`grep -o 'https://[-0-9a-z]*\.loclx.io' "$HOME/.loclxfolder/.log.txt"`
if loclxlink.include?"loclx"
loclxcheck=true
else
loclxcheck=false
end
while true
if cfcheck and ngrokcheck and loclxcheck
    puts "\n#{success}Cloudflared and Ngrok and Loclx started succesfully!\n"
    puts "\n#{info}Cloudflare URL > #{yellow} #{cflink}"
    puts "\n#{info}Ngrok URL > #{yellow} #{ngroklink}"
    puts "\n#{info}Loclx URL > #{yellow} #{loclxlink}"
    break
end
if cfcheck and not ngrokcheck and not loclxcheck
    puts "\n#{success}Cloudflared started succesfully!\n"
    puts "\n#{info}Cloudflare URL > #{yellow} #{cflink}"
    break
end
if not cfcheck and ngrokcheck and not loclxcheck
    puts "\n#{success}Ngrok started succesfully!\n"
    puts "\n#{info}Ngrok URL > #{yellow} #{ngroklink}"
    break
end
if loclxcheck and not cfcheck and not ngrokcheck
    puts "\n#{success}Loclx started succesfully!\n"
    puts "\n#{info}Loclx URL > #{yellow} #{loclxlink}"
    break
end
if loclxcheck and cfcheck and not ngrokcheck
    puts "\n#{success}Loclx and Cloudflared started succesfully!\n"
    puts "\n#{info}Loclx URL > #{yellow} #{loclxlink}"
    puts "\n#{info}Cloudflare URL > #{yellow} #{cflink}"
    break
end
if not loclxcheck and cfcheck and ngrokcheck
    puts "\n#{success}Cloudflared and Ngrok started succesfully!\n"
    puts "\n#{info}Cloudflared URL > #{yellow} #{cflink}"
    puts "\n#{info}Ngrok URL > #{yellow} #{ngroklink}"
    break
end
if loclxcheck and not cfcheck and ngrokcheck
    puts "\n#{success}Loclx and Ngrok started succesfully!\n"
    puts "\n#{info}Loclx URL > #{yellow} #{loclxlink}"
    puts "\n#{info}Ngrok URL > #{yellow} #{ngroklink}"
    break
end
if not (cfcheck and ngrokcheck and loclxcheck )
    puts "\n#{error}Tunneling failed!\n"
    exit
end
end
puts "\n#{info}Press #{red}CTRL+C#{cyan} to exit!"
begin
system("sleep 86400")
rescue SystemExit, Interrupt
    puts "\n#{success}Thanks for using!\n"
    exit
rescue Exception => e
    puts e
end
when "2"
system("clear")
puts logo
puts "\n\n#{red}[ToolName]  #{cyan}  :[Local2Internet]
#{red}[Version]    #{cyan} :[1.0]
#{red}[Description]#{cyan} :[LocalHost Exposing tool]
#{red}[Author]     #{cyan} :[KasRoudra]
#{red}[Github]     #{cyan} :[https://github.com/KasRoudra] 
#{red}[Messenger]  #{cyan} :[https://m.me/KasRoudra]
#{red}[Email]      #{cyan} :[kasroudrakrd@gmail.com]"
print "\n#{ask}#{yellow}---> #{green}"
about=gets.chomp
when "0"
    exit
else
    puts "\n#{error}Wrong input. Please choose 1 or 2"
    system("sleep 2")
end
end

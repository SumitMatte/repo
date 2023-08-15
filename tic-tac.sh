sudo apt update
sudo apt install nodejs npm -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn -y
cd /mnt
sudo git clone https://github.com/SumitMatte/tic-tac-react.git
cd tic-tac-react
yarn install
yarn start

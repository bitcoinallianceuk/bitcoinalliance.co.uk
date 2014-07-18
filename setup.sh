
echo ">> Stopping previous bitcoinalliance server..."

forever stop bitcoinalliance

echo "---------------------------------"
echo ">> Fetching git repo..."

git pull

echo "---------------------------------"
echo ">> Createing log directory..."
mkdir -p ./logs

echo "---------------------------------"
echo ">> Installing node modules..."
npm install --production

echo "---------------------------------"
echo ">> Remove previous nginx config..."

rm /etc/nginx/sites-enabled/bitcoinalliance.co.uk
rm /etc/nginx/sites-available/bitcoinalliance.co.uk

echo "---------------------------------"
echo ">> Creating nginx configs and enabling..."

cp ./config/nginx.conf /etc/nginx/sites-available/bitcoinalliance.co.uk
ln -s /etc/nginx/sites-available/bitcoinalliance.co.uk /etc/nginx/sites-enabled/bitcoinalliance.co.uk

echo "---------------------------------"
echo ">> Reloading nginx..."

service nginx reload

echo "---------------------------------"
echo ">> Starting ghost server..."

forever start --pidFile ./.pid --uid "bitcoinalliance" -a -p . -l ./logs/bitcoinalliance.log -e ./logs/bitcoinalliance.err.log -o ./logs/bitcoinalliance.out.log -c "npm start --production" ./

echo "---------------------------------"
echo ">> Done."

echo "---------------------------------"
echo ">> Tailing log... (ctrl+C to exit)."
tail -f -n 0 ./logs/bitcoinalliance.log

echo "---------------------------------"

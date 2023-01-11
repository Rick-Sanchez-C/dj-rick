#check if file dj-rick/Dockerfile exists
if [ -f dj-rick/Dockerfile ]; then
    echo "File dj-rick/Dockerfile does not exist."
else
    git clone https://github.com/Rick-Sanchez-C/dj-rick.git
    sleep 10
fi
echo  'Delete old container'
docker stop dj-rick || true && docker rm dj-rick || true
cat app.json
git  -C dj-rick/ pull
echo 'Building dj-rick'
docker build -t dj-rick dj-rick/
sleep 10
echo 'Deploying'
docker run --name dj-rick -e TOKEN=2312312312asdas -d dj-rick -d

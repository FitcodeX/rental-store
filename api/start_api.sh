docker build -t rental_api ./api
docker run --rm -p 8000:8000 -d rental_api
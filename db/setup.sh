docker build -t rental_db ./db
docker run --name pg_db --rm -e POSTGRES_PASSWORD=password -d rental_db
docker build -t people_frontend ./frontend
docker run --rm -p 80:80 -d people_frontend
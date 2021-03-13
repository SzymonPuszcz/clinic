# Clinic

The simple backend for CRUD operations on doctor, patient and appointment. It supports multitanency with separate databases.  

### Run
1. Build clinic backend with `./gradlew build`
2. Run `docker-compose up -d --build`. It runs clinic backend and 2 postgres databases with init data.


### API
You can import API Postman collection from `Clinic.postman_collection.json` file. Base url and tenant id is set in collection environment variables. Available tenant ids: `client1`,`client2`.

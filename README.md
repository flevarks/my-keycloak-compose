# my-keycloak-compose
My Keycloak compose to deploy Keycloak for development reasons

# Disable HTTPS

Connect to the docker container
```bash
 docker exec -it keycloak bash 
```
Sign in through the terminal

```bash
cd bin
./kcadm.sh config credentials --server http://localhost:8080 --realm master --user admin --password admin
./kcadm.sh update realms/master -s sslRequired=NONE
```

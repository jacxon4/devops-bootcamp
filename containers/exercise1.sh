
#Exercise1 shell commands
# Assuming proper docker login already performed

#To remove existing networks use next line 
#docker network prune -f

#Create shared network
docker network create lemoncode-challenge

docker run -itd --name db --network lemoncode-challenge mongo
#docker ps

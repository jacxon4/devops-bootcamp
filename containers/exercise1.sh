
#Exercise1 shell commands
# Assuming proper docker login already performed

#To remove existing networks use next line 
docker network prune -f

#Create shared network
docker network create lemoncode-challenge

# Recreate container
docker rm mongodb -f
docker run -itd --name mongodb --network lemoncode-challenge mongo


#Create backend image
cd backend
docker build . -t dotnet-backend

# Recreate container
docker rm dotnet-backend -f
docker run -itd --name dotnet-backend -p 5000:5000 --network lemoncode-challenge dotnet-backend

#Ensure container into newtork
docker network inspect lemoncode-challenge | grep dotnet-backend
cd ..

#Create frontend image
cd frontend
docker build . -t react-frontend

# Recreate container
docker rm react-frontend -f
docker run -itd --name react-frontend -p 3000:3000 --network lemoncode-challenge react-frontend
cd ..


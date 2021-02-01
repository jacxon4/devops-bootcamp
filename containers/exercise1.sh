
#Exercise1 shell commands
# Assuming proper docker login already performed

#To remove existing networks use next line 
docker network prune -f

#Create shared network
echo "####### Create network #######"
docker network create lemoncode-challenge

# Recreate container
echo "####### Run mongo DB #######"
docker rm mongodb -f
docker run -itd --name mongodb --network lemoncode-challenge --mount source=mongo-volmongo,target=/data/db -p 27017:27017 mongo


#Create backend image
echo "####### Create backend #######"
cd backend
docker build . -t dotnet-backend
cd ..

# Recreate container
docker rm dotnet-backend -f
docker run -itd --name dotnet-backend -p 5000:80 --network lemoncode-challenge dotnet-backend

#Ensure container into newtork
docker network inspect lemoncode-challenge | grep dotnet-backend

#Create frontend image
echo "####### Create fronted #######"
cd frontend
docker build . -t react-frontend

# Recreate container
docker rm react-frontend -f
docker run -itd --name react-frontend -p 3000:3000 --network lemoncode-challenge react-frontend
cd ..

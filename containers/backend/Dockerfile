FROM mcr.microsoft.com/dotnet/core/sdk:3.1
EXPOSE 5000
ENV MONGO_URI=mongodb://localhost:27017
COPY /backend /app
WORKDIR /app
RUN dotnet publish -c Release -o /build

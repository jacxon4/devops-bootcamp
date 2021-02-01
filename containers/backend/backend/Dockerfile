FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS base
WORKDIR /app

FROM base AS builder
COPY ["*.csproj","*.csproj.user","./"]
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM base AS runtime
COPY --from=builder /app/out .
EXPOSE 80
ENV MONGO_URI=mongodb:27017
ENTRYPOINT ["dotnet", "backend.dll"]

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /

RUN curl -sL https://deb.nodesource.com/setup_16.x |  bash -
RUN apt-get install -y nodejs

WORKDIR /src/react

RUN dotnet restore "react.csproj"

RUN dotnet build "react.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "react.csproj" -c Release -o /app/publish

FROM base AS final

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "react.dll"]


# # https://hub.docker.com/_/microsoft-dotnet
# FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
# WORKDIR /build

# RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
# RUN apt-get install -y nodejs

# # copy csproj and restore as distinct layers
# COPY ./*.csproj .
# RUN dotnet restore

# # copy everything else and build app
# COPY . .
# WORKDIR /build
# RUN dotnet publish -c release -o published --no-cache

# # final stage/image
# FROM mcr.microsoft.com/dotnet/aspnet:5.0
# WORKDIR /app
# COPY --from=build /build/published ./
# ENTRYPOINT ["dotnet", "react-dotnet-example.dll"]

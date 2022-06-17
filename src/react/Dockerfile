FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /build
EXPOSE 80

RUN curl -sL https://deb.nodesource.com/setup_16.x |  bash -
RUN apt-get install -y nodejs

COPY ./*.csproj .
RUN dotnet restore "react.csproj"

COPY . .
WORKDIR /build
RUN dotnet publish "react.csproj" -c release -o published --no-cache

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /build/published .
ENTRYPOINT ["dotnet", "react.dll"]

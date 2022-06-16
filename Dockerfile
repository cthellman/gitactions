FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src/react
COPY src/react/. .

WORKDIR /src/react

RUN dotnet restore "react.csproj"

RUN dotnet build "react.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "react.csproj" -c Release -o /app/publish

FROM base AS final

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "react.dll"]
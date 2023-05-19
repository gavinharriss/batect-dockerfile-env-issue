FROM mcr.microsoft.com/dotnet/framework/sdk:4.8.1 AS build
ARG secret_key
ENV SECRET_KEY=$secret_key

WORKDIR /app

COPY config/. ./
COPY scripts/apply-configuration.ps1 ./scripts/

RUN powershell.exe c:\\app\\scripts\\apply-configuration.ps1 c:\\app\\appsettings.config

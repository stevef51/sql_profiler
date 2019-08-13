FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS publish

WORKDIR /src
COPY sql_profiler.sln .
COPY sql_profiler/ sql_profiler

RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS prod

WORKDIR /app
COPY --from=publish /app .

ENTRYPOINT ["dotnet", "sql_profiler.dll", "--server", "mssql", "--username", "sa", "--password", "Andromeda25"]
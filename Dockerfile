FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS sprites

VOLUME ["/carts", "/src"]

RUN dotnet tool install --global dotnet-script

ENV PATH "$PATH:/root/.dotnet/tools"

COPY ./docker-entrypoint-netcore.sh ./GenerateSpritesheetData.csx /

ENTRYPOINT ["/docker-entrypoint-netcore.sh"]

FROM python AS cart

VOLUME ["/carts", "/src"]

RUN git clone https://github.com/dansanderson/picotool.git

COPY ./docker-entrypoint-p8tool.sh /

ENTRYPOINT ["/docker-entrypoint-p8tool.sh"]
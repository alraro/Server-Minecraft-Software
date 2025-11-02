FROM itzg/minecraft-server:java21

COPY ./server_pack/mods /mods
COPY ./server_pack/server_side_mods /mods
COPY ./server_pack/config /config

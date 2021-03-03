#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configures NGINX proxy
# ==============================================================================
declare admin_port
declare certfile
declare dns_host
declare ingress_interface
declare ingress_port
declare keyfile

ingress_port=$(bashio::addon.ingress_port)
ingress_interface=$(bashio::addon.ip_address)
ingress_entry=$(bashio::addon.ingress_entry)
sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx/servers/ingress.conf
sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf

dns_host=$(bashio::dns.host)
sed -i "s/%%dns_host%%/${dns_host}/g" /etc/nginx/includes/resolver.conf

config_port=$(bashio::config 'port')
config_host=$(bashio::config 'host')
escaped_config_host=$(printf '%s\n' "$config_host" | sed -e 's/[\/&]/\\&/g')
sed -i "s/%%config_port%%/${config_port}/g" /etc/nginx/includes/upstream.conf
sed -i "s/%%config_host%%/${escaped_config_host}/g" /etc/nginx/includes/upstream.conf
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/ingress.conf
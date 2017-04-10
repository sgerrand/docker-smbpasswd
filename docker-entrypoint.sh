#!/bin/sh
set -e
test ! -z "$DEBUG" && set -x

dc_ip_address() {
    _domain="$1"
    dig A +short $(dig -t SRV _ldap._tcp.dc._msdcs."$_domain" +short | cut -d' ' -f4) | \
        head -n 1
}

main() {
    _username="$1"
    [ -z "$_username" ] && echo "Username is required" && exit 100

    _domain="$2"
    [ -z "$_domain" ] && echo "Domain is required" && exit 100

    _ip_address=$(dc_ip_address "$_domain")
    /usr/bin/smbpasswd -U "$_username" -r "$_ip_address"
}

main "$@"

#Deploy openvpn to netns
## Description 
### ENG
Deploy openvpn on server and client with route all traffic through 
vpn tunnel in ip name space (netns).
### RUS
Для тех кому надоело что судьи во всяких Урюпинсках решают что открывать,
а что не открывать всей стране.

## Using
execute ./deploy-openvpn.sh

## Requirements
 1. Server, Ubuntu 16.04, scaleway.com or digitalocean.com are recommended
 2. Ansible (tested on 2.1.1.0), openvpn, iputils installed locally
 3. Public keys on github.com
 4. Local host with systemd (tested on Gentoo)
 5. Record in /etc/hosts for remote server with name openvpn-server

## Variables 
in var.yaml 
 * openvpn_port: OpenVPN port (default  - 34447)
 * easy_rsa_path: ease-rsa path (default - /tmp/ansible-easy-rsa)
 * vpn_network: OpenVPN network (default - 10.255.254.0)
 * netns_network: Network betwwen name spaces (default - 192.168.10)
 * netns_name: IP name space (default - vpn)

## Local deployment
 * download easy-rsa
 * generate keys for openvpn
 * configure local openvpn
 * create systemd local service file for start vpn in netns
 * create script for start and stop netns with openvpn include firewall rules
 * create sudo configuration for start netns without password
 * create .desktop file for firefox for stratinf in netns with vpn

## Remote server deployment from zero
Tested on Ubuntu 16.04 on www.scaleway.com
 * Install git, openvpn, tmux, zsh, iptables-persistent
 * Create user as local
 * Upload ssh keys to new user and root from https://github.com/[account].keys
 * Disallow root SSH password access
 * download oh-my-zsh
 * upload ~/.zshrc
 * generate openvpn configuration
 * add NAT rules

## Using after deployment
### Start
```
systemctl start netns-vpn
```
### Check
```
alias nsvpn="sudo /bin/ip netns exec vpn sudo -u $USER"
nsvpn curl -w "\n"  http://ipecho.net/plain
```
###Run browser
Start 'Mozilla Firefox in VPN' or in terminal
```
nsvpn frefox
```
### TODO
Add server deploy through API for scaleway.com and digitalocean.com


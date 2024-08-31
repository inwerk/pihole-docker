# Stop the Pi-hole container and then remove it from Docker.
docker stop pihole && docker rm pihole

# Download the latest Docker image of Pi-hole.
docker pull pihole/pihole:latest

# Read path for persistent storage from command line arguments.
VOLUME_PATH=${1}

# Create persistent storage directories for the container volumes.
mkdir -p ${VOLUME_PATH}/pihole
mkdir -p ${VOLUME_PATH}/pihole/data
mkdir -p ${VOLUME_PATH}/pihole/dnsmasq

# Generate a password for the web interface.
WEBPASSWORD=$(openssl rand -base64 32 | tr -dc _A-Z-a-z-0-9)

# Get external IP-address within the local network.
LOCAL_IPV4=$(hostname -I | cut -f1 -d' ')

# Run the Docker container for Pi-hole.
docker run -d \
    --name pihole \
    --restart=unless-stopped \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    -p 53:53/tcp -p 53:53/udp \
    -p 8080:80 \
    -v "${VOLUME_PATH}/pihole/data:/etc/pihole" \
    -v "${VOLUME_PATH}/pihole/dnsmasq.d:/etc/dnsmasq.d" \
    -e TZ="Europe/Berlin" \
    -e WEBPASSWORD="${WEBPASSWORD}" \
    -e FTLCONF_LOCAL_IPV4="${LOCAL_IPV4}" \
    pihole/pihole:latest
    
echo "Password for http://${LOCAL_IPV4}:8080/admin"
echo "${WEBPASSWORD}"

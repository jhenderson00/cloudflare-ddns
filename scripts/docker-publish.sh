#!/bin/bash

# Create and use the buildx builder
docker buildx create --name mybuilder --driver docker-container --use
docker buildx inspect mybuilder --bootstrap

# Run the build command
docker buildx build --platform linux/ppc64le,linux/s390x,linux/386,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/amd64 --tag jhenderson00/cloudflare-ddns:latest --push ../

# Remove the builder after the build is complete
docker buildx rm mybuilder
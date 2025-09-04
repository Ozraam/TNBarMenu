# Deployment Guide

This guide explains how to deploy the application on any computer using pre-built Docker images.

## Prerequisites

- Docker and Docker Compose installed on the target machine
- Internet connection to pull images from GitHub Container Registry

## Quick Start

1. **Download the production compose file:**
   ```bash
   curl -O https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/main/docker-compose.prod.yml
   ```

2. **Update the image references:**
   Edit `docker-compose.prod.yml` and replace:
   - `YOUR_GITHUB_USERNAME` with your actual GitHub username
   - `YOUR_REPO_NAME` with your actual repository name

3. **Deploy the application:**
   ```bash
   docker compose -f docker-compose.prod.yml up -d
   ```

4. **Access the application:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

## Alternative: Using Environment Variables

You can also set the image names using environment variables:

1. **Create a `.env` file:**
   ```bash
   FRONTEND_IMAGE=ghcr.io/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME-frontend:latest
   BACKEND_IMAGE=ghcr.io/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME-backend:latest
   ```

2. **Use the environment variable compose file:**
   ```yaml
   # docker-compose.env.yml
   version: '3.8'
   services:
     frontend:
       image: ${FRONTEND_IMAGE}
       # ... rest of config
     backend:
       image: ${BACKEND_IMAGE}
       # ... rest of config
   ```

## Authentication

If your GitHub repository is private, you'll need to authenticate:

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
```

## Management Commands

- **Start services:** `docker compose -f docker-compose.prod.yml up -d`
- **Stop services:** `docker compose -f docker-compose.prod.yml down`
- **View logs:** `docker compose -f docker-compose.prod.yml logs -f`
- **Update images:** `docker compose -f docker-compose.prod.yml pull && docker compose -f docker-compose.prod.yml up -d`

## Data Persistence

The application uses Docker volumes to persist data:
- `backend-data`: Stores generated images and build artifacts
- `backend-config`: Stores configuration and data files

To backup data:
```bash
docker run --rm -v dex_backend-data:/data -v $(pwd):/backup alpine tar czf /backup/backend-data-backup.tar.gz -C /data .
```

## Troubleshooting

- **Check service health:** `docker compose -f docker-compose.prod.yml ps`
- **View service logs:** `docker compose -f docker-compose.prod.yml logs [service-name]`
- **Restart a service:** `docker compose -f docker-compose.prod.yml restart [service-name]`
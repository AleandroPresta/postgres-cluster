# PostgreSQL Cluster with pgAdmin

A Docker-based PostgreSQL cluster setup with pgAdmin for database management, using external networks for container communication.

## Prerequisites

-   Docker and Docker Compose installed
-   External network `cluster-network` created

## Setup

### 1. Create External Network

If it doesn't exist, create network `cluster-network` using:

```bash
docker network create --subnet=172.31.0.0/16 cluster-network
```

### 2. Environment Variables

Create a `.env` file in the root directory with the following variables:

```env
# PostgreSQL Configuration
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password

# pgAdmin Configuration
PGADMIN_LISTEN_PORT=5541
PGADMIN_DEFAULT_EMAIL=user@domain.com
PGADMIN_DEFAULT_PASSWORD=password
```

### 3. Start the Cluster

```bash
docker compose up --build -d
```

## Services

### PostgreSQL Database

-   **Container**: `postgres`
-   **IP Address**: `172.31.1.2`
-   **Port**: `5432` (mapped to `${POSTGRES_PORT}`)
-   **Custom Build**: Uses Alpine Linux with PostgreSQL
-   **Initialization**: Automatically creates `db` database with sample data

### pgAdmin

-   **Container**: `pgadmin`
-   **IP Address**: `172.31.1.3`
-   **Port**: `80` (mapped to `${PGADMIN_LISTEN_PORT}`)
-   **Web Interface**: Access at `http://localhost:5541`

## Connecting to PostgreSQL via pgAdmin

1. Open pgAdmin at `http://localhost:5541`
2. Login with credentials from `.env` file
3. Add new server with these settings:
    - **Host**: `postgres` (container name) or `172.31.1.2` (IP address)
    - **Port**: `5432`
    - **Username**: `postgres`
    - **Password**: Value from `POSTGRES_PASSWORD` in `.env`

## Network Configuration

The setup uses an external Docker network (`cluster-network`) with:

-   **Subnet**: `172.31.0.0/16`
-   **PostgreSQL IP**: `172.31.1.2`
-   **pgAdmin IP**: `172.31.1.3`

This allows for:

-   Fixed IP addressing
-   Inter-container communication
-   Network sharing with other Docker Compose projects

## Project Structure

```
postgres-cluster/
├── docker-compose.yml          # Main orchestration file
├── .env                        # Environment variables
├── README.md                   # This file
└── postgres/
    ├── Dockerfile.dev          # Custom PostgreSQL image
    ├── start.sh               # PostgreSQL startup script
    └── init.sql               # Database initialization script
```

## Useful Commands

```bash
# Start services
docker compose up -d

# Stop services
docker compose down

# View logs
docker logs postgres
docker logs pgadmin

# Rebuild and restart
docker compose down && docker compose up --build -d

# Connect directly to PostgreSQL
docker exec -it postgres psql -U postgres

# Check network details
docker network inspect cluster-network
```

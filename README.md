# Wisecow Kubernetes Deployment

This repository contains Docker, Kubernetes, and CI/CD setup for deploying the **Wisecow application**.

## Contents
- `Dockerfile`: Containerizes the Wisecow app
- `wisecow.sh`: Application script (fortune + cowsay)
- `k8s/`: Kubernetes manifests (namespace, deployment, service, ingress)
- `.github/workflows/ci-cd.yml`: GitHub Actions workflow for CI/CD
- `README.md`: Documentation

## Deployment Steps
1. Build Docker image (local):
   ```bash
   docker build -t wisecow:latest .
   ```

2. Push image to Docker Hub:
   - Configure GitHub Secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`
   - On push to `main`, CI/CD will build & push automatically.

3. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f k8s/namespace.yaml
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   kubectl apply -f k8s/ingress.yaml
   ```

4. TLS Secret:
   ```bash
   kubectl -n wisecow create secret tls wisecow-tls      --key wisecow.key --cert wisecow.crt
   ```

5. Access app at `https://wisecow.local`

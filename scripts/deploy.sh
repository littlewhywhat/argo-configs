#!/bin/bash
# Simple deploy script - replaces GitHub Actions pipeline

set -e

echo "🚀 Deploying Demo Coding Agent to K3s..."

# Health check
echo "📋 Checking cluster connectivity..."
kubectl cluster-info --request-timeout=10s

# Cleanup existing resources
echo "🧹 Cleaning up existing resources..."
kubectl delete eventsource -l app=demo-coding-agent -n argo --ignore-not-found=true
kubectl delete sensor -l app=demo-coding-agent -n argo --ignore-not-found=true  
kubectl delete workflowtemplate -l app=demo-coding-agent -n argo --ignore-not-found=true
sleep 3

# Deploy new resources
echo "📦 Deploying EventSources..."
kubectl apply -f event-sources/ --validate=true

echo "📡 Deploying Sensors..."  
kubectl apply -f sensors/ --validate=true

echo "⚙️ Deploying WorkflowTemplates..."
kubectl apply -f workflow-templates/ --validate=true

# Show results
echo "✅ Deployment Status:"
kubectl get eventsources -n argo
kubectl get sensors -n argo
kubectl get workflowtemplates -n argo

echo "🎉 Deployment completed!"
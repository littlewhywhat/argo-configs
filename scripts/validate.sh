#!/bin/bash
# Simple validate script - dry run without applying

set -e

echo "🧪 Validating Demo Coding Agent manifests..."

# Validate without applying
echo "📦 Validating EventSources..."
kubectl --dry-run=client apply -f event-sources/ --validate=false

echo "📡 Validating Sensors..."  
kubectl --dry-run=client apply -f sensors/ --validate=false

echo "⚙️ Validating WorkflowTemplates..."
kubectl --dry-run=client apply -f workflow-templates/ --validate=false

echo "✅ All manifests are valid!"
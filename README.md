# Argo Events GitOps Configuration

This repository contains Argo Events manifests for triggering workflows from GitLab comments that start with `tanurkod:` prefix. The setup includes an EventSource listening for GitLab webhooks, a Sensor filtering comments, and a WorkflowTemplate executing the `demo-tanurkod` container with proper environment variables.
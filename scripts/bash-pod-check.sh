#!/bin/bash
kubectl get pods -o custom-columns='NAME:.metadata.name,STATUS:.status.phase'
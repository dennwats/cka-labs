#!/usr/bin/env python3
import sys

config_name = sys.argv[1] if len(sys.argv) > 1 else "demo-config"
filename = f"{config_name}.yaml"

with open(filename, "w") as f:
    f.write(f"""apiVersion: v1
kind: ConfigMap
metadata:
  name: {config_name}
data:
  WELCOME_MSG: "Hello from generated config!"
""")

print(f"[+] Generated {filename}")


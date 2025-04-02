#!/usr/bin/env python3
name = input('Name: ')
data = input('Key=Value: ')
k, v = data.split('=')
print(f"""apiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: {name}\ndata:\n  {k}: {v}""")
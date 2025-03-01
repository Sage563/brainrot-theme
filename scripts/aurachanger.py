import os
import json

def auraadder(num):

    os.chdir("..")
    file_path = "aurameter.json"
    
    with open(file_path, 'r') as f:
        data = json.load(f)
    
    current = data.get("aura", 0)
    new_value = min(current + num, 100)
    data["aura"] = new_value
    
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=4)

def auradecresser(num):

    os.chdir("..")
    file_path = "aurameter.json"
    
    with open(file_path, 'r') as f:
        data = json.load(f)
    
    current = data.get("aura", 0)
    new_value = max(current - num, 0)
    data["aura"] = new_value
    
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=4)

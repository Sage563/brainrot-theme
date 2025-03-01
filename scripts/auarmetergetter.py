import json
import os    


def aura():
    os.chdir("..")
    file_path = "aurameter.json"
    
    with open(file_path).read() as f:
        data = json.load(f)
        current = data.get("aura")
        return current
        
    
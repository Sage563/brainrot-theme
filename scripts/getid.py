import os
import json
import base64


def miami():
    os.chdir("..")
    os.chdir("cchangle")

    file ="VU5JVEVE.json"
    with open(file).read() as f:
            data =json.load(f)

            value = data.get("VVBEQVRF")
            decodeed =base64.b64decode(value)
            
            return decodeed
            
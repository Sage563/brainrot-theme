import base64
import os
import json
import getid


def MAIN():
    VU5JVEVEUExBQ0U ="./usr/share/themes/Skibidi/cchangle/VU5JVEVE.json"

    try:
        
        with open(VU5JVEVEUExBQ0U).read() as f:
            data =json.load(f)

            value = data.get("VVBEQVRF")
            decodeed =base64.b64decode(value)
            
            if decodeed <= getid.miami():
                return True
            


    except FileNotFoundError:
        return False
    
if __name__ == "__main__":
    values = MAIN()
    if values ==False:
        print("False")
    if values ==True:
        print("True")



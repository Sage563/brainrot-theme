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
            decodeed =int(decodeed)
            
            if decodeed <= getid.miami(): # If 1.16 is better then deccodeed
                return False
            elif decodeed >= getid.miami():
                return True
            if decodeed ==getid.miami():
                return False
            


    except FileNotFoundError:
        return True
    
if __name__ == "__main__":
    values = MAIN()
    if values ==False:
        print("False")
    if values ==True:
        print("True")



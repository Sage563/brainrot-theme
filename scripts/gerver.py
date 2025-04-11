import base64

num = 1.7
encoded = base64.b64encode(str(num).encode()) 
print(encoded) 

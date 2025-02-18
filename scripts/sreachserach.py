from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# List of words to detect
watchlist = [
    "skibidi", "gyatt", "rizz", "ohio", "duke dennis", "livvy dunne", "baby gronk", "sussy", 
    "imposter", "pibby glitch", "sigma", "alpha", "omega male grindset", "andrew tate", "goon cave", 
    "freddy fazbear", "colleen ballinger", "smurf cat", "strawberry elephant", "blud dawg", "shmlawg", 
    "ishowspeed", "turbulence", "ambatukam", "carti", "hitting the griddy", "ocky way", "kai cenat", 
    "fanum tax", "garten of banban", "no edging", "mosquito", "bussing", "axel in harlem", "whopper", 
    "1 2 buckle my shoe", "goofy ahh", "aiden ross", "sin city", "quirked up white boy", "busting it down", 
    "goated with the sauce", "john pork", "grimace shake", "kiki do you love me", 
    "huggy wuggy", "nathaniel b", "lightskin stare", "biggest bird", "omar the referee", "amogus", 
    "uncanny", "reddit chungus", "keanu reeves", "pizza tower" "poggers", "kumalala", "savesta", 
    "quandale dingle", "glizzy", "rose toy", "ankha zone", "thug shaker", "morbin time", "dj khaled", 
    "sisyphus", "oceangate", "shadow wizard money gang", "ayo the pizza here", "PLUH", "nair butthole waxing", 
    "t-pose", "ugandan knuckles", "family guy funny moments", "subway surfers gameplay", "nickeh30", 
    "ratio", "uwu", "delulu", "opium bird", "cg5", "mewing", "fortnite battle pass", "gta 6", "backrooms", 
    "gigachad", "based", "cringe", "kino", "redpilled", "no nut november", "foot fetish", 
    "F in the chat", "i love lean", "looksmaxxing", "gassy", "social credit", "bing chilling", "xbox live", 
    "mrbeast", "kid named finger", "better call saul", "i am a surgeon", "hit or miss", "i like ya cut g", 
    "ice spice", "gooning", "fr", "we go gym", "kevin james", "josh hutcherson", "coffin of andy and leyley", 
    "metal pipe falling"
]

# Define browser options
browsers = {
    "firefox": webdriver.Firefox,
    "mozilla": webdriver.Firefox,
    "chrome": webdriver.Chrome,
    "google-chrome": webdriver.Chrome,
    "chromium": webdriver.Chrome,
    "chromium-browser": webdriver.Chrome,
    "safari": webdriver.Safari,
    "opera": webdriver.Opera
}

# Try launching a browser from the available ones
driver = None
for browser_name, browser_class in browsers.items():
    try:
        driver = browser_class()
        print(f"Opened {browser_name}")
        break
    except Exception:
        continue

if not driver:
    print("No compatible browser found!")
    exit()

# Open Google
driver.get("https://www.google.com")

# Find the search box
search_box = driver.find_element(By.NAME, "q")

print("Monitoring searches...")

# Monitor for user input
while True:
    user_input = search_box.get_attribute("value").lower()
    for term in watchlist:
        if term in user_input:
            print(f"ALERT: User searched for '{user_input}' (MATCH: {term})")
    time.sleep(1)
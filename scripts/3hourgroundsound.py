import pygame
import time
import os

def sound(file):
    pygame.mixer.init()
    pygame.mixer.music.load(file)
    pygame.mixer.music.play()

    while pygame.mixer.music.get_busy():  # Wait until the music finishes
        pygame.time.Clock().tick(10)  # Prevents high CPU usage

time.sleep(10800)


HOME_DIR =os.environ.get('HOME')
sound(HOME_DIR)

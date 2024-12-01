
def playwav():
    from playsound import playsound
    import os
    home_dir = os.environ.get('HOME')
    # Replace 'example.wav' with your .wav file path
    playsound(f'{home_dir}/fanum_battery.py')

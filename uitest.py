# import os
#
# musicFileList = [name for name in os.listdir("audio_and_music") if name.endswith(".mp3")]
# musicListPath = []
# for music in musicFileList:
#     musicListPath.append(os.path.join("./audio_and_music", music))

# import bluetooth
#
# nearby_devices = bluetooth.discover_devices(lookup_names=True, duration=8)
# print(nearby_devices)


from collections import Counter

list = {
    "happy": 10,
    "anger": 20,
    "disgust": 40,
    "suprise": 5
}

print(Counter(list)["happy"])

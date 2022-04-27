from use_tensorRT_engine import main
import time
from collections import Counter
# from playsound import playsound
import pygame

pygame.mixer.init()




def vote_al(second_result_list):
    counter = Counter(second_result_list)
    print(counter)
    return counter.most_common(1)[0][0]

def Get_every_frame_preresult():
    iter = main()
    startTime = time.time();
    one_second_result = []
    while True:
        endTime = time.time();
        one_second_result.append(next(iter))
        if endTime - startTime >= 5:
            vote_re = vote_al(one_second_result)
            one_second_result.clear()
            print(vote_re)
            print(endTime - startTime)
            startTime = time.time()


def play_Sound(music_path):
    
    track = pygame.mixer.music.load(music_path)
    pygame.mixer.music.set_volume(0.6)
    pygame.mixer.music.play()
    # time.sleep(10)
    time.sleep(30)
    pygame.mixer.music.stop()

def volume_add():
    num = pygame.mixer.music.get_volume()
    print("当前音量%f" %num)
    if num + 0.1 <= 1.0:
        pygame.mixer.music.set_volume(num + 0.1)
    else:
        print("音量已达最大值")

def volume_sub():
    num = pygame.mixer.music.get_volume()
    print("当前音量%f" %num)
    if num - 0.1 >= 0.0:
        pygame.mixer.music.set_volume(0.0)
    else:
        print("音量已达最小值")


if __name__ == "__main__":
    Get_every_frame_preresult()
    # play_Sound("./royster lee - 倒立的悬崖.mp3")
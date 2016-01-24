a = 100 #change me to do other numbers :) but sometimes it goes over, idk why... :(

cnt = 0
fizz_list = []
while cnt != a:
    if int(str(cnt / 3.0).split(".")[1]) == 0:
        fizz_list = fizz_list + [cnt]
    cnt = cnt + 1

cnt2 = 0
buzz_list = []
while cnt2 != a:
    if int(str(cnt2 / 5.0).split(".")[1]) == 0:
        buzz_list = buzz_list + [cnt2]
    cnt2 = cnt2 + 1

cnt3 = 0
fizz_buzz_list = []
while cnt3 != a:
    if (int(str(cnt3 / 5.0).split(".")[1]) == 0) and (int(str(cnt3 / 3.0).split(".")[1]) == 0):
        fizz_buzz_list = fizz_buzz_list + [cnt3]
    cnt3 = cnt3 + 1

def print_fizz():
    print("Fizz!")

def print_buzz():
    print("Buzz!")

def print_fizz_buzz():
    print("FizzBuzz!")

def print_number(a):
    print(a)

cnt4 = 0
while cnt4 <= a:
    lenghtOfList = len(fizz_buzz_list)
    cnt5 = 0
    fizz_buzz_flag = False
    while cnt5 != lenghtOfList:
        if cnt4 == fizz_buzz_list[cnt5]:
            print_fizz_buzz()
            cnt4 = cnt4 + 1
            fizz_buzz_flag = True
            break
        cnt5 = cnt5 + 1
    if fizz_buzz_flag == True:
        continue
    lengthOflist = len(fizz_list)
    fizz_flag = False
    cnt6 = 0
    while cnt6 != lengthOflist:
        if cnt4 == fizz_list[cnt6]:
            print_fizz()
            fizz_flag = True
            cnt4 = cnt4 + 1
            break
        cnt6 = cnt6 + 1
    if fizz_flag == True:
        continue
    lengthoflist = len(buzz_list)
    cnt7 = 0
    buzz_flag = False
    while cnt7 != lengthoflist:
        if cnt4 == buzz_list[cnt7]:
            print_buzz()
            cnt4 = cnt4 + 1
            buzz_flag = True
            break
        cnt7 = cnt7 + 1
    if buzz_flag == True:
        continue
    print_number(cnt4)
    cnt4 = cnt4 + 1

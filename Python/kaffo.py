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
    while cnt5 != lenghtOfList:
        if cnt5 == fizz_buzz_list[cnt5]:
            print_fizz_buzz()
            cnt4 = cnt4 + 1
            break
        cnt5 + cnt5 + 1
    lengthOflist = len(fizz_list)
    cnt6 = 0
    while cnt6 != lengthOflist:
        if cnt6 == fizz_list[cnt6]:
            print_fizz()
            cnt4 = cnt4 + 1
            break
        cnt6 + cnt6 + 1
    lengthoflist = len(buzz_list)
    cnt7 = 0
    while cnt7 != lengthoflist:
        if cnt7 == buzz_list[cnt7]:
            print_buzz()
            cnt4 = cnt4 + 1
            break
        cnt7 + cnt7 + 1
    print_number(cnt4)
    cnt4 = cnt4 + 1

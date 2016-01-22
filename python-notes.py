#!/opt/local/bin/python
# -*- coding: utf-8 -*-
# 
# import turtle
# 
# while True:
#     l = input('Задайте дължина ')
#     a = input('Задайте ъгъл ')
#     turtle.forward(int(l))
#     turtle.left(int(a))
# #!/opt/local/bin/python
# 
# import turtle
# 
# x = input('Брой итерации ')
# for i in range(0, int(x)):
#     g = 134
#     l = 120
#     i += 1
#     turtle.left(g+30)
#     turtle.forward(l+2)
#     if (i == x):
#         break
# #!/opt/local/bin/python
# 
# import turtle
# 
# i = 10
# while True:
#     turtle.left(i % 48)
#     turtle.forward(10)
#     i+=1
# turtle.exitonclick()
# #!/opt/local/bin/python
# 
# import turtle
# 
# side = 20
# razmer = int(8)
# razmer_2 = int(razmer/2)
# 
# print ("Размер 2 е: %i", razmer_2)
# turtle.speed(10)
# for i in range(razmer_2):
#     for i in range(razmer):
#         if i % 2 == 0:
#             turtle.begin_fill()
#         for i in range(1, 4):
#             turtle.forward(side)
#             turtle.left(90)
#         turtle.end_fill()
#         turtle.forward(side)
#         turtle.left(90)
#         turtle.forward(side)
# 
#     turtle.lt(180)
#     turtle.forward(side*razmer)
#     turtle.lt(90)
#     turtle.forward(side)
#     turtle.lt(90)
# 
#     for i in range(razmer):
#         if i % 2 != 0:
#             turtle.begin_fill()
#         for i in range(1, 4):
#             turtle.forward(side)
#             turtle.left(90)
#         turtle.end_fill()
#         turtle.forward(side)
#         turtle.left(90)
#         turtle.forward(side)
# 
#     turtle.lt(180)
#     turtle.forward(side*razmer)
#     turtle.lt(90)
#     turtle.forward(side)
#     turtle.lt(90)
# 
# 
# turtle.exitonclick()
# #!/opt/local/bin/python
# # -*- coding: utf-8 -*-
# import turtle
# 
# side = 10
# l = int(input('Размер на дъската: '))
# 
# 
# def draw_sq(is_filled, side_sq):
#     """Draw square notice where ends turtle"""
#     if is_filled == 0:
#         for i in range(1, 5):
#             turtle.forward(side_sq)
#             turtle.left(90)
#     elif is_filled == 1:
#         turtle.begin_fill()
#         for i in range(1, 5):
#             turtle.forward(side_sq)
#             turtle.left(90)
#         turtle.end_fill()
#     else:
#         print("ERROR")
#     turtle.forward(side_sq)
# 
# 
# def draw_row(num_of_sq, start_filled_sq):
#     """Draw row of the chess table"""
#     print ("Number of square: ", num_of_sq)
#     # turtle.speed(0)
#     for a in range(num_of_sq):
#         if start_filled_sq == 1:
#             if a % 2 == 0:
#                 draw_sq(1, side)
#             else:
#                 draw_sq(0, side)
#         else:
#             if a % 2 == 0:
#                 draw_sq(0, side)
#             else:
#                 draw_sq(1, side)
# 
# 
# def move_to_next_row(side, num_of_sq):
#     """ Move turtle to next row """
#     turtle.penup()
#     turtle.rt(180)
#     turtle.fd(side*num_of_sq)
#     turtle.lt(90)
#     turtle.fd(side)
#     turtle.lt(90)
#     turtle.pendown()
# 
# 
# def draw_chess_table(num_of_sq, sq_side):
#     """ Draw Chess table depends on sq_side and number of squares"""
#     for i in range(num_of_sq):
#         if i % 2 == 0:
#             draw_row(num_of_sq, 0)
#         else:
#             draw_row(num_of_sq, 1)
#         move_to_next_row(sq_side, num_of_sq)
# 
# 
# draw_chess_table(l, side)
# 
# 
# 
# turtle.exitonclick()

#!/opt/local/bin/python
# -*- coding: utf-8 -*-
# Strings / lists .. other

# name = 'Ivan'
# surename = 'Vankov'
# long_string = input('Напишете нещо: ')
# # find looking for a index of a string
# print(name.find("a"))
#
# # print fisrt  10 chars from string and add "..."
# print (long_string[0:10] + "...")
#
#
# # Задача 2 лекция 2
# # Напишете код, който взима два текста от потребителя, използвайки input(), след
# # което покажете първия текст, но само частта която се намира след втория текст.
#
# searched_txt = input('Търсен текст: ')
# idx = long_string.find(searched_txt)
# if idx == -1:
#     print ("Търсеният Текст го няма в " + "\" + long_string + \"")
# else:
#     to_end = long_string[idx:]
#     print ("Текстът след Търсеният Текст е:" + to_end)
#
# # Задача 3 "инициали"
# # Въведете име: Борис Червенков
# # Инициали: Б.Ч.
# ime = input('Въведете име: ')
# a = ime.split(' ')
# print (a[0][0]+". "+a[1][0]+".")


# # text as list 
# text = """Напишете код, който взима два текста от потребителя, използвайки input(), след"""
# words = text.split()
# print (words)

# # Задача 4 "цени на лекарства мин/мах/средно"
# print ('За да спрете въведете символ различен от число или "stop" ')
# stop_str = 'stop'
# price_list = []
# while True: 
# 	price = input('Въветеде price на лекарството Непукин: ')
# 	if price == stop_str:
# 		break
# 	if float(price):
# 		price_list.append(float(price))
# 		continue 
# 	else:
# 		break 
# # iterate over list 
# # for idx, value in enumerate(price_list):
# # 	print (idx, ' - ', value)
# 
# print (price_list)
# max_value = max(price_list)
# min_value = min(price_list)
# max_index = price_list.index(max_value)
# min_index = price_list.index(min_value)
# print("Max Index -> Value: " + str(max_index) + " <-> " + str(max_value) + "\nMin Index -> Value: " + str(min_index) + " <-> " + str(min_value))
# price_list.remove(max_value)
# price_list.remove(min_value)
# print ("List with removed min/max values: " + str(price_list))
# price_sum = sum(price_list)
# price_len = len(price_list)
# price_real = price_sum / price_len
# print ("Average Price: " + str(price_real))
# 


# # Лекция 3
# # string formatting ..
# # a = '{2} is {2} years old and like {0}'
# # a = '{} is {} years old and like {}'
# a = '{name} is {} years old and like {}'
# b = a.format(18,'ivan','beer',name='anani')
# print (b)
# 
# pi = "Pi is {:.4}" # round to 4th digit
# pp = pi.format(3.1415926)
# print (pp)
# # or direct way :)
# print ('{:.5}'.format(3.1415926))
# 
# list1 = list(range(10))
# print(list1[2:5:3]) # [start:stop:step]
# 
# print (list1)
# list1[2:4] = ['a','b','c'] # add at 2nd index  ['a','b','c']
# print (list1)
# 
# # tuple defined with () or without () but with commas ,
# vars = (1,'a',"Boris") # vars = 1,'a',"Boris"
# print(vars)
# # a=10
# # b=12
# # a,b = b,a # tuple 
# print(a)
# print(b)
# # tuple --> list
# vars_list = list(vars)
# print (vars_list)
# # Множества / sets random read ... 
# set1 = set( (1, 7,19,72,7) ) # define with (()) 
# print(set1)
# set2 = set( [1, 7,19,72,7] ) # with  ([])
# set3 = {} # this is dict
# set4 = set() # 
# 
# set1 = set(range(10))
# set2 = set(range(6,16))
# print(set1)
# print(set2)
# # обединение на множества 
# print (set1 | set2)
# print (set1.union(set2))
# # сечение на множества
# print (set1 & set2)
# print (set1.intersection(set2))
# set1.add(45)
# print ("adding 45 to set1")
# print(set1)

# # Вие сте създател на популярен сайт за запознанства и искате да улесните вашите потребители да намерят своята половинка. За целта вие събирате информация за интересите на всеки потребител и се опитвате да намерите партньор с максимално общи интереси. Имате дадени два списъка които съдържат интересите на Иванчо и Марийка. Напишете код който показва само общите интереси между двамата.  
# ivan = ['пушене', 'пиене', 'тия три неща', 'коли', 'facebook', 'игри', 'разходки по плажа', 'скандинавска поезия']
# maria = ['пиене', 'мода', 'facebook', 'игри', 'лов със соколи', 'шопинг', 'кино']
# set1_ivan = set(ivan) 
# set1_maria = set(maria)
# print(set1_ivan.intersection(set1_maria))

# # Diction 
# # DON"T USE float for keys
# # 
# a = {'name':'Ivan' , 'age':18}
# a['name']='marijka'
# a['phone']='555-231'
# print(a['name'])
# print(a)
# # check for existing/nonexisting key at dicttion
# if 'name' in a:
# 	print('true')
# if 'name1' not in a:
# 	print('true')
# # delete keys
# del a['name']
# print(a)
# # iterate on diction
# # iterate via keys
# print("js way 1")
# for i in a:
# 	print(i)
# # iterate
# print("js way 2")
# for i in a:
# 	print(a[i])
# # best way
# print("Best way")
# for key, value in a.items():
# 	print(key,'-->',value)
# # стойност под подразбиране
# print(a.get('kk','nema bate')) # check if key kk exist
# print(a.get('name','намерих ключа name'))

# print("-------------------------Задача 6: Matchmaking-----------------------------------")
# Задача: 6. Matchmaking
# 
# Да си направим програмка за запознанства.
# 
# В едно list-че сме си съчинили малко информация за момиченца и момченца. От данните, програмата трябва да изведе резултати кои хора биха си паснали, съгласно следните правила:
# 
# 	    момиченце с момченце; ако сте по-свободомислещи, можете да комбинирате и момченце с момченце, но все пак да има някакво правило :о);
# 	        трябва да имат поне един общ интерес;
# 
# 		Примерен резултат:
# 
# 			Мария и Георги - общ интерес: плуване
# 			. . .
# 
# 			Копирайте и използвайте в кода си тези данни:
# 
# people1 = [ 
#           { 'name': "Мария", 
#            'interests': ['пътуване', 'танци', 'плуване', 'кино'],
#            'gender': "female",
#           }, 
#           { 'name': "dwМария", 
#            'interests': ['пътуване', 'танци', 'плуване', 'кино'],
#            'gender': "male",
#           },
#          ]
# people = [
#           { 'name': "Мария", 
#            'interests': ['пътуване', 'танци', 'плуване', 'кино'],
#            'gender': "female",
#           }, 
#          {
#              'name': "Диана",
#              'interests': ['мода', 'спортна стрелба', 'четене', 'скандинавска поезия'],
#              'gender': "female",
#          },
#          {
#              'name': "Дарина",
#              'interests': ['танци', 'покер', 'история', 'софтуер'],
#              'gender': "female",
#          },
#          {
#              'name': "Лилия",
#              'interests': ['покер', 'автомобили', 'танци', 'кино'],
#              'gender': "female",
#          },
#          {
#              'name': "Галя",
#              'interests': ['пътуване', 'автомобили', 'плуване', 'баскетбол'],
#              'gender': "female",
#          },
#          {
#              'name': "Валерия",
#              'interests': ['плуване', 'покер', 'наука', 'скандинавска поезия'],
#              'gender': "female",
#                                },
#          {
#               'name': "Ина",
#               'interests': ['кино', 'лов със соколи', 'пътуване', 'мода'],
#               'gender': "female",
#          },
#          {
#               'name': "Кирил",
#               'interests': ['баскетбол', 'автомобили', 'кино', 'наука'],
#               'gender': "male",
#          },
#          {
#               'name': "Георги",
#               'interests': ['автомобили', 'футбол', 'плуване', 'танци'],
#               'gender': "male",
#          },
#          {
#              'name': "Андрей",
#              'interests': ['футбол', 'скандинавска поезия', 'история', 'танци'],
#              'gender': "male",
#          },
#          {
# 
#              'name': "Емил",
#              'interests': ['летене', 'баскетбол', 'софтуер', 'наука'],
#              'gender': "male",
#          },
#          {
#              'name': "Димитър",
#              'interests': ['футбол', 'лов със соколи', 'автомобили', 'баскетбол'],
#              'gender': "male",
#          },
#          {
#              'name': "Петър",
#              'interests': ['пътуване', 'покер', 'баскетбол', 'лов със соколи'],
#              'gender': "male",
#          },
#          {
#              'name': "Калоян",
#              'interests': ['история', 'покер', 'пътуване', 'автомобили'],
#              'gender': "male",
#          },
# ]
# # make set from interests & foreach item from that set get male & female that
# # have such interest
# boys = []
# girls = []
# for person in people:
#     if person.get('gender',None) == 'male': 
#         boys.append(person)
#     else:
#         girls.append(person)
# 
# # print (boys)
# # print (girls)
# 
# for boy in boys:
#     for girl in girls:
#         boy_interests = set (boy['interests'])
#         girl_interests = set (girl['interests'])
#         if boy_interests & girl_interests: # non-empty set is evaluated as True
#             print ("{} и {} -интереси: {}". format( boy['name'], girl['name'],
#                                                             boy_interests &
#                                                             girl_interests))
#             break
# 
# 

# print("------------------------- Функции/Scope -----------------------------------")
# 
# num1 = 4
# num2 = 5
# def sum2(num1):
#     return num1 + num2
# # Използва най-близко дефинираната стойност на num1 (най-близкият scope)
# print(sum2(10)) 

# num1 = 4
# num2 = 5
# # def sum2(num1, num2=7): # Параметър със стойност по подразбиране
# def sum2(num1, num2):
#     num1+=10
#     return num1 + num2
# # Предаване по стойност
# sum2(num1, num2)
# print (num1)
# 
# def test(p1):
#     p1.append(345)
# 
# m=l=[1,2,3,4]
# m.append(5)
# print(l)
# test(m)
# print(l)
# Ako параметърът е "immutable" objects -> int,float,string,tuple python прави
# копие!
# # Ako параметърът може да се променя (list ... ) то се предава като референция
# 
# def sort(p1):
#     p1.append(234)
#     return p1       # Хубаво е да се използва винаги return
# 
# l=[12,35,5,6]
# m=sort(l)
# print(l)
# 
# def something(a):
#     if a % 2 == 0:
#         return a**2
#     else:
#         a-=1
#         return a
# 
# for i in range(10):
#     print (something(i))
# 
# 
# 
# 
# print ("--- Exceptions try/except ----")
# people = [{'name': "Мария", 'gender': "female", }, {'name': "Калоян", 'gender': "male", }, ]
# 
# def print_person(person: dict):
#     raise # Хвърля грешката на общото условие Exeption (General error)
#     print("{} ({}) is interested in {}".format(
#         person['name'],
#         person['age'],
#         ', '.join(person['interests'])))
# 
# def print_people(people: list):
#     for person in people:
#         print_person(person)
# try:
# 	print_people({'name': "Калоян"})
# except KeyError as e: # само ако грешката е от тип KeyError
# 	print("Непълни данни за отпечатване!")
# except ValueError as e: # само ако грешката е от тип ValueError
# 	print("ValueError type")
# except Exception as e: # само ако грешката е от тип "всички възможни грешки"
#     print("General error") 
#     print(e) # обеката на Exeption-a ... e....
# finally:
#     # това ще се изпълни независимо дали имаме или нямаме грешка
#     print("finally: се изпълнява винаги ... ;) ")
# else:
#     print('didn't trow exeption without finaly:')
# 
# 
# import logging 
# print ("--- logging ---")
# logging.basicConfig(filename='task2.log', level=logging.DEBUG)
# 
# logging.info('Info log')
# logging.warning('Warn logging')
# logging.error('Error logging')
# logging.debug('нещо се омота')
# logging.critical('Critical log')

# print("--- I/O files ---")
# f = open('./task2.log')
# try: 
#     for idx, line in enumerate(f):
#         # print(idx+1, ": ", line, end='') # end на реда го смени с ''
#         # print(idx+1, ": ", line.strip()) # махни всички празни
#         print(idx+1, ": ", line.rstrip()) # махни ги но само отдясно 
#         1/0
# finally:
#     f.close()
#     print ('File Closed')

# с долното Гарантираме че файла ще се затвори без f.close()
# with open('./task2.log') as f:
#     for idx, line in enumerate(f):
#         print(idx+1, ": ", line.rstrip()) # махни ги но само отдясно 
#         1/0
        
# with open('./task2.log', 'r' ) as f: # open for reed
# with open('./task2.log', 'rb') as f: # read as binary
# with open('./task2.log') as f:
#     contents = f.read() # !!!!! никога не го правим ... защото реад чете ..
#     contents = f.readline() # !!!!! никога не го правим ... защото реад чете ..
#     contents = f.readlines() # !!!!! никога не го правим ... защото реад чете ..
#     print (contents) 
# 
# with open('./task3.log', 'a') as f: # append to file
# with open('./task3.log', 'w') as f: # overwrite or make new file
#     for i in range (20):
#         # f.write(str(i))
#         # f.write('\n')   # or with new line
#         f.write('{}\n'.format(i))
# 
# sum_all=float()
# # with open('./catalog_sample.csv', 'r') as f:
# with open('./catalog_full.csv', 'r') as f:
#     for idx, line in enumerate (f):
#         price = line.split(',')
#         # print ("Number of elements: ", idx+1, "Цена: ",price[6])
#         try:
#             sum_all += float(price[6])
#         except:
#             print("General Error")
# print('Брой елементи:',idx,'обща цена: ',sum_all,'средна цена; ', sum_all/float(idx))


# --------------------------------------------------------------------------------
# Задача 3
# --------------------------------------------------------------------------------
# import logging
# sum_all=float()
# sum_men=float()
# sum_women=float()
# sum_child=float()
# sum_unisex=float()
# idx_m=0
# idx_w=0
# idx_ch=0
# idx_u=0
# # with open('./catalog_sample.csv', 'r') as f:
# with open('./catalog_full.csv', 'r') as f:
#     for idx, line in enumerate (f):
#         price = line.split(',')
#         if price and price[0] and len(price) == 7:   # Check for valid line format
#             try:
#                 # print ("Number of elements: ", idx+1, "Цена: ",price[6])
#                 # print(price[5])
#                 if price[5] == 'Woman':
#                     idx_w += 1
#                     sum_women += float(price[6])
#                 elif price[5] == 'Men':
#                     idx_m += 1
#                     sum_men += float(price[6])
#                 elif price[5] == 'Kid':
#                     idx_ch += 1
#                     sum_child += float(price[6]) 
#                 elif price[5] == 'Unisex':
#                     idx_u += 1
#                     sum_unisex += float(price[6]) 
#             except Exception as e: 
#                 print (e)
#             
#         else:
#             logging.warning('Invalid line detected on line {}'.format(idx))
# print('Брой елементи men:{} oбща цена:{:.2f} Средна цена:{:.2f}'.format(idx_m,sum_men,sum_men/idx_m))
# print('Брой елементи women:{} oбща цена:{:.2f} Средна цена:{:.2f}'.format(idx_w,sum_women,sum_women/idx_w))
# print('Брой елементи child:{} oбща цена:{:.2f} Средна цена:{:.2f}'.format(idx_ch,sum_child,sum_child/idx_ch))
# print('Брой елементи unisex :{} oбща цена:{:.2f} Средна цена:{:.2f}'.format(idx_u,sum_unisex,sum_unisex/idx_u))

# 
# import sys
# print(sys.argv)
# 
# --------------------------------------------------------------------------------
# Modules
# --------------------------------------------------------------------------------
# import os
# import sys
# print(sys.argv) # ARGV (cli arguments)
# # prpint (os.access('/etc/hosts',os.r_OK)) # мога ли да чета този файл?
# # prpint (os.access('/etc/hosts',os.W_OK)) # мога ли да пиша в този файл?
# print(os.path.getsize('./catalog_full.csv')) # големината на файла в байтове
# print(os.path.dirname('./catalog_full.csv')) # връща името на директорията
# print(os.path.isfile('./catalog_full.csv'))  # това файл ли е? връща true / false 
# # print(os.path.islink('./simple.diag')) # това файл ли е? връща true / false 
# 
# for root,dirs,files in os.walk('./'):
#     print(root, '----', dirs,'----', files)
# 
# 
# Задача:
#     Напишете програма, която търси за файлове във Вашата файлова система.
#     Програмата трябва да получава два параметъра при извикването - къде да
#     търси, и какво да търси. Примерно извикване на програмата:
# 
#      python3  find.py  /home/user/Downloads  me.jpg
# 
#      В този случай find.py е името на скрипта, /home/user/Downloads в коя
#      папка да се търси, и me.jpg е името на търсения файл.
# 
#      Търсенето трябва да да включва всички поддиректории, които се намират в
#      началната директория за търсене.
# 
#      Ако файлът не е намерен, трябва да се показва съобщение, че файлът не е
#      намерен. В противен случай трябва да се отпечата пълния път до файла.
# 
#      Ако има повече от един файл със същото име в различни директории трябва
#      да се покаже списък с всички намерени файлове.
# 
#      Допълнение на задачата: Разширете вашия код, така че да може да търсите
#      с прост wild card * - в началото или в края на името.
# 
#      Пример:
# 
#          python3   find.py   /home/Downloads   me*
# 
#          В примера по-горе кодът ще трябва да намери всички файлове, чието
#          име започва с me, без значение какви символи следват след това.
#          

import sys
import os

if len(sys.argv) == 3 and (os.path.exists(sys.argv[1])):
    dir_name = argv[1]
    filename = argv[2]
    for dirname, path , file_name in os.walk(dir_name):
        if filename in file_name:
            print('Filename: {} is found at {}'.format(filename,dirname)
                  else:
            print('Filename: {} is not found at {}'.format(filename,dir_name)
else:
    print('Usage: argv[0] <dir> <filename> insert at least 2 arguments')
                                                
          

    






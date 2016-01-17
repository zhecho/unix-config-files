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

print("-------------------------Задача 6: Matchmaking-----------------------------------")
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
people = [
              {
                       'name': "Мария",
                       'interests': ['пътуване', 'танци', 'плуване', 'кино'],
                       'gender': "female",
                   },
              {
                       'name': "Диана",
                       'interests': ['мода', 'спортна стрелба', 'четене',
                                     'скандинавска поезия'],
                       'gender': "female",
                   },
              {
                       'name': "Дарина",
                       'interests': ['танци', 'покер', 'история', 'софтуер'],
                       'gender': "female",
                   },
              {
                       'name': "Лилия",
                       'interests': ['покер', 'автомобили', 'танци', 'кино'],
                       'gender': "female",
                   },
              {
                       'name': "Галя",
                       'interests': ['пътуване', 'автомобили', 'плуване',
                                     'баскетбол'],
                       'gender': "female",
                   },
              {
                       'name': "Валерия",
                       'interests': ['плуване', 'покер', 'наука', 'скандинавска поезия'],
                       'gender': "female",
                                         },
                   {
                        'name': "Ина",
                        'interests': ['кино', 'лов със соколи', 'пътуване', 'мода'],
                        'gender': "female",
                        },
                   {
                        'name': "Кирил",
                        'interests': ['баскетбол', 'автомобили', 'кино', 'наука'],
                        'gender': "male",
                        },
                   {
                        'name': "Георги",
                        'interests': ['автомобили', 'футбол', 'плуване', 'танци'],
                        'gender': "male",
                        },
                   {
                            'name': "Андрей",
                            'interests': ['футбол', 'скандинавска поезия', 'история', 'танци'],
                            'gender': "male",
                        },
                   {
                            'name': "Емил",
                            'interests': ['летене', 'баскетбол', 'софтуер', 'наука'],
                            'gender': "male",
                        },
                   {
                            'name': "Димитър",
                            'interests': ['футбол', 'лов със соколи', 'автомобили', 'баскетбол'],
                            'gender': "male",
                        },
                   {
                            'name': "Петър",
                            'interests': ['пътуване', 'покер', 'баскетбол', 'лов със соколи'],
                            'gender': "male",
                        },
                   {
                            'name': "Калоян",
                            'interests': ['история', 'покер', 'пътуване', 'автомобили'],
                            'gender': "male",
                        },
]
# make set from interests & foreach item from that set get male & female that
# have such interest
for person in people:
    print (person.get('grender', None)) person.get




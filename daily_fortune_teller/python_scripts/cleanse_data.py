1# python location 
2# -*- coding: utf-8 -*-


cleansed = []
with open('fortune_data/luck_data.txt', encoding="utf-8") as dt:
    read_dt = dt.readlines()
    for sentence in read_dt:
        cleansed.append(sentence.strip().replace('"', ''))
    

print(len(cleansed))

with open('fortune_data/cleansed_luck_data.txt', 'w', encoding="utf-8") as cl:
    for sentence in cleansed:
        cl.write(sentence + "\n")

with open('fortune_data/prompts_for_image.txt', 'w', encoding="utf-8") as cl:
    for sentence in cleansed:
        cl.write(sentence + "이 문장과 어울리는 동화책 스타일의 그림 그려줘" +"\n")
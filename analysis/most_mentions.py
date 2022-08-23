import json

with open('output/mentions.json', 'r') as myfile:
    data=json.load(myfile)

jm = data["journal"]["mentions"]

journal_drug = {}

for mention in jm:
    journal = mention['journal']

    if journal not in journal_drug:
        journal_drug[journal] = []

    journal_drug[journal].append(mention['drug'])

num_drug = {journal: len( set(journal_drug[journal])) for journal in journal_drug.keys() }

most_mentions = [ journal  for journal in num_drug.keys() if num_drug[journal] == max(num_drug.values())]

print('The journals that mention the most different drugs are :')
print(most_mentions)
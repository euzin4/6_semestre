texto=open('gramatica.txt','r')	#abre o arquivo para leitura 'r'
arq=texto.readlines()				#arq vira um VETOR com uma linha em cada posição
string=[]
string1=[]
maiusculo=[]
maiusculo1=[]
minusculo=[]
minusculo1=[]
matriznd=[]
string2=[]
aux=[]



#-------------------------------------------------------------------------------------------inicio matriz nao deterministica com gramatica
for linha in arq:					#for percorre todas as posições do vetor
	linha=linha.replace('\n','')		#retira o caractere '\n' da variavel
	linha=linha.replace('<','')
	linha=linha.replace('>','')
	linha=linha.replace(':','')
	linha=linha.replace('=','')
	linha=linha.replace('|','')
	string.append(linha)
	#print(string)
	string1.extend(linha)	#separa cada caractere em uma posicao do vetor string1
	#print(string1)
#print(string,'\n')
#print(string1,'\n')

maiusculo[:] = string1[:]	#faz cópia (usa [:] senão só é feito um aponteiramento)
minusculo[:] = string1[:]
#----------------------------------tira as letras minusculas e caracteres
for i in range(len(string1)):			
	if (maiusculo[i].islower()):
		maiusculo[i] = maiusculo[i].replace(maiusculo[i], '')
	if (maiusculo[i].isalpha() == False):
		maiusculo[i] = maiusculo[i].replace(maiusculo[i], '')
#print(maiusculo)
maiusculo1 = ''.join(maiusculo)	#transforma a lista em uma string usando '' como separador dos elementos da lista na string
#print('maiusc1:',maiusculo1)
#print('tam maiusc:',len(maiusculo1),'\n')
maiusculo.clear()
maiusculo.extend(maiusculo1)
'''print('maiusc:',maiusculo)
print('tam maiusc:',len(maiusculo))
print('')'''
#----------------------------------tira as letras maiusculas e caracteres
for i in range(len(string1)):
	if (minusculo[i].isupper()):
		minusculo[i] = minusculo[i].replace(minusculo[i], '')
	if (minusculo[i].isalpha() == False):
		minusculo[i] = minusculo[i].replace(minusculo[i], '')
#print(minusculo)
minusculo1 = ''.join(minusculo)	#transforma a lista em uma string usando '' como separador dos elementos da lista na string
#print('minusc1:',minusculo1)
#print('tam minusc:',len(minusculo1),'\n')
minusculo.clear()
minusculo.extend(minusculo1)
'''print('minusc:',minusculo)
print('tam minusc:',len(minusculo))
print('')'''

'''teste=[]
teste.extend(string[0])
print(teste,'\n')'''

#--------------------------------------------------------tira repetidos do 'maiusculo'
for i in range(0,len(maiusculo)):
	for j in range(i+1,len(maiusculo)):
		if (maiusculo[i] == maiusculo[j]):
			maiusculo[j] = maiusculo[j].replace(maiusculo[j], '')
			#print('maiusc:',maiusculo)
#print('maiusc:',maiusculo)
#print('maiusc1:',maiusculo1)
#--------------------------------------------------------tira repetidos do 'minusculo'
for i in range(0,len(minusculo)):
	for j in range(i+1,len(minusculo)):
		if (minusculo[i] == minusculo[j]):
			minusculo[j] = minusculo[j].replace(minusculo[j], '')
			#print('minusc:',minusculo)
#print('minusc:',minusculo)
#print('minusc1:',minusculo1)
minusculo1 = ''.join(minusculo)	#transforma a lista em uma string usando '' como separador dos elementos da lista na string
#print('minusc1:',minusculo1)
minusculo.clear()
minusculo.extend(minusculo1)
print('minusculo:',minusculo)
#--------------------------------------------------------tira repetidos do 'maiusculo'
for i in range(0,len(maiusculo)):
	for j in range(i+1,len(maiusculo)):
		if (maiusculo[i] == maiusculo[j]):
			maiusculo[j] = maiusculo[j].replace(maiusculo[j], '')
			#print('minusc:',maiusculo)
#print('minusc:',maiusculo)
#print('minusc1:',maiusculo1)
maiusculo1 = ''.join(maiusculo)	#transforma a lista em uma string usando '' como separador dos elementos da lista na string
maiusculo.clear()
maiusculo.extend(maiusculo1)
print('maiusculo:',maiusculo)
#-------------------------------------------------------------cria matriz
nlinhasnd = len(maiusculo)+1
ncolunasnd = len(minusculo)+1
#print(nlinhasnd)
for i in range(nlinhasnd):	#numero de linhas
	matriznd.append( [0] * ncolunasnd)	#numero de colunas

#-------------------------------------------------------------insere indices
matriznd[0][0] = '-'
for i in range(nlinhasnd-1):
	matriznd[i+1][0] = maiusculo[i]
for i in range(ncolunasnd-1):
	matriznd[0][i+1] = minusculo[i]
#-----------------------------------



'''print('\nMatriz nao deterministica:')
for i in range(nlinhasnd):	#printa matriz
	print(matriznd[i])'''

print('string:',string,'\n')

for i in range(len(string)):
	string2.extend(string[i])
	#print(string2)

	for j in range(nlinhasnd):	#loop para encontrar o caso
		if(string2[0] == matriznd[j][0]):
			linham = j
	for j in range(len(string2)):	#loop para encontrar a variavel terminal
		if(string2[j].islower() == True):
			for k in range(ncolunasnd):
				if(string2[j] == matriznd[0][k]): #se caso haver dados na celula
					if(matriznd[linham][k] != 0):
						aux.extend(matriznd[linham][k])
						aux.extend(string2[j+1])
						matriznd[linham][k]=''.join(aux)
						aux.clear()
					else:	#se nao haver dados na celula
						matriznd[linham][k] = string2[j+1]
	string2.clear()
#--------------------------------------------------------------------------------------fim matriz nao deterministica com gramatica


#----------------------------------------------------------printa matriz
print('\nMatriz nao deterministica (matriznd):')
for i in range(nlinhasnd):	#printa matriz
	print(matriznd[i])

#--------------------------------------------------------------determinização da matriz

'''nlinhasnd = len(maiusculo)+1
ncolunasnd = len(minusculo)+1
#print(nlinhasnd)
for i in range(nlinhasnd):	#numero de linhas
	matriznd.append( [0] * ncolunasnd)	#numero de colunas

for i in range(nlinhasnd):
	for j in range(ncolunasnd):
		if (i != 0 and j != 0):
			if(matriznd[i][j]!=0 and len(matriznd[i][j]) > 1):
				aux.extend(matriznd[i][j])
				print('\n',aux)
				for k in range(len(aux)):
					for l in range(nlinhasnd):
						if(matriznd[l][0] == aux[k]):
							a=1


print('Matriz deterministica:')
for i in range(nlinhasnd):	#printa matriz
	print(matriznd[i])'''
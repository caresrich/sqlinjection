#!/home/Bett0/python
cadena = raw_input("String: ")

hexa='0x'

print '[*] Plain: ',cadena

for letra in range(len(cadena)):
	hexy="%x" % ord(cadena[letra])
	hexa=hexa+str(hexy)
	
print '[*] Hexa:  ',hexa

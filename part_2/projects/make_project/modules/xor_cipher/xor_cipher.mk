XOR_INCLUDE_DIR = $(XOR_CIPHER_DIR)/inc
XOR_SOURCE_DIR = $(XOR_CIPHER_DIR)/src

CC = gcc
XOR_CFLAGS = -I$(XOR_INCLUDE_DIR) -fPIC

XOR_CIPHER_OBJ = $(APP_OBJ_DIR)
XOR_CIPHER_LIB = $(APP_LIB_DIR)/xor_dynamic.so

$(XOR_CIPHER_LIB) : $(XOR_CIPHER_OBJ)/xor_decrypt.o $(XOR_CIPHER_OBJ)/xor_encrypt.o 
	$(CC) -shared $(XOR_CIPHER_OBJ)/xor_decrypt.o  $(XOR_CIPHER_OBJ)/xor_encrypt.o -o $(XOR_CIPHER_LIB)

$(XOR_CIPHER_OBJ)/xor_decrypt.o : $(XOR_SOURCE_DIR)/xor_decrypt.c
	$(CC) -c $(XOR_SOURCE_DIR)/xor_decrypt.c -o $(XOR_CIPHER_OBJ)/xor_decrypt.o $(XOR_CFLAGS)

$(XOR_CIPHER_OBJ)/xor_encrypt.o : $(XOR_SOURCE_DIR)/xor_encrypt.c
	$(CC) -c $(XOR_SOURCE_DIR)/xor_encrypt.c -o $(XOR_CIPHER_OBJ)/xor_encrypt.o $(XOR_CFLAGS)

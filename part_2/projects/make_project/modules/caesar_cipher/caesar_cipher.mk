CAESAR_INCLUDE_DIR = $(CAESAR_CIPHER_DIR)/inc
CAESAR_SOURCE_DIR = $(CAESAR_CIPHER_DIR)/src

CC = gcc
CAESAR_CFLAGS = -I$(CAESAR_INCLUDE_DIR)
AR = ar

CAESAR_CIPHER_OBJ = $(APP_OBJ_DIR)
CAESAR_CIPHER_LIB = $(APP_LIB_DIR)/caesar_static.a

$(CAESAR_CIPHER_LIB) : $(CAESAR_CIPHER_OBJ)/caesar_decrypt.o $(CAESAR_CIPHER_OBJ)/caesar_encrypt.o  
	$(AR) -cr $(CAESAR_CIPHER_LIB) $(CAESAR_CIPHER_OBJ)/caesar_decrypt.o $(CAESAR_CIPHER_OBJ)/caesar_encrypt.o 

$(CAESAR_CIPHER_OBJ)/caesar_decrypt.o : $(CAESAR_SOURCE_DIR)/caesar_decrypt.c
	$(CC) -c $(CAESAR_SOURCE_DIR)/caesar_decrypt.c -o $(CAESAR_CIPHER_OBJ)/caesar_decrypt.o $(CAESAR_CFLAGS)

$(CAESAR_CIPHER_OBJ)/caesar_encrypt.o : $(CAESAR_SOURCE_DIR)/caesar_encrypt.c
	$(CC) -c $(CAESAR_SOURCE_DIR)/caesar_encrypt.c -o $(CAESAR_CIPHER_OBJ)/caesar_encrypt.o $(CAESAR_CFLAGS)

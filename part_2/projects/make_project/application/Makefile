# Main Directories
ROOT_DIR = ..
APP_DIR = $(ROOT_DIR)/application
MODULES_DIR = $(ROOT_DIR)/modules

CC=gcc
CFLAGS = -I$(CAESAR_CIPHER_DIR)/inc -I$(XOR_CIPHER_DIR)/inc

# Modules Directories
CAESAR_CIPHER_DIR = $(MODULES_DIR)/caesar_cipher
XOR_CIPHER_DIR = $(MODULES_DIR)/xor_cipher

# Application Directories
APP_OUT_DIR = $(APP_DIR)/out
APP_OBJ_DIR = $(APP_OUT_DIR)/gen
APP_LIB_DIR = $(APP_OUT_DIR)/libs
#APP_BIN =

include $(CAESAR_CIPHER_DIR)/caesar_cipher.mk
include $(XOR_CIPHER_DIR)/xor_cipher.mk

LIB = $(APP_LIB_DIR)/caesar_static.a $(APP_LIB_DIR)/xor_dynamic.so



lib_create : 
	mkdir -p $(APP_OBJ_DIR) $(APP_LIB_DIR)
	
all : app.o
	$(CC) $(APP_OBJ_DIR)/app.o -L$(APP_LIB_DIR) $(APP_LIB_DIR)/caesar_static.a $(APP_LIB_DIR)/xor_dynamic.so -o output $(CFLAGS)

app.o : lib_create $(LIB)
	$(CC) -c $(APP_DIR)/app.c -o $(APP_OBJ_DIR)/app.o $(CFLAGS) 
	
clean: 
	rm -rf $(APP_OUT_DIR) $(APP_OBJ_DIR) $(APP_LIB_DIR) output

##
## Makefile for my_irc in /Users/victorbalssa/my_irc
## 
## Made by BALSSA Victor
## Login   <balssa_v@etna-alternance.net>
## 
## Started on  Wed Nov 23 14:25:10 2016 BALSSA Victor
## Last update Thu Dec  1 21:20:06 2016 BALSSA Victor
##

CC =		gcc

RM =		rm -f

LIB =		cd libmy/; make

LIB_CLEAN =	cd libmy/; make clean

LIB_FCLEAN =	cd libmy/; make fclean

CFLAGS =	-Wall -Werror -W -Wextra

NAME_SERVER =	server_bin

NAME_CLIENT =	client_bin

SRCS_SERVER =	$(wildcard server/*.c)

SRCS_CLIENT =	$(wildcard client/*.c)

OBJS_SERVER =	$(SRCS_SERVER:%.c=%.o)

OBJS_CLIENT =	$(SRCS_CLIENT:%.c=%.o)

all:		$(NAME_SERVER) $(NAME_CLIENT)

server:		$(NAME_SERVER)

client:		$(NAME_CLIENT)

$(NAME_SERVER):	$(OBJS_SERVER)
		@$(LIB)
		@echo "-> Compilation server_bin ..."
		$(CC) $(OBJS_SERVER) -L libmy/ -lmy $(CFLAGS) -o $(NAME_SERVER) $(LDFLAGS)

$(NAME_CLIENT):	$(OBJS_CLIENT)
		@$(LIB)
		@echo "-> Compilation client_bin ..."
		$(CC) $(OBJS_CLIENT) -L libmy/ -lmy $(CFLAGS) -o $(NAME_CLIENT) $(LDFLAGS)

clean:		
		@echo "-> clean client / server ..."
		@$(RM) $(OBJS_SERVER)
		@$(RM) $(OBJS_CLIENT)
		@$(LIB_CLEAN)

fclean:		clean
		@echo "-> fclean client / server ..."
		@$(RM) $(NAME_SERVER)
		@$(RM) $(NAME_CLIENT)
		@$(LIB_FCLEAN)

re:		fclean all clean

.PHONY:		all clean fclean re

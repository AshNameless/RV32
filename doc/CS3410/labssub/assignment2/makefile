objects = main.o treeTraversal.o

post: $(objects) 
	gcc -std=c99 -Wall -Werror -o post $(objects) 

main.o: main.c
	gcc -std=c99 -Wall -Werror -c main.c

treeTraversal.o: treeTraversal.c treeTraversal.h
	gcc -std=c99 -Wall -Werror -c treeTraversal.c

.PHONY: clean 
clean: 
	rm post $(objects)

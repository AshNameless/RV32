#include <stdio.h>
#include <stdlib.h>
#include "treeTraversal.h"

int main()
{
        char preorder[100], inorder[100];
        
        printf("Input the pre-order traversal:");
        scanf("%s", preorder);

        printf("Input the in-order traversal:");
        scanf("%s", inorder);

        int len;
        //TODO: caculate the length of the input
        for(len = 0;;len++)
                if(preorder[len] == '\0')
                        break;

        //Bulid the binary tree
        node_t* tree = build_tree2(inorder, preorder, 0, len-1, 0, len-1); 
        printf("The post-order traversal is:");

        //TODO:Output the post-order
        print_postorder(tree);
        
        printf("\n");
        free_tree(tree);
        return 0;
}

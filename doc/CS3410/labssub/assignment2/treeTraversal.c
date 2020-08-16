#include <stdio.h>
#include <stdlib.h>
#include "treeTraversal.h"

 /** Helper function that allocates a new node with the
   * given data and NULL left and right pointers. 
   * We have implemented this function for your conveninece becuase this function uses malloc that you probably are not familiar with.
   * Don't forget to free all memory allocted here before your program terminates. */



// TODO: Implement functions defined in treeTraversal.h here.
node_t* new_node(char data)
{
        node_t* node = (node_t*)malloc(sizeof(node_t));
        node-> data = data;
        node->left = NULL;
        node->right = NULL;
        
        return node;
}

node_t* build_tree2(char in[], char pre[], int in_left, int in_right, int pre_left, int pre_right)
{
        node_t* node;
        int x;

        node = new_node(pre[pre_left]);  //pre首位必是root
        if(in_left >= in_right)  //只有一个节点 
                return node;
        else
        {
                //在in中找到root
                for(x = in_left; x <= in_right; x++)
                        if(in[x] == pre[pre_left])
                                break;

                if(x > in_left)  //说明有左子树
                        node->left = build_tree2(in, pre, in_left, x-1, pre_left+1, pre_left+x-in_left);
                if(x < in_right)  //说明有右子树
                        node->right = build_tree2(in, pre, x+1, in_right, pre_right-in_right+x+1, pre_right);
        }
        return node;

}


void print_postorder(node_t* node)
{
        if(node->left != NULL)
                print_postorder(node->left);
        if(node->right != NULL)
                print_postorder(node->right);
        printf("%c", node->data);
      

}


void free_tree(node_t* tree)
{
        if(tree != NULL)
        {
                free_tree(tree->left);
                free_tree(tree->right);
                free(tree);
        }
}

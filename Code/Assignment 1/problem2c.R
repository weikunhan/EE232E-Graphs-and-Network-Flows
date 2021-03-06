# EE232E Homework 1 Problem 2 c
# Name: Weikun Han, Duzhi Chen
# Date: 4/14/2017
# Reference:
#  - https://google.github.io/styleguide/Rguide.xml#indentation

library(igraph)

# Initial veriables
node <- 10000

# Create the undirected random network,
# whose degree distribution is proportional to x^(-3)
graph <- barabasi.game(node, directed = FALSE)

# Check the graph connectivity
if(is.connected(graph)) {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Graph whose degree distribution is proportional to x^(-3)\n",
        "Connectiveity: Conneected\n",
        "-------------------------------------------------------------------------------\n")
} else {

    # Print information
    cat("-------------------------Processing Finshed 1----------------------------------\n",
        "Graph whose degree distribution is proportional to x^(-3)\n",
        "Connectiveity: Not conneected\n",
        "-------------------------------------------------------------------------------\n")
}

# Find the giant connected component (GCC)
cluster <- clusters(graph)
gcc_index <- which.max(cluster$csize)
non_gcc_nodes <- (1:vcount(graph))[cluster$membership != gcc_index]
gcc <- delete.vertices(graph, non_gcc_nodes)

# Use fast greedy method to find the community structure
fc <- fastgreedy.community(gcc)

# Print information
cat("-------------------------Processing Finshed 2----------------------------------\n",
    "Fast greedy method to find the community structure done.\n",
    "The modularity is: ", modularity(fc), "\n",
    "-------------------------------------------------------------------------------\n")

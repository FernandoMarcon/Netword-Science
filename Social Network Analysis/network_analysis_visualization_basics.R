library(sna)
library(igraph)

#### --------------- Creating Network Graphs --------------- ####
#--- Create a graph from existing data
data = read.table('data/undirected.txt')
head(data)

graph1 <- graph_from_data_frame(data, directed = F, vertices = NULL)
plot(graph1)

#--- Create sample graphs
g_full <- make_full_graph(8, directed=F, )
plot(g_full)

g_ring <- make_ring(20, directed=F, mutual=F, circular=T)
plot(g_ring)

g_star <- make_star(10,center = 1)
plot(g_star)

g_gnp <- sample_gnp(20, 0.3, directed=F, loops=F)
plot(g_gnp)

g_gnm <- sample_gnm(20, 50, directed=F, loops=F)
plot(g_gnm)

g_gnm <- sample_gnm(20, 25, directed=F, loops=F)
plot(g_gnm)
g_gpa <- sample_pa(20, power=1)
plot(g_gpa)

#### --------------- Analyzing Network Graphs --------------- ####
#--- Measure connectedness of points
g1 <- sample_pa(12, power=1, directed=F)
plot(g1)
degree(g1)
#--- Measure netweenness of points
g1 <- sample_pa(20,power=1,directed=F)
plot(g1)
betweenness(g1)

#--- Calculate network density
g1 <- sample_pa(12, power=1, directed=F)
plot(g1)
edge_density(g1, loops=F)

g1 <- sample_pa(20, power=1, directed=F)
plot(g1)
edge_density(g1, loops=F)

g1 <- sample_pa(50, power=1, directed=F)
plot(g1)
edge_density(g1, loops=F)

density <- c()
for(i in 1:40){
  g1 <- sample_pa(i, power=1,directed=F)
  density <- c(density, edge_density(g1, loops=F))
}
plot(1:40, density)

#--- Identify cliques in a graph
g1 <- sample_gnp(20, 0.3, directed=F, loops=F)
plot(g1)
clique_num(g1)
g1 <- sample_gnp(20,0.3, directed=F, loops=F)
clique_num(g1)

cliques(g1, min=4)

#--- Find components of a graph
g1 <- sample_gnp(30, 0.08, directed=F, loops=F)
plot(g1)
components(g1)

#--- Take a random walk on a graph
g1 <- sample_gnp(30, 0.08, directed=F)
plot(g1)
random_walk(g1, 26, 9, stuck='return')

#### --------------- Visualizing a Network --------------- ####
g1 <- sample_gnp(30,0.08)
plot(g1)

#--- Change edge and vertex colors
g1 <- g1 %>% set_vertex_attr('color',value = 'blue') %>%
  set_edge_attr('color', value = 'green')
plot(g1)

#--- Write out a graph
write.graph(g1, file='rand_network.txt', format='edgelist')

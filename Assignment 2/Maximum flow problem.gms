
$title maximal flow Problem

set i nodes /1*6/;
alias (i, j);

parameter c(i,j) link capacity /
1. 2   5
1. 3   10
2. 4   4
2. 5   5
3. 4   5
3. 5   5
4. 6   8
5. 6   10
/;

parameter source(i);
source('1') = 1;

parameter sink(i);
sink('6') = 1;

parameter intermediate_node(i);
intermediate_node(i) = (1- source(i))*(1- sink(i));

variable z;
positive variable v;
positive variable x(i,j);

equations
obj                           define objective function
flow_on_node_source
flow_on_node_intermediate(i)
flow_on_node_sink
link_cap(i,j)
;

obj.. z =e= v;
flow_on_node_source.. sum(j$(c('1',j)), x('1',j)) =e= v;
flow_on_node_intermediate(i)$(intermediate_node(i)=1).. sum(j$(c(i,j)), x(i,j))-sum(j$(c(j,i)), x(j,i))=e= 0;
flow_on_node_sink..  sum(j$(c(j,'6')), x(j,'6'))=e= v;
link_cap(i,j)$(c(i,j)>0.1).. x(i,j)=l=c(i,j);

Model maximal_flow_problem /all/ ;

solve maximal_flow_problem using LP maximizing z;

display x.l;
display v.l;
display z.l;

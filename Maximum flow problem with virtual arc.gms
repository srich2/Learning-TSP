$title maximal flow Problem_2

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
6. 1   100
/;

variable z;
positive variable x(i,j);

equations
obj                              define objective function
flow_blance_on_node(i)
link_cap(i,j)
;

obj.. z =e= x('6','1');
flow_blance_on_node(i).. sum(j$(c(i,j)), x(i,j))-sum(j$(c(j,i)), x(j,i))=e= 0;
link_cap(i,j)$(c(i,j)>0.1).. x(i,j)=l=c(i,j);

Model maximal_flow_problem /all/ ;

solve maximal_flow_problem using LP maximizing z;

display x.l;
display z.l;

$title Linear Programming Problem

set i /1*2/;
variable z;
positive variables x(i);

equations
obj                                define objective fucntion
constraint1
constraint2
;

obj.. z =e= 3*x('1') + 4*x('2');
constraint1.. x('1') + 2*x('2') =l= 10;
constraint2.. 2.5*x('1') + x('2') =l= 12;

Model linear_programming /all/ ;

solve linear_programming using lp maximizing z;
display x.L;
display z.L;

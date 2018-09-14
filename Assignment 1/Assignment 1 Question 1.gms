      Sets

       i   city    / A1, A2 /

       j   Airport / B1, B2 / ;



  Parameters



       a(i)  demand of city i

         /    A1  100

              A2  200

         /



       b(j)  capacity at airport j

         /   B1  150

             B2  150

         / ;



  Table c(i,j)  distance between cities and airports

                    B1     B2

      A1            50     70

      A2            45     55 ;



  Variables

       x(i,j)  passengers travelling from city i to airport j

       z       total travel cost ;



  Positive Variable x ;



  Equations

       cost        define objective function

       supply(i)   observe supply limit at plant i

       demand(j)   satisfy demand at market j ;



  cost ..        z  =e=  sum((i,j), c(i,j)*x(i,j)) ;



  supply(i) ..   sum(j, x(i,j))  =e=  a(i) ;



  demand(j) ..   sum(i, x(i,j))  =e=  b(j) ;



  Model transport /all/ ;



  Solve transport using lp minimizing z ;



  Display x.l, z.l ; 
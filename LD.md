## Linkage Disequalium

**LD itself does not mean there is physical linkage.**

$$D_{ij}=f_{ij}-f_{i}f_{j}$$

We can denote 1 as A and 0 as a, which means we have an A or not. Let $x$ be the variable of a SNP site.

$$E(x=A) = E(x=1) = 1\times P(x=1)+0\times P(x=0) = P(x=1) = f_{A}$$
$$Var(x=1) = E(x^2=1)-[E(x=1)]^2$$
$$Var(x=1) = E(x=1)-[E(x=1)]^2$$
$$Var(x=1) = f_A-f_A^2=f_A(1-f_A)=f_Af_a$$
In conclusion we have:
$$E(x=A) = f_{A}$$
$$Var(x=A) = f_Af_a$$
$$E(x=B) = f_{B}$$
$$Var(x=B) = f_Bf_b$$

So the covariance is: (remember A = 1, B = 1)

$$Cov(A,B) = E(AB）- E(A)E(B) = E(AB)-f_Af_B$$

For $E(AB)$:

$$E(AB) = (1\times 1)f_{AB}+(0\times 1)f_{aB}+(1\times 0)f_{Ab}+(0\times 0)f_{ab}=f_{AB}$$

Then,

$$Cov(A,B) = f_{AB}-f_Af_B=D_{AB}$$

In probability theory: 

$$Cov(X,Y)=E\big( [X-E(X)][Y-E(Y)] \big) = E\big( XY-YE(X)-XE(Y)-E(X)E(Y) \big)$$

Then split the formula, it's easy to understand that E(i) is a constant, so E(E(i)) is E(i) the constant itself.

$$Cov(X,Y) = E(XY)-E(YE(X))-E(XE(Y))-E(E(X)E(Y)) = E(XY) - E(X)E(Y)-E(X)E(Y)+E(X)E(Y) = E(XY) - E(X)E(Y)$$

So the Correlation Coefficient $r^2$ is:

$$r = \frac{Cov(A,B)}{\sqrt{Var(A)Var(B)}} = \frac{D_{AB}}{\sqrt{f_Af_af_Bf_b}}$$
$$r^2 = \frac{D_{AB}^2}{f_Af_af_Bf_b}$$

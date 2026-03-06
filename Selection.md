## Selection Models
### Haploid Selection
Haploid selection is the most basic model (allele A and a):
The number of generation (t=0) of individuals that carries allele A is $N_A$, the other one is $N_a$. When it comes to generation (t=1), A-bearing individuals reproduces $w_A$ descendants(offsprings) on average, $w_a$ descendants on average for a-bearing individuals, and a-individuals suffer from selection.

$$f_A(0) = \frac{N_A}{N_A + N_a}$$
$$
f_A(1) = \frac{w_A N_A}{w_A N_A + w_a N_a} 
= \frac{w_A \frac{N_A}{N_A + N_a}}{w_A \frac{N_A}{N_A + N_a} + w_a \frac{N_a}{N_A + N_a}} 
= \frac{w_A f_A(0)}{w_A f_A(0) + w_a f_a(0)}
= \frac{f_A(0)}{f_A(0) + (w_a/w_A) f_a(0)}
$$

The new frequency depends on the ratio $w_a/w_A$. It is convenient to define the selection coefficient $s$  in terms of this ratio:

$$
\frac{w_a}{w_A} = \frac{1-s_a}{1} = 1-s_a 
$$

So the $f_A(t)$ is:

$$
f_A(t) = \frac{f_A(0)}{f_A(0) + (1-s_a)^t f_a(0)}
$$
$$
t=\frac{1}{\log(1-s_a)} \frac{\frac{f_A(0)}{f_A(t)}-f_A(0)}{f_a(0)}
$$


What only matters is the $1-s_a$, which is close to the relative viability we will discuss later.

### Diploid Selection

Diploid individuals do not transmit their genotypes directly to their offspring. Assuming that selection results from differences in the
survival rate of individuals with different genotypes. 

**Viability selection**: different genotype has different survival rate, which is the viability. Viability refers to individuals can grow up to adult and able to reproduce.
Assume each individual can reproduce $r$ offsprings on average. The viability for genotype AA, Aa, and aa is $v_{AA}$, $v_{Aa}$, and $v_{aa}$ respectively. According to the random mating rule, we have to calculate the frequency of each allele, so that we can calculate the frequency of each genotype.

$$

$$


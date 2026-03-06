## Selection Models
### Haploid Selection
Haploid selection is the most basic model (allele A and a):
The number of generation (t=0) of individuals that carries allele A is $N_A$, the other one is $N_a$. When it comes to generation (t=1), A-bearing individuals reproduces $w_A$ descendants(offsprings) on average, $w_a$ descendants on average for a-bearing individuals, and a-individuals suffer from selection.

$$f_A(0) = \frac{N_A}{N_A + N_a}$$
$$
f_A(1) = \frac{w_A N_A}{w_A N_A + w_a N_a} 
= \frac{w_A N_A/(N_A + N_a)}{w_A N_A/(N_A + N_a) + w_a N_a/(N_A + N_a)} 
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
t=\frac{1}{\log(1-s_a)} \frac{f_A(0)/f_A(t)-f_A(0)}{f_a(0)}
$$


What only matters is the $1-s_a$, which is close to the relative viability we will discuss later.

### Diploid Selection

Diploid individuals do not transmit their genotypes directly to their offspring. Assuming that selection results from differences in the
survival rate of individuals with different genotypes. 

**Viability selection**: different genotype has different survival rate, which is the viability. Viability refers to individuals can grow up to adult and able to reproduce.
Assume each individual can reproduce $r$ offsprings on average. The viability for genotype AA, Aa, and aa is $v_{AA}$, $v_{Aa}$, and $v_{aa}$ respectively. According to the random mating rule, we have to calculate the frequency of each allele, so that we can calculate the frequency of each genotype. Let $f_A$ and $f_a$ represent $f_A(0)$ and $f_a(0)$ respectively.

There are N offspring, the numbers with each of the three genotypes are:

$$
N_{AA}(0) = N(0)f_{AA} = N(0)f_A^2, N_{Aa}(0) = N(0)f_{Aa} = 2N(0)f_Af_a, N_{aa}(0) = N(0)f_{aa} =N(0)f_a^2
$$

And the numbers of them who can survive to adulthood are:

$$
N_{AA}(1) = N(0)v_{AA}f_A^2, N_{Aa}(1) = 2N(0)v_{Aa}f_Af_a, N_{aa}(1) = N(0)v_{aa}f_a^2
$$

$$
N(1) = N_{AA}(1)+N_{Aa}(1)+N_{aa}(1) = N(0)v_{AA}f_A^2 + 2N(0)v_{Aa}f_Af_a + N(0)v_{aa}f_a^2 = N(0)\bar{v}
$$

$$
\bar{v} = v_{AA}f_A^2 + 2v_{Aa}f_Af_a + v_{aa}f_a^2
$$

$$
f_A(1) = \frac{v_{AA}f_A^2 + v_{Aa}f_Af_a}{\bar{v}},\text{ } f_a(1) = 1 - f_A(1)
$$

Let's look at an example, assume there are 10,000 newborn with $f_A(0)=0.4$:

```r
calculate_next_fA = function(fA0, vAA, vAa, vaa) {
  fa0 = 1 - fA0
  above = vAA * (fA0^2) + 0.5 * vAa * (2 * fA0 * fa0)
  below = vAA * (fA0^2) + vAa * (2 * fA0 * fa0) + vaa * (fa0^2)
  fA1 = above / below
  return(fA1)
}

fA_next = calculate_next_fA(fA0=0.3, vAA=0.8, vAa=0.7, vaa=0.5)

cat(paste("fA(0):", fA_0, "\n"))
cat(paste("fA(1):", round(fA_next, 4), "\n"))
```

We will get result```fA(1): 0.4596```, which is larger than $f_A(0)$. This is due to relative viability, if we multiply all viabilities by 0.1, the frequency will not be changed.

### Special Cases of Selection
**Additive Selection**: Assume $v_{AA} = 1$, $v_{Aa}=1-s$, and $v_{aa} = 1 - 2s$

$$
\begin{aligned}
\bar{v} &= f_A^2 + 2(1-s)f_Af_a + (1-2s)f_a^2 \\
&= f_A^2 + 2f_Af_a - 2sf_Af_a + f_a^2 - 2sf_a^2 \\
&= (f_A^2 + 2f_Af_a + f_a^2) - 2s(f_Af_a + f_a^2) \\
&= (f_A + f_a)^2 - 2sf_a(f_A + f_a) \\
&= 1 - 2sf_a
\end{aligned}
$$

$$
f_A(1) = \frac{f_A^2 + (1-s)f_Af_a}
{1 - 2sf_a} = 
\frac{f_A(f_A + f_a - sf_a)}
{1 - 2sf_a}=
\frac{f_A(1 - sf_a)}
{1 - 2sf_a}
$$

$$
\begin{aligned}
\Delta f_A &= f_A(1) - f_A(0) \\
&= \frac{f_A(1 - sf_a)}{1 - 2sf_a} - f_A \\
&= f_A(\frac{1 - sf_a}{1 - 2sf_a}- 1) \\
&= f_A(\frac{1 - sf_a - 1 + 2sf_a}{1 - 2sf_a}) \\
&= f_A(\frac{sf_a}{1 - 2sf_a}) \\
&= \frac{sf_Af_a}{1 - 2sf_a}
\end{aligned}
$$







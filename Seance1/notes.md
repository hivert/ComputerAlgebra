---
jupyter:
  jupytext:
    encoding: '# -*- coding: utf-8 -*-'
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.6
  kernelspec:
    display_name: SageMath 10.7
    language: sage
    name: sagemath
---

# Lab Report, Session 1


## Symbolic Manipulations in Sage


Compute the following expressions in Sage:

- $\displaystyle\frac{\partial}{\partial a}\left(1 + F(a, 2ab) + b\right)$
- $\displaystyle\sum_{i=0}^{i=n} i^2$
- $\displaystyle\sum_{n=1}^{\infty} 2^{-n}$
- $\displaystyle\sum_{i=1}^{\infty} 1/i^2$

Hints: `var`, `function`, `diff`, `sum`

```sage

```

```sage

```

```sage

```

```sage

```

```sage

```

```sage

```

```sage

```

## Polynomial Factorizations

```sage
x = var('x')
p = 54*x^4+36*x^3-102*x^2-72*x-12
factor(p)
```

Is this answer satisfactory? It is indeed a factorization of $p$, but its optimality depends heavily on the context! For the moment, Sage considers $p$ as a symbolic expression, which happens to be polynomial. It cannot know whether we want to factor $p$ as a product of polynomials with integer coefficients or with rational coefficients (for example). To take control, we will specify in which set (computational domain?) we wish to consider $p$. 

To begin with, we will consider $p$ as a polynomial with integer coefficients. We therefore define the ring $R=Z[x]$ of these polynomials:

```sage
R = ZZ['x']; R
```

Then we convert $p$ into this ring:

```sage
q = R(p); q
```

When displayed, there is no visible difference, but $q$ knows that it is an element of $R$:

```sage
parent(q)
```

As a result, its factorization is unambiguous:

```sage
factor(q)
```

We proceed similarly over the field of rational numbers:

```sage
R = QQ['x']; R
```

```sage
q = R(p); q
```

```sage
factor(R(p))
```

In this new context, the factorization is again unambiguous, yet different from the previous one. Note in passing that Sage knows $R$ is a Euclidean domain:

```sage
R.category()
```

and therefore, in particular, a unique factorization domain.

Let us now look for a complete factorization over the complex numbers. A first option is to allow a numerical approximation of complex numbers with 16 bits of precision:

```sage
R = ComplexField(16)['x']; R
```

```sage
q = R(p); q
```

```sage
factor(R(p))
```

Another option is to slightly extend the field of rational numbers; here, we will adjoin $\sqrt{2}$.

```sage
R = QQ[sqrt(2)]['x']; R
```

```sage
q = R(p); q
```

```sage
factor(R(p))
```

Finally, perhaps we want the coefficients to be considered modulo 5?

```sage
R = GF(5)['x']; R
```

```sage
q = R(p); q
```

```sage
factor(R(p))
```

```sage
PolynomialRing?
```

## Euclidian algorithm intermediate coefficients growth

```sage
R.<x> = QQ[]
A = sum(randint(-999, 999)*x^i for i in range(5))
B = sum(randint(-999, 999)*x^i for i in range(5))
A = A / A.leading_coefficient()
B = B / B.leading_coefficient()
A, B
```
```sage
def Euclid(a, b):
    res = [a, b]
    while b != 0:
        a, b = b, a % b
        if b != 0: 
            b = b / b.leading_coefficient()
            res.append(b)
    return res
```

```sage
Euclid(A, B)

```









## Code Files
- [poly.py](poly.py)
- ...


## Running the Tests

```sage
!sage -t poly.py
```

## Example of Polynomial Calculations

```sage
%run poly.py
```

```sage
X = PolyDense.X()
```

```sage
P = X^5*(5/2) + X^2*3 + 5; P
```

```sage
P^5
```

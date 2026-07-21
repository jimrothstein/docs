// ubses noteworthy !
#import "@preview/noteworthy:0.2.0": *

/*   410_typst_MATH_notes.typ

Put all typst notes HERE.
Also check ~/code/publish_project/typst/  for more typst examples.

- a*b  (no spaces around *)

A#sub(long_subscript)
*/


#show: noteworthy.with(
  paper-size: "a4",
  font: "New Computer Modern",
  language: "EN",
  title: "Title of The Document",
  author: "Your Name",
  contact-details: "https://example.com", // Optional: Maybe a link to your website, or phone number
  toc-title: "Table of Contents",
  watermark: "DRAFT", // Optional: Watermark for the document
)

// Write here

#set document(title: "0002_math_equations")
#set page(margin: 0.5in)
#set text(size: 11pt)

// Goal: Combine math, linear algebra, statistics, ML (not R)

Goal: Combine math, linear algebra, statistics, ML (not R)

= REF:
See: #link("https://github.com/jimrothstein/code_publish/blob/master/MATH/0002_math_equations.qmd")

= use noteworthy
#example[
  3,5,7
]

== set notation
$
{(x,y) | f(x)/g(x) = 1 
$

#definition[
  a prime number has two divisors, 1 and itself.
]

== Notation
$
alpha in KK \

a dot (b+c) \

bb(A), AA, bb(1) \
$


= Tangent Line

Given a function, f find tangent line at point $(x_0, y_0)$

== Equation of Line

$y=m*x + b$

The slope of line at point P is, by definition, 
$(y-y_0)/(x-x_0) = m$

From calculus, we know slope is equal to
$m = f(x_0)$

Thus m is now known.

== Line through origin, parallel to tangent

$y = m*x$

== Line through $x_0$, parallel to tangent 
$y = m(x - x_0)$

== The tangent line, through $(x_0, y_0)$

$y = m(x - x_0) + f(x_0)$

= "Linear Algebra"
== "Normal Equations, solution which minimizes error (regression)"

$
F(x,y,z) = 3*x + 4*y + 5*z
$

== "Matrix multiplication"
#example[
  3,5,7
]

#definition[
  a prime number has two divisors, 1 and itself.
]


$
mat(3,4,5) #sym.dot.op vec(x,y,z)
$


== Linear transformation

Suppose point P lies (1,1) in x-y plane, a distance of $sqrt(2)$ from origin.
Write P in terms of natural basis parallel to ray to P.

In regular basis,

$
P : vec(1,1)#sub("old") = vec(1,0)#sub("old") + vec(0,1)#sub("old")
$

In "natural" basis,
$
vec(1,0)#sub("new") = 1/sqrt(2)*vec(1,0) + 1/sqrt(2)*vec(0,1) \
$


Tranformation matrix: (wrong !)

$
1/sqrt(2) mat(1,0; 0, 1)
$



== "Error"

Suppose true function is quadratic and we model as linear. In most regions error is large and consistently large. Is this error *bias*? a failure of the model?

Noise?
use *averaging* to minimize

"2024-05-04 Sat":
- vector means 'direction' and 'magnitude' (no coordinate system).
  With this DEF, 2 vectors are the *same* if have same direction and
  magnitude. (Translation seems implicit; but we have no coordinate
  system)

== Law of Large Numbers

$ bar(x) $

As sample size increases, approach $mu$
$lim_(n -> infinity) bar(x) = mu$

== But CLT

for any n, compare mean of many k samples will approach $mu$ much faster


// lim_(k -> oo) (bar(x_k)) = n*mu


---

/*
$
SS_(x) = sum (x - bar(x))^2 = sum x^2 - ( (sum x)^2 ) / n
$
*/

---

== Gamma Function
- (intution) #link("https://www.youtube.com/watch?v=Qjeswpm0cWY")
  - Consider $0!$, $1!$, $2!$ ... Plot; What would $pi!$ $0.5!$
- In other words, find the function that fits all integers of $x$, but works for any $x$ real.

---

== Bayes
- Video, Ox series: #link("https://youtu.be/U1HbB0ATZ_A?si=ljknvvraM7Fn4hz3")

=== $P(A|B)$
We are told $x in B$.  What is probability $x in A$?

To be in A, $x in A inter B$.   But this depends on relative "sizes"

Compare:   $x in A inter B$  relative to $x in B$, ie anywhere  B
Hence   $P(A inter B)/P(B)$

== Explain $s^2$ vs $hat(sigma)^2$

$s^2$ refers to sample variance
$(1 / N) sum_n (x - bar(x))^2$

$hat(sigma)^2$ refers to population variance estimator

$s^2$ is biased (toward values closer to mean). And if $N=1$, $s^2$ we get $0$, hardly believable population variance.
(The reason is subtle, when $N$ is small odds are it will not capture enough of outliers. SEE LSR)

== Summation

/*
$sum_(k=1)^n x_k$

*/

$x = sqrt(b)$

If $a^2=b$ and $b=2$, then the solution must be
either $a = +sqrt(2)$ or $a = -sqrt(2)$.


== Probability Space, Algebra, function
Sample Space is set of atomic events:   throw 2 die, list all possible outcomes.
Algebra is all possible subsets of the space.  Ex:  sets s.t. dice total to 4.
By event, we do not retrict to just singular.  The event in previous example is dice total to 4.   This might be several atomic sets, but it is ONE event.

$
//Pr(2 dice total = 4);    need to write Pr( total = 4)
$

One way to look at probability is ratio of size of the subset (event)
vs total allowable subspace (all possible events).  Related: If there
are many possibilities for same outcome, expect the actual event
probably to grow: Birthday at Party: Many possibilities n\*(n-1) for
match.  This is why so few actual people are needed to raise odds.



== linear functional

$phi : R^3 -> R$
$phi(v) = 4 dot x - 5 dot y + 2 dot z$

== Entropy

*entropy, information* $ H(X) $
Better to find information about a variable that very uncertain, against variable more predictable

REF: #link("https://archive.org/details/elementsofinform0000cove_l9p7")

Given a random variable $X$, what is amount of *surprise* when learning value of $X$?
The definition:

is chosen because it has *nice* properties that we expect of *information*.

$X$ is discrete random variable
try $H$, $T$ each prob = 1/2

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $


cal(P)(X) = $ sum_(i=1)^n p(x)*log(p(x)) $

$cal(P)(X) = sum_(i=1)^n p(x)*log(p(x)) $

"double-struck(P) = -"

Example:

How many binary questions need to ask?
 Prob(X) = a (1/2), b(1/4), c(1/4) 

double-struck(P)

$ cal(P) $

double-struck(P)

$ P[ ] $

 Prob(x) = cases(
  -x, "if " x < 0,
  0, "if " x = 0,
  x, "if " x > 0,
) 

$
cal(P)(X) = cases(
  a, 1/2,
  a, "if " x < 0,
  b, "if " x = 0,
  c, "if " x > 0,
)
$

sums, regression

// R code chunks (setup and library omitted as R-specific)



// R code for plotting (converted to a Typst code block)
```r
density_object = density(mpg\$hwy)
pdf("~/Downloads/print_and_delete/out.pdf")
plot(density_object)
dev.off()
```

```r
filename = "~/Downloads/print_and_delete/out.png"
png(filename = filename,
  width = 480, height = 480, units = "px", pointsize = 12)
plot(density_object)
dev.off()
```

\\ /home/jim/code/docs/tech_notes/500_ML_Notes.qmd
\\ /home/jim/code/docs/tech_notes/


= ML Notes

== Logistic Regression
- Using data, tune a model parameters of logistic equation to predict probabilities (ex: horse racing !)
  Compare to ACTUAl output (win or loss) to do the tweeking. If your accuracy exceeds the Bookie (who introduces bias, to make money.) You can win!

== Bayes Thm
- Compare performance of difference models


== Log Normal
Note:
// log(1 + e) tilde.equiv e   
for small e

Ex:  Consider yearly growth rates of many companies.  Growth rates vary by company and by year, usually small, and independent:

\\ Y(t + 1 ) = Y( t )\*(1 + e), where is small, varies by year, by company.

Take log:   log(Y) = log(Y) +  many e
Claim:  sum of many small independent e become Normal

= tensor
example: (intuition only)  Consider cube, with different stress on each side.  For each side, the stress can be a Matrix M times vector in 3 directions.  M*v. So need 3 matrices.  Tensor is more compact way to say this.

#line(length: 100%)

= What is derivative?
dy/dx is *symbol*, just *notation*
- no meaning by itself, "derivative"
- forget infinitesimals; surreal numbers
- dx, dy are NOT limit of $Delta x, Delta y$; not fraction; no division

- dy/dx is symbol for 

$ 
 lim (h-> 0) (f(x+h) - f(x))/h 
$


- More modern: dx is differential form or co-vector a function that
  takes a tangent vector and returns scalar, which is magnitude of
  tangent vector in x-direction


f: R^2 - R


== Tangent Line in 1 dimension

For a function $f(x)$, the tangent line at $x = a$ is:

$ y = f(a) + (dif f)/(dif x) \|_(x=a) dot (x - a) $

== Tangent Plane in 2 dimensions

In 2 dimensions, $z = f(x,y)$, we find the tangent plane near $(a,b,f(a,b))$ as follows:

$ z = f(a,b) + (partial f)/(partial x) \|_((x,y)=(a,b)) dot (x - a) + (partial f)/(partial y) \|_((x,y)=(a,b)) dot (y - b) $


== Likelihood (https://bookdown.org/roback/bookdown-BeyondMLR/ch-beyondmost.html#case-study-does-sex-run-in-families) 
$ P(D, p)$
D = Data (have)
p = param (unknown)

-Data = known
-Distribution type - known
-Unknown = parameter for Distribution that explains the data
-Goal:  Choose parameter st most consistent with data.

-Example Data, in a village, number/order of children (B, G, GG ?) and
 number of families. (not measure probabity of having one boy; p is NOT random variable)  Look at
 outcomes across village: how to explain? )

Find best $p_b$ the probability of one boy  $(1-p_b)$ for each girl
Once we have all the data, the likihood is expression  $ p_b^30 * (1-p_b)^20  $
Plot, take derivative ... gives $ p_b $ = 0.60
*This p is where the likihood is maximized* (explains observed data, the best)

== "Laplace Transform, convolution"

- laplace, many nice propeties.
- convolution of f,g becomes multiplication in freq domain; inverse is solution to original.

if f(t) is prob density

$
L{f}(s)
$

$
integral_0^infinity f(t)*e^(-s)
$



$
integral_0^infinity f(t)e^-s
$
identify this as $ E[ e-"tX"]
$

$ integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2 $


== Notes from gr-teachO
=== Gradient of $f=x*y + 4y - 3x^2 - y^2$

Suppose this represents a surface with a minimum/maximum.
Project onto the x-y axis and ask for a point $x_0$ = $(1,-1)$ find the vector that points toward min/max.

Method #1  Take gradient

$gradient f$ evaluated at $x_0$ will give us vector pointing to min/max

$gradient f(arrow(x), arrow(y))$ 

#import "@preview/diverential:0.2.0": *

$vec(dv(f,x, eval:0),(dv(f,y, eval:0)))$ =
$vec(-7,7)$
(reverse the sign, to find min)

= Calculus
== Compare derivative in 1D vs 2D
curve (1D)  in $R^2$

$
f: RR -> RR
$
direction (only left/right, or no change)
point at x
point at x + h  (where h small, points are near)

so

$f(x)$ and $f(x + h)$ are both scalar.

// does not like lim
// $display(lim_(h-> 0) (f(x+h) - f(x))/h) $


But in 2D
surface (2D) in $R^3$
directions now infinite
point at  $vec(x)$
2nd point a $vec(x +  s, y + r)$


$
f: RR^2 -> RR
$

== Principal Axis Thm
- generalize major/minor axes of ellipse
- these axes are perpendicular
- tells you how to find these axes
- no cross terms

=== Exampe: Ellipse, hyperbola

principal axes are x,y
$
x^2/9 + y^2/25 = 1
$

$
x^2/9 - y^2/25 = 1
$

===  Ellipse or Hyperbola

$ 5*x^2 + 8*x*y + 5*y^2 = 1 $


Complete the square, using u(x,y), v(x,y)
- if sum, then ellipse
- if difference, then hyperbola

// Hint:  Consider $ l_1*c_1**2 + l_2*c_2^2 $   Find the eigenvalues for l; then eigenvectors for c
// c_1 and c_2 are functions of (x,y)

Matrix formulation:
Q(x,y) = [x y](5 4)[x y]^T = 1
               4 5
== Summations
// Without Indices

$sum x_i$

$sum x_i^2$

$sum x_i y_i$

// With Indices - Display Form

$sum_(i=1)^n x_i y_i$

== Independent Samples

$mu_(bar(x)_1 - bar(x)_2) = mu_1 - mu_2$
$sigma_(bar(x)_1 - bar(x)_2)^2 = frac(sigma_1^2, n_1) + frac(sigma_2^2, n_2)$
$mu_(hat(p)_1 - hat(p)_2) = p_1 - p_2$

$sigma_(hat(p)_1 - hat(p)_2)^2 = frac(p_1 (1 - p_1), n_1) + frac(p_2 (1 - p_2), n_2)$
== Chi-Square Test

$chi^2 = sum frac((O - E)^2, E)$
== Correlations

$SS_(x) = sum (x - bar(x))^2 = sum x^2 - frac((sum x)^2, n)$

$SS_(x, y) = sum (x - bar(x))(y - bar(y)) = sum x*y - frac((sum x)(sum y), n)$

$r = frac(SS_(x*y), sqrt(SS_(x*x) SS_(y*y)))$

== Regression

// Population Regression Line

$E(y) = alpha + beta x$
var(y) = sigma^2

// Least Squares Line

hat(y) = a + bx

where

b = frac(SS_(xy), SS_(xx))

and

$bar(y) = a + b bar(x)$

== Is this a line in 3D?

$ a x + b y + c z + d = 0 $

Are all quadratics equivalent to a conic section?

$ x^2 - y^2 - 2 y - 1 = 0 $

NO. This represents two lines. Factor as $ (x + y + 1)(x - y - 1) = 0 $

Lines: $y = x - 1$ and $y = -x - 1$.

== cetz.plot to plot!!

#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot 

#cetz.canvas({

  let range = (-3, 3)
  
  plot.plot(
    size: (6, 4), 
    x-tick-step: 1, 
    y-tick-step: 1, 
    {
      plot.add(
        domain: range, 
        x => x - 1,
        style: (stroke: blue)
      )
      plot.add(
        domain: range, 
        x => -x - 1,
        style: (stroke: red)
      )
    }
  )
})

== Can a line and surface intersect?

Here is how to present a line in 3D:

$ x = a + t u $
$ y = b + t v $
$ z = c + t w $

$t$ is a parameter. The surface is $F(x, y, z) = 0$.

The intersection becomes a polynomial in $t$, $ sum a_i t^i = 0 $.

But for $n > 4$, may not be closed form.

Numerical: as line approaches tangent, floating point error may prevent solution.

= Measure Theory Foundation of Probability

== Probability Space

#definition[
  A *probability space* is a triple $(Omega, cal(F), P)$:
  - $Omega$: *sample space* (set of all possible outcomes)
  - $cal(F)$: *sigma-algebra* on $Omega$ (the set of events)
  - $P$: *probability measure* $P : cal(F) -> [0,1]$
]

=== Sigma-Algebra

A *sigma-algebra* (or sigma-field) $cal(F)$ on a set $Omega$ is a collection of subsets of $Omega$ such that:
- $emptyset in cal(F)$ and $Omega in cal(F)$
- If $A in cal(F)$ then $A^c in cal(F)$ (closed under complement)
- If $A_1, A_2, ... in cal(F)$ then $union_(i=1)^infinity A_i in cal(F)$ (countable union)

The pair $(Omega, cal(F))$ is a *measurable space*.

The *Borel sigma-algebra* $cal(B)(bb(R))$ is the smallest sigma-algebra on $bb(R)$ containing all open intervals. It is the standard choice for real-valued random variables.

=== Probability Measure

A function $P : cal(F) -> [0,1]$ is a *probability measure* if:
1. $P(Omega) = 1$
2. For pairwise disjoint $A_1, A_2, ... in cal(F)$:
$P(union_(i=1)^infinity A_i) = sum_(i=1)^infinity P(A_i)$ (countable additivity)

== Random Variable

#definition[
  A *random variable* $X$ is a measurable function:
  $X : (Omega, cal(F)) -> (bb(R), cal(B)(bb(R)))$
  i.e. for every Borel set $B in cal(B)$, the preimage is an event:
  $X^(-1)(B) in cal(F)$
]

== Distribution and CDF

The *distribution* (or *law*) of $X$ is the pushforward probability measure on $bb(R)$:
$P_X (B) = P(X in B) = P(X^(-1)(B))$ for all $B in cal(B)(bb(R))$

The *cumulative distribution function (CDF)* is:
$F_X (x) = P_X((-infinity, x]) = P(X <= x)$

Properties: $F_X$ is non-decreasing, right-continuous, with limits $0$ at $-infinity$ and $1$ at $infinity$.

== Density as Radon-Nikodym Derivative

If $P_X$ is absolutely continuous w.r.t. Lebesgue measure $lambda$, the Radon-Nikodym theorem gives a density:
$f(x) = (dif P_X) / (dif lambda)(x)$ such that
$P_X (B) = integral_B f(x) dif x$ for all $B in cal(B)(bb(R))$

For discrete $X$, the PMF is the Radon-Nikodym derivative w.r.t. counting measure.

== Expectation as Lebesgue Integral

#definition[
  $E[X] = integral_Omega X(omega) dif P(omega)$
]

This single integral unifies:
- Discrete: $E[X] = sum_k x_k P(X = x_k)$
- Continuous: $E[X] = integral_(-infinity)^infinity x f(x) dif x$

== Why Measure Theory

- Rigorous limits: LLN and CLT rely on convergence theorems (Monotone Convergence, Dominated Convergence, Fatou)
- Sigma-algebras model *information*: filtrations for martingales, stopping times, stochastic processes
- Conditional expectation defined via Radon-Nikodym / $L^2$ projection
- Handles mixed, singular, and infinite-dimensional distributions

=== Non-Nice but Measurable PDF Examples

These examples show that measurability, not continuity or Riemann integrability, is the essential requirement for a valid PDF.

==== Example 1: Discontinuous on a set of positive measure

Let $C subset [0,1]$ be a *fat Cantor set*: nowhere dense, positive Lebesgue measure (say $lambda(C) = 1/2$).

$f(x) = 2 * I_C (x)$, for $x in [0,1]$

- $I_C$ is Borel measurable (C is Borel), so $f$ is measurable
- $integral_0^1 f(x) dif x = 2 lambda(C) = 1$, valid PDF
- $f$ is *nowhere continuous* (every point of $C$ is a boundary point), discontinuous on a set of positive measure
- Not Riemann integrable, but perfectly Lebesgue integrable

==== Example 2: Mixed distribution with an atom

$X = B * Z$ where $B tilde "Ber"(1/2)$ and $Z tilde N(0,1)$.

PDF w.r.t. dominating measure $mu = lambda + delta_0$ (Lebesgue + point mass at 0):

$f(x) = 1/2 delta_0 (x) + 1/2 * 1 / sqrt(2 pi) e^(-x^2 / 2)$

- Measurable; $mu$ is a sigma-finite measure
- Has a point mass at 0; not absolutely continuous w.r.t. Lebesgue alone
- Useful for zero-inflated models (spike at zero + continuous tail)

==== Example 3: Unbounded, integrable singularity

$f(x) = 1 / (2 sqrt(|x|)) I_([-1, 0) union (0, 1]) (x)$

- Measurable
- $integral_(-1)^1 f(x) dif x = 1$, valid PDF
- $f(x) -> infinity$ as $x -> 0$, but the singularity is Lebesgue integrable
- Not properly Riemann integrable (unbounded), but is improperly Riemann integrable and Lebesgue integrable

Key lesson: measurability is the only requirement for a valid PDF. Continuity, boundedness, and Riemann integrability are *not* necessary — and many useful distributions violate them.

= Linear Algebra (Zero Divisors / Non-trivial Nullspace)

$
A = mat(1,-1; 2,-2),\
v = vec(1,1)
$

$A v = 0$ where neither $A$ nor $v$ is zero.

- A is *singular*: $det(A) = 0$, i.e. non-invertible.
- $v$ lies in the **nullspace** (kernel) of $A$.
- This is a **zero divisor** in the ring of matrices: matrix rings are *not* integral domains because they have non-trivial zero divisors.
- An *integral domain* is a ring where `$ab = 0$` implies $a = 0$ or $b = 0$ — matrix rings violate this.

 title List available models
from google.colab import ai

response = ai.generate_text("Explain integral domain in algebra, give simple example.   Output should be in typst format")

print(response)
 `@title` List available models
from google.colab import ai

ai.list_models()
response = ai.generate_text("Explain integral domain in algebra, give simple example.   Output should be in typst  format")
print(response)

Here is a clear and concise explanation of an integral domain in abstract algebra, formatted for Typst. 

You can save the code below with a `.typ` extension (e.g., `integral_domain.typ`) and compile it using the Typst compiler.

```typ
#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "Liberation Serif", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[Integral Domains in Algebra]
]

#v(1cm)

In abstract algebra, an *integral domain* is a special kind of ring that behaves very much like the familiar system of integers. It is a algebraic structure where multiplication is well-behaved, specifically because it lacks "zero divisors."

== Definition

A ring $(R, +, *)$ is called an *integral domain* if it satisfies the following four properties:

1. *Commutativity:* Multiplication is commutative. For all $a, b in R$,
   $a * b = b * a$

2. *Identity:* There exists a multiplicative identity element, typically denoted as $1$ (where $1 != 0$). For all $a in R$,
   $a * 1 = a$

3. *No Zero Divisors:* The ring has no non-zero elements that multiply to give zero. That is, if $a, b in R$ and
   $a * b = 0$
   then either $a = 0$ or $b = 0$ (or both).

4. *Associativity and Distributivity:* Like all rings, multiplication is associative, and multiplication distributes over addition.

#block(
  fill: rgb("f0f8ff"),
  inset: 12pt,
  radius: 4pt,
  stroke: 0.5pt + rgb("b0c4de"),
[
  *Key Takeaway:* In an integral domain, you can perform *cancellation*. If $a != 0$ and $a * b = a * c$, you can safely conclude that $b = c$. This is not true in all rings!
]
)

== The Standard Example: The Integers ($ZZ$)

The most intuitive example of an integral domain is the set of integers, denoted by $ZZ = {..., -3, -2, -1, 0, 1, 2, 3, ...}$, under normal addition and multiplication.

Let's check the properties:
- *Commutative ring with identity:* Yes, $a times b = b times a$, and the number $1$ acts as the identity ($a times 1 = a$).
- *No Zero Divisors:* If you multiply two integers and get $0$ (i.e., $a times b = 0$), it is physically impossible for both $a$ and $b$ to be non-zero. At least one of them *must* be $0$.

Thus, $(ZZ, +, times)$ is an integral domain.

== A Counter-Example (Not an Integral Domain)

To understand integral domains, it helps to see a ring that is *not* one. Consider the ring of integers modulo 6, denoted as $ZZ_6 = \{0, 1, 2, 3, 4, 5\}$.

In $ZZ_6$, arithmetic is performed modulo 6 (you divide by 6 and take the remainder).
Look at the elements $2$ and $3$. Neither of them is zero ($2 != 0$ and $3 != 0$). However, if we multiply them:

$ 2 * 3 = 6 equiv 0 quad (mod 6) $

Because $2 * 3 = 0$ in this ring, $2$ and $3$ are called *zero divisors*. 

Since $ZZ_6$ contains zero divisors, **$ZZ_6$ is not an integral domain.**

== Summary of Common Integral Domains

- $ZZ$ (The Integers)
- $QQ$ (The Rational Numbers)
- $RR$ (The Real Numbers)
- $CC$ (The Complex Numbers)
- Any polynomial ring $R[x]$ where $R$ is an integral domain (e.g., $ZZ[x]$)
```

=== Features of this Typst markup:
- It uses standard Typst math notation (e.g., `$a * b = b * a$`).
- It structures the explanation with headings (`==`).
- It includes a highlighted "Key Takeaway" box using Typst's `#block` function for visual clarity.
- It provides both a positive example `($\mathbb{Z}$)` and a negative example `($\mathbb{Z}_6$)` to make the concept easy to digest.

#set document(title: "0002_math_equations")
#set page(margin: 0.5in)
#set text(size: 11pt)

// Goal: Combine math, linear algebra, statistics, ML (not R)
Goal: Combine math, linear algebra, statistics, ML (not R)

== REF:
See: #link("https://github.com/jimrothstein/code_publish/blob/master/MATH/0002_math_equations.qmd")

== Error

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

$lim_(k -> infinity) bar(x_k) = n * mu$

---

$SS_(x) = sum (x - bar(x))^2 = sum x^2 - ( (sum x)^2 ) / n$

---

== Gamma Function
- (intution) #link("https://www.youtube.com/watch?v=Qjeswpm0cWY")
  - Consider $0!$, $1!$, $2!$ ... Plot; What would $pi!$ $0.5!$
- In other words, find the function that fits all integers of $x$, but works for any $x$ real.

---

== Bayes
- Video, Ox series: #link("https://youtu.be/U1HbB0ATZ_A?si=ljknvvraM7Fn4hz3")

== Explain $s^2$ vs $hat(sigma)^2$

$s^2$ refers to sample variance
$(1 / N) sum_n (x - bar(x))^2$

$hat(sigma)^2$ refers to population variance estimator

$s^2$ is biased (toward values closer to mean). And if $N=1$, $s^2$ we get $0$, hardly believable population variance.
(The reason is subtle, when $N$ is small odds are it will not capture enough of outliers. SEE LSR)

$sum_(k=1)^n x_k$

$x = sqrt(b)$

If $a^2=b$ and $b=2$, then the solution must be
either $a = +sqrt(2)$ or $a = -sqrt(2)$.

== linear functional

$phi : R^3 -> R$
$phi(v) = 4 dot x - 5 dot y + 2 dot z$

== Entropy

*entropy, information* $ H(X) $

REF: #link("https://archive.org/details/elementsofinform0000cove_l9p7")

Given a random variable $X$, what is amount of *surprise* when learning value of $X$?
The definition:

is chosen because it has *nice* properties that we expect of *information*.

$X$ is discrete random variable
try $H$, $T$ each prob = 1/2

$cal(P)(X) = sum_(i=1)^n p(x) log(p(x))$

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

$ cal(P)(X) = cases(
  a, 1/2,
  a, "if " x < 0,
  b, "if " x = 0,
  c, "if " x > 0,
) $

sums, regression

// R code chunks (setup and library omitted as R-specific)

---

hello _world_.

== Summations

```
// Without Indices

$sum x_i$

$sum x_i^2$

$sum x_i y_i$

// With Indices - Inline Form

$sum_(i=1)^n x_i$

$sum_(i=1)^n x_i^2$

$sum_(i=1)^n x_i y_i$

// With Indices - Display Form

$sum_(i=1)^n x_i y_i$

== Independent Samples

$mu_(bar(x)_1 - bar(x)_2) = mu_1 - mu_2$

$sigma_(bar(x)_1 - bar(x)_2)^2 = frac(sigma_1^2, n_1) + frac(sigma_2^2, n_2)$

$mu_(hat(p)_1 - hat(p)_2) = p_1 - p_2$

$sigma_(hat(p)_1 - hat(p)_2)^2 = frac(p_1 (1 - p_1), n_1) + frac(p_2 (1 - p_2), n_2)$

== Pooled Sample Variance

$s_p^2 = frac((n_1 - 1)s_1^2 + (n_2 - 1)s_2^2, n_1 + n_2 - 2)$

== Pooled Sample Proportion

$hat(p) = frac(n_1 hat(p)_1 + n_2 hat(p)_2, n_1 + n_2)$

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

// Residual Sum of Squares

SS_(Resid) = sum (y - hat(y))^2 = sum y^2 - a sum y - b sum xy

// Standard Errors

$s_e = sqrt(frac(SS_(Resid), n - 2))$

$s_b = frac(s_e, sqrt(SS_(xx)))$

$s_(a + bx) = s_e sqrt(1 + frac(1, n) + frac((x - bar(x))^2, SS_(xx)))$

for prediction:

$se(y - hat(y)) = s_e sqrt(1 + frac(1, n) + frac((x - bar(x))^2, SS_(xx)))$

== Variance

$SS_(Tr) = frac(T_1^2, n_1) + frac(T_2^2, n_2) + ... + frac(T_k^2, n_k) - frac(T^2, n)$

$SS_(To) = x_1^2 + x_2^2 + ... + x_k^2 - frac(T^2, n)$

$SS_(E) = SS_(To) - SS_(Tr)$
```

```
// R code for plotting (converted to a Typst code block)
#raw(lang: "r"){
density_object = density(mpg\$hwy)
pdf("~/Downloads/print_and_delete/out.pdf")
plot(density_object)
dev.off()
}

#raw(lang: "r"){
filename = "~/Downloads/print_and_delete/out.png"
png(filename = filename,
  width = 480, height = 480, units = "px", pointsize = 12)
plot(density_object)
dev.off()
}
```
/home/jim/code/docs/tech_notes/500_ML_Notes.qmd
/home/jim/code/docs/tech_notes/

= ML Notes

== Logistic Regression
- Using data, tune a model parameters of logistic equation to predict probabilities (ex: horse racing !)
  Compare to ACTUAl output (win or loss) to do the tweeking. If your accuracy exceeds the Bookie (who introduces bias, to make money.) You can win!

== Bayes Thm
- Compare performance of difference models


== Log Normal
Note:  log(1 + $e$) is $e$, for small e

Ex:  Consider yearly growth rates of many companies.  Growth rates vary by company and by year, usually small, and independent:

Y(t + 1 ) = Y( t )*(1 + e), where is small, varies by year, by company.

Take log:   log(Y) = log(Y) +  many e
Claim:  sum of many small independent e become Normal
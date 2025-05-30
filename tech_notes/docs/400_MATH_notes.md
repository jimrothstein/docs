jim
2023-12-20

title: “400_MATH_notes.rmarkdown” date: “last updated 29 May 2025”
format: html_document:  
code_folding: show toc: true toc_depth: 2 toc_float: true
pdf_document:  
latex_engine: lualatex toc: true toc_depth: 2  
fontsize: 11pt  
geometry: margin=0.5in,top=0.25in  
—

<!--   Leave as .qmd file -->

<div class="shadowbox">

Goal: Combine math, linear algebra, statistics, ML (not R)

</div>

### REF: See: https://github.com/jimrothstein/code_publish/blob/master/MATH/0002_math_equations.qmd

### Error

Suppose true function is quadratic and we model as linear. In most
regions error is large and considstently large. Is this error `bias`? a
failure of the model?

Noise? use `averaging` to minimize

\<2024-05-04 Sat\>:

- vector means ‘direction’ and ‘magnitude’ (no coordinate system). With
  this DEF, 2 vectors are the *same* if have same direction and
  magnitude. (Translation seems implicit; but we have no coordinate
  system)

### Law of Large Numbers

$$\bar{x}$$

As sample size increases, approach $\mu$
$$\lim_{n \to \infty}{\bar{x}} =  \mu$$

### But CLT

for any n, compare mean of many k samples will approach $\mu$ much
faster

$$\lim_{k \to \infty}{\bar{x_k}} = n * \mu$$

------------------------------------------------------------------------

$${SS}_{xx} = \sum (x - \bar{x})^2 = \sum x^2 - \frac {(\sum x)^2}{n}$$

------------------------------------------------------------------------

Gamma Function - (intution)
https://www.youtube.com/watch?v=Qjeswpm0cWY - Consider 0!, 1!, 2! …
Plot; What would pi! .5! - In other words, find the function that fits
all integers of x, but works for any x real.

\*\*\* Bayes - Video, Ox series:
https://youtu.be/U1HbB0ATZ_A?si=ljknvvraM7Fn4hz3

\*\*\* Explain ( s^2 ) vs ( ^2 )

( s^2 ) refers to sample variance ( \_n(x-{x})^2 )

( ^2 ) refers to population variance estimator

(s^2) is biased (toward values closer to mean). And if N=1, (s^2) we get
0, hardly believable population variance. (The reason is subtle, when N
is small odds are it will not capture enough of outliars. SEE LSR)

\$ \_{k=1}^{n}x_k \$

If $a^2=b$ and ( b=2 ), then the solution must be either
$$ a=+\sqrt{2} $$ or \[ a=- \].

### linear functional

$\phi: R^3 -> R$  
$\phi(v) = 4*x -5*y + 2*z$

### Entropy

**entropy, information** $H$(X)

REF: https://archive.org/details/elementsofinform0000cove_l9p7

Given a random variable X, what is amount of `suprise` when learning
value of X? The definition:

is chosen because it has `nice` properties that we expect of
`information`.

X is discrete random variable try H, T each prob = 1/2

$$
\begin{equation}
  \mathcal{P(X)} = \sum {i=1}^n p(x)log(p(x))
  \end{equation}
  $$

$$
\begin{equation}
 \mathbb{P} = - \
\end{equation}
$$ Example:

How many binary questions need to ask? prob(X) = a (1/2), b(1/4), c(1/4)

$\mathbb{P}$  

$\mathcal{P}$

$$
\begin{equation}
 \mathbb{P} 
\end{equation}
$$

$$
\begin{equation*}
Prob(x) =
\begin{cases}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{cases}
\end{equation*}
$$

$$
\begin{equation*}
\mathcal{P}(X) =
\begin{cases}
a & \frac {1}{2},  \\
a & \text{if } x < 0,\\
b & \text{if } x = 0,\\
c & \text{if } x > 0.
\end{cases}
\end{equation*}
$$

sums, regression

**SEE 0004** for adding dependencies to YAML.

------------------------------------------------------------------------

hello $\emph{world}$.

### Summations

### Without Indices

$\sum x_{i}$

$\sum x_{i}^2$

$\sum x_{i}y_{i}$

#### With Indices - Inline Form

$\sum_{i=1}^n x_{i}$

$\sum_{i=1}^n x_{i}^2$

$\sum_{i=1}^n x_{i}y_{i}$

#### With Indices - Display Form

$$\sum_{i=1}^n x_{i}y_{i}$$

### Independent Samples

$$\mu_{\bar{x_{1}} - \bar{x_{2}}} = \mu_{1} - \mu_{2}$$

$$\sigma_{\bar{x_{1}} - \bar{x_{2}}}^2 = \frac {\sigma_{1}^2}{n_{1}} + \frac{\sigma_{2}^2}{n_{2}}$$

$$\mu_{\hat{p}_{1} - \hat{p}_{2}} = p_{1} - p_{2}$$

$$\sigma_{\hat{p}_{1} - \hat{p}_{2}}^2 = \frac {p_{1}(1 - p_{1})}{n_{1}} + \frac {p_{2}(1 - p_{2})}{n_{2}}$$

### Pooled Sample Variance

$$s_{p}^2 = \frac {(n_{1} - 1)s_{1}^2 + (n_{2} - 1)s_{2}^2}{n_{1} + n_{2} - 2}$$

### Pooled Sample Proportion

$$\hat{p} = \frac {n_{1}\hat{p}_1 + n_{2}\hat{p}_{2}}{n_{1} + n_{2}}$$

### Chi-Square Test

$$\chi^2 = \sum \frac {(O - E)^2}{E}$$

### Correlations

$${SS}_{xx} = \sum (x - \bar{x})^2 = \sum x^2 - \frac {(\sum x)^2}{n}$$

$${SS}_{xy} = \sum (x - \bar{x})(y - \bar{y}) = \sum xy - \frac {(\sum x)(\sum y)}{n}$$

$$r = \frac {{SS}_{xy}}{\sqrt {{SS}_{xx}{SS}_{yy}}}$$

### Regression

#### Population Regression Line

$$E(y) = \alpha + \beta{x}$$

$$var(y) = \sigma^2$$

#### Least Squares Line

$$\hat{y} = a + bx$$

where

$$b = \frac {{SS}_{xy}}{{SS}_{xx}}$$

and

$$\bar{y} = a + b\bar{x}$$

#### Residual Sum of Squares

$$SSResid = \sum (y - \hat{y})^2 = \sum y^2 - a\sum y - b \sum xy$$

#### Standard Errors

$$s_{e} = \sqrt \frac {SSResid}{n - 2}$$

$$s_{b} = \frac {s_{e}}{\sqrt {{SS}_{xx}}}$$

$$s_{a + bx} = s_{e} \sqrt {1 + \frac {1}{n} + \frac {(x - \bar{x})^2}{{SS}_{xx}}}$$

for prediction:

$$se(y - \hat{y}) = s_{e} \sqrt {1 + \frac {1}{n} + \frac {(x - \bar{x})^2}{{SS}_{xx}}}$$

### Variance

$$SSTr = \frac {T_{1}^2}{n_{1}} + \frac {T_{2}^2}{n_{2}} + ... + \frac {T_{k}^2}{n_{k}} - \frac {T^2}{n}$$

$$SSTo = x_{1}^2 + x_{2}^2 + ... + x_{k}^2 - \frac {T^2}{n}$$

$$SSE = SSTo - SSTr$$

``` r
density_object <- density(mpg$hwy)
pdf("~/Downloads/print_and_delete/out.pdf")
plot(density_object)
dev.off()
```

``` r
filename  <- "~/Downloads/print_and_delete/out.png"
png(filename = filename,
         width = 480, height = 480, units = "px", pointsize = 12)
plot(density_object)
dev.off()
```

/home/jim/code/docs/tech_notes/500_ML_Notes.qmd
/home/jim/code/docs/tech_notes/

## ML Notes

### Logistic Regression

- Using data, tune a model parameters of logistic equation to predict
  probabilities (ex: horse racing !) Compare to ACTUAl output (win or
  loss) to do the tweeking. If your accuracy exceeds the Bookie (who
  introduces bias, to make money.) You can win!

### Bayes Thm

- Compare performance of difference models

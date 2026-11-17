---
Title: Math and statistics notes
Topic: math
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [410_MATH_notes.qmd](../../tech_notes/410_MATH_notes.qmd)
---

# Math and statistics notes

Working notes on calculus, linear algebra, probability/statistics, and ML — stated goal: "Goal: Combine math, linear algebra, statistics, ML (not R)". Formulas keep the typst notation of the notes. Some sections are deliberately rough; roughness is flagged below. REF points to the MATH repo file `0002_math_equations.qmd` at <https://github.com/jimrothstein/code_publish/blob/master/MATH/0002_math_equations.qmd>.

## Derivative: a symbol, not a fraction

- "dy/dx is *symbol*, just *notation*" — "no meaning by itself"; "forget infinitesimals; surreal numbers"; dx, dy are NOT the limit of `Delta x` / `Delta y` — "not fraction; no division".
- `dy/dx` stands for the limit: `lim (h-> 0) (f(x+h) - f(x))/h`.
- More modern: dx is a differential form or co-vector — a function that takes a tangent vector and returns a scalar (its magnitude in the x-direction).
- 1D vs 2D: for a curve `f: RR -> RR` (directions only left/right), `f(x)` and `f(x + h)` are both scalars; for a surface `f: RR^2 -> RR` "directions now infinite".

## Tangent line and plane

Slope at point P, by definition: `(y-y_0)/(x-x_0) = m`; "From calculus, we know slope is equal to" `m = f(x_0)`. Parallel lines: through origin `y = m*x`; through `x_0`: `y = m(x - x_0)`; the tangent line through `(x_0, y_0)`: `y = m(x - x_0) + f(x_0)`.

In 2D for `z = f(x,y)` near `(a,b,f(a,b))`:

```
z = f(a,b) + (partial f)/(partial x) \|_((x,y)=(a,b)) dot (x - a) + (partial f)/(partial y) \|_((x,y)=(a,b)) dot (y - b)
```

## Vectors and a basis change

Dated "2024-05-04 Sat": "vector means 'direction' and 'magnitude' (no coordinate system)" — under that definition, two vectors are the same when they share direction and magnitude (translation implicit).

Worked example: point P at (1,1), a distance of `sqrt(2)` from origin. In the "natural" basis: `vec(1,0)#sub("new") = 1/sqrt(2)*vec(1,0) + 1/sqrt(2)*vec(0,1)`. The attempted transformation matrix `1/sqrt(2) mat(1,0; 0, 1)` is flagged by the notes themselves: "Tranformation matrix: (wrong !)" (sic).

## Bias vs noise

Suppose the true function is quadratic but we model it as linear: "In most regions error is large and consistently large. Is this error *bias*? a failure of the model?" Noise — "use *averaging* to minimize".

## LLN and CLT

Law of large numbers: `lim_(n -> infinity) bar(x) = mu`. CLT contrast: "for any n, compare mean of many k samples will approach" mu "much faster".

## Sample vs population variance

`s^2` is the sample variance `(1 / N) sum_n (x - bar(x))^2`; `hat(sigma)^2` is the population variance estimator. Per the notes, `s^2` is biased toward values closer to the mean — if `N=1` you get `0`, "hardly believable population variance". The reason "is subtle": small N "will not capture enough of outliers. SEE LSR".

## Bayes

For `P(A|B)`: told `x in B`, what is the probability `x in A`? To be in A, `x in A inter B` — it depends on the relative sizes: compare `x in A inter B` with `x in B`, hence `P(A inter B)/P(B)`. REF: Ox series video <https://youtu.be/U1HbB0ATZ_A?si=ljknvvraM7Fn4hz3>.

## Entropy / information

*entropy, information* `H(X)`: "Better to find information about a variable that very uncertain, against variable more predictable"; given a random variable X, what is the "amount of *surprise*" when learning its value? The form "is chosen because it has *nice* properties that we expect of *information*". REF: <https://archive.org/details/elementsofinform0000cove_l9p7> (Elements of Information Theory). Example: "How many binary questions need to ask?" — `Prob(X) = a (1/2), b(1/4), c(1/4)`. The formula line is rough, as written: `cal(P)(X) = sum_(i=1)^n p(x)*log(p(x))` with a separate jot `"double-struck(P) = -"` (sign not yet settled in the notes).

## Probability space

"Sample Space" is a "set of atomic events" — "throw 2 die, list all possible outcomes." "Algebra is all possible subsets of the space." An event can bundle several atomic outcomes ("dice total to 4" is ONE event). Probability as a ratio of sizes; birthday-style count "n*(n-1)" explains why "so few actual people are needed to raise odds".

## Likelihood

Setup: D = Data (known), p = param (unknown); goal "Choose parameter st most consistent with data". Village example — number/order of children (B, G); "p is NOT random variable". With `p_b` the probability of one boy: "Once we have all the data, the likihood is expression" (sic) `p_b^30 * (1-p_b)^20`; "Plot, take derivative ... gives" `p_b` = 0.60; this p is where the likihood is maximized — it explains the observed data best. REF: <https://bookdown.org/roback/bookdown-BeyondMLR/ch-beyondmost.html#case-study-does-sex-run-in-families>.

## ML notes

- Logistic regression: "Using data, tune a model parameters of logistic equation to predict probabilities (ex: horse racing !)" — compare predicted to ACTUAL (win or loss) to tweak; "If your accuracy exceeds the Bookie (who introduces bias, to make money.) You can win!"
- Bayes theorem: "Compare performance of difference models" (sic).
- Log-normal: yearly growth `Y(t + 1 ) = Y( t )*(1 + e)` with small, independent e varying by company/year; take log — the claim: a sum of many small independent e becomes Normal.
- Tensor (intuition only): cube with different stress on each side; each side's stress is a matrix M times a vector in 3 directions (M*v) — "So need 3 matrices." — "Tensor is more compact way to say this."

## Laplace transform, Gaussian integral

"convolution of f,g becomes multiplication in freq domain; inverse is solution to original." If f(t) is a probability density: `L{f}(s)`, `integral_0^infinity f(t)*e^(-s)` — "identify this as" `E[ e-"tX"]` (as written). Gaussian integral: `integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2`.

## Gradient worked example

For `f=x*y + 4y - 3x^2 - y^2` at `x_0` = (1,-1): the gradient points toward min/max. Using diverential's `dv`: `$vec(dv(f,x, eval:0),(dv(f,y, eval:0)))$` = `vec(-7,7)` — "(reverse the sign, to find min)".

## Principal axis theorem

"generalize major/minor axes of ellipse"; the axes are perpendicular; "tells you how to find these axes"; "no cross terms". Examples: ellipse `x^2/9 + y^2/25 = 1` vs hyperbola `x^2/9 - y^2/25 = 1`. For `$ 5*x^2 + 8*x*y + 5*y^2 = 1 $`: "Complete the square, using u(x,y), v(x,y)" — "if sum, then ellipse"; "if difference, then hyperbola". Matrix formulation with Q = (5 4; 4 5): `Q(x,y) = [x y](5 4)[x y]^T = 1` (as laid out in the notes).

## Summation, correlation, regression formulas

- `sum_(i=1)^n x_i y_i` (display form, with indices).
- Independent samples: `mu_(bar(x)_1 - bar(x)_2) = mu_1 - mu_2`; `sigma_(bar(x)_1 - bar(x)_2)^2 = frac(sigma_1^2, n_1) + frac(sigma_2^2, n_2)`; `mu_(hat(p)_1 - hat(p)_2) = p_1 - p_2`; `sigma_(hat(p)_1 - hat(p)_2)^2 = frac(p_1 (1 - p_1), n_1) + frac(p_2 (1 - p_2), n_2)`.
- Chi-square test: `chi^2 = sum frac((O - E)^2, E)`.
- Correlations: `SS_(x) = sum (x - bar(x))^2 = sum x^2 - frac((sum x)^2, n)`; `SS_(x, y) = sum (x - bar(x))(y - bar(y)) = sum x*y - frac((sum x)(sum y), n)`; `r = frac(SS_(x*y), sqrt(SS_(x*x) SS_(y*y)))`.
- Regression: population line `E(y) = alpha + beta x` with `var(y) = sigma^2`; least-squares `hat(y) = a + bx` where `b = frac(SS_(xy), SS_(xx))` and `$bar(y) = a + b bar(x)$`.

## Lines and conics

Is `a x + b y + c z + d = 0` a line in 3D? And "Are all quadratics equivalent to a conic section?" — NO: `$ x^2 - y^2 - 2 y - 1 = 0 $` "This represents two lines. Factor as" `(x + y + 1)(x - y - 1) = 0`. Lines: `y = x - 1` and `y = -x - 1` (the same two lines plotted with cetz — see Typst math packages).

Line–surface intersection: line as `x = a + t u`, `y = b + t v`, `z = c + t w` (t a parameter), surface `F(x, y, z) = 0`; the intersection becomes a polynomial in t: `sum a_i t^i = 0`. "But for" n > 4, "may not be closed form." Numerically: "as line approaches tangent, floating point error may prevent solution."

## Zero divisors, nullspace, eigenvalues

`A = mat(1,-1; 2,-2)`, `v = vec(1,1)`: `A v = 0` where neither A nor v is zero. A is *singular* (`det(A) = 0`, non-invertible); v lies in the *nullspace* (kernel). "This is a *zero divisor* in the ring of matrices: matrix rings are *not* integral domains because they have non-trivial zero divisors." An integral domain is a ring where ab = 0 implies a = 0 or b = 0 — "matrix rings violate this". Second example: `mat(2 2; 4 4)` "has det = 0, (linear dependent columns & columns)"; solutions `vec(x_1, x_2) = c vec(1, -1)` — "Neither A nor x are zero, but product is."

Eigenvalues: `A zeta = lambda zeta` "has non-trival solutions if singular, require it" (sic); condition `matrixdet(A - lambda I) = 0` (as written). With `A = P D P^-1` — columns of P are eigenvectors; notes derive `D = y^T P^T A P y`.

The integral-domain write-up itself was produced with Google Colab `ai.generate_text` (prompt: `Explain integral domain in algebra, give simple example.   Output should be in typst format`); see Typst math packages for that workflow. Its content: the four defining properties (commutativity of multiplication, multiplicative identity `1 != 0`, no zero divisors, associativity + distributivity); cancellation takeaway — if `a != 0` and `a * b = a * c` you can safely conclude `b = c`; "This is not true in all rings!" The integers `ZZ` as standard example; `ZZ_6` as counter-example (`2 * 3 = 6 equiv 0 quad (mod 6)` — 2 and 3 are zero divisors, so `ZZ_6` is not an integral domain); common integral domains: `ZZ`, `QQ`, `RR`, `CC`, and any polynomial ring `R[x]` with `R` an integral domain (e.g. `ZZ[x]`).

## Measure theory foundation of probability

**Probability space** — a triple `(Omega, cal(F), P)`: `Omega` the sample space (set of all possible outcomes), `cal(F)` the sigma-algebra on `Omega` (the set of events), `P` the probability measure `P : cal(F) -> [0,1]`.

**Sigma-algebra** `cal(F)` on `Omega`: contains `emptyset in cal(F)` and `Omega in cal(F)`; closed under complement; closed under countable union (`union_(i=1)^infinity A_i in cal(F)`). The pair `(Omega, cal(F))` is a *measurable space*. The *Borel sigma-algebra* `cal(B)(bb(R))` is the smallest sigma-algebra on `bb(R)` "containing all open intervals" — "the standard choice for real-valued random variables".

**Probability measure**: `P(Omega) = 1`, and for pairwise disjoint sets `P(union_(i=1)^infinity A_i) = sum_(i=1)^infinity P(A_i)` (countable additivity).

**Random variable**: a measurable function `X : (Omega, cal(F)) -> (bb(R), cal(B)(bb(R)))` — for every Borel set `B in cal(B)`, the preimage is an event: `X^(-1)(B) in cal(F)`.

**Distribution and CDF**: the distribution (law) is the pushforward `P_X (B) = P(X in B) = P(X^(-1)(B))`; the CDF is `F_X (x) = P_X((-infinity, x]) = P(X <= x)`; properties: F_X is "non-decreasing, right-continuous, with limits" 0 at `-infinity` and 1 at `infinity`.

**Density as Radon-Nikodym derivative**: if `P_X` is absolutely continuous w.r.t. Lebesgue measure `lambda`, the Radon-Nikodym theorem gives `f(x) = (dif P_X) / (dif lambda)(x)` with `P_X (B) = integral_B f(x) dif x`; for discrete X, the PMF is the Radon-Nikodym derivative w.r.t. counting measure.

**Expectation as Lebesgue integral**: `E[X] = integral_Omega X(omega) dif P(omega)` — "This single integral unifies" discrete `E[X] = sum_k x_k P(X = x_k)` and continuous `E[X] = integral_(-infinity)^infinity x f(x) dif x`.

**Why measure theory**: rigorous limits (LLN and CLT rely on "Monotone Convergence, Dominated Convergence, Fatou"); "Sigma-algebras model *information*: filtrations for martingales, stopping times, stochastic processes"; conditional expectation via Radon-Nikodym / `L^2` projection; handles "mixed, singular, and infinite-dimensional distributions".

**Non-nice but measurable PDF examples** — "measurability, not continuity or Riemann integrability, is the essential requirement for a valid PDF":

1. Fat Cantor set `C subset [0,1]` (nowhere dense, `lambda(C) = 1/2`): `f(x) = 2 * I_C (x)`; `integral_0^1 f(x) dif x = 2 lambda(C) = 1` — a valid PDF; "nowhere continuous" (every point of C is a boundary point); not Riemann integrable, but perfectly Lebesgue integrable.
2. Mixed distribution with an atom: `X = B * Z` with `B tilde "Ber"(1/2)` and `Z tilde N(0,1)`; density w.r.t. `mu = lambda + delta_0`: `f(x) = 1/2 delta_0 (x) + 1/2 * 1 / sqrt(2 pi) e^(-x^2 / 2)`; has a point mass at 0, not absolutely continuous w.r.t. Lebesgue alone; "Useful for zero-inflated models (spike at zero + continuous tail)".
3. Unbounded, integrable singularity: `f(x) = 1 / (2 sqrt(|x|)) I_([-1, 0) union (0, 1]) (x)`; `integral_(-1)^1 f(x) dif x = 1`; `f(x) -> infinity` as `x -> 0` but the singularity is Lebesgue integrable; not properly Riemann integrable (unbounded), improperly Riemann and Lebesgue integrable.

"Key lesson: measurability is the only requirement for a valid PDF. Continuity, boundedness, and Riemann integrability are *not* necessary — and many useful distributions violate them."

## Bonds (duration)

"if bond yield changes by" delta y, the price change is `delta p =  "duration"/(delta y)` (as written; the worked example that follows implies a product with Δyield). Example: "If duration is 5, and the yield decreases by 100 basis points (1%), expect the price to increase by 5%". Also: "short-term bonds respond more quickly to rate changes"; "duration of bond proportional to time to maturity (check this)".

## See Also

- [Typst math packages](typst-math-packages.md) — noteworthy/physica templates, cetz-plot, diverential, LLM-to-typst workflow (same source file)
- [Typst math and drawing basics](../typst/typst-math-drawing.md)

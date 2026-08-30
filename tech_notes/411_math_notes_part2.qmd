
/*   After fixing this file, add to bottom of first math .typ */
/*


/*



// Residual Sum of Squares
$ SS_(Resid) = sum (y - hat(y))^2 = sum y^2 - a sum y - b sum xy $

// Standard Errors
$s_e = sqrt(frac(SS_(Resid), n - 2))$

$s_b = frac(s_e, sqrt(SS_(xx)))$

$s_(a + bx) = s_e sqrt(1 + frac(1, n) + frac((x - bar(x))^2, SS_(xx)))$


for prediction:

// $se(y - hat(y)) = s_e sqrt(1 + frac(1, n) + frac((x - bar(x))^2, SS_(xx)))$

== Variance

// $SS_(Tr) = frac(T_1^2, n_1) + frac(T_2^2, n_2) + ... + frac(T_k^2, n_k) - frac(T^2, n)$

//SS_(To) = x_1^2 + x_2^2 + ... + x_k^2 - T^2/n


// $SS_(E) = SS_(To) - SS_(Tr)$

*/
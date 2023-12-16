# Homework 2

$$
\begin{split*}
    \text{MSE}(\hat{\theta}) & = \mathbb{E}[(\hat{\theta} - \theta)^2] \\
& = \mathbb{E}\left[\left(\frac{1}{N}\sum_{i=1}^N (X_i) - \theta\right)^2\right] \\
& = \mathbb{E}\left[\left(\frac{1}{N}\sum_{i=1}^N (W_i)\right)^2\right] \\
& = \mathbb{E}\left[\frac{1}{N^2}\left(\sum_{i=1}^N W_i\right)^2\right] \\
& = \frac{1}{N^2}\mathbb{E}\left[\left(\sum_{i=1}^N W_i\right)^2\right]
\end{split*}
$$

# References

- [ ] [Frequentist vs. Bayesian Statistics – Which should you use?](https://learning.edanz.com/frequentist-bayesian-statistics/)
- [ ] [9.1.6 Linear MMSE Estimation of Random Variables](https://www.probabilitycourse.com/chapter9/9_1_6_linear_MMSE_estimat_of_random_vars.php)

import math
from scipy.stats import norm

# Given values
mu_0 = 500      # claimed mean
x_bar = 485    # sample mean
sigma = 60     # population standard deviation
n = 36         # sample size
alpha = 0.05

# Z-test statistic
z = (x_bar - mu_0) / (sigma / math.sqrt(n))

# Critical value for left-tailed test
z_critical = norm.ppf(alpha)

print("Z statistic:", z)
print("Critical value:", z_critical)

# Decision
if z <= z_critical:
    print("Reject H0")
else:
    print("Fail to reject H0")

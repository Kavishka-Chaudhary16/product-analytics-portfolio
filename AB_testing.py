from scipy.stats import ttest_ind

# Group A conversion results: 1 = converted, 0 = not
group_A = [1, 0, 1, 0, 1, 0, 1, 0, 0, 1]

# Group B conversion results
group_B = [1, 1, 1, 1, 1, 0, 1, 1, 1, 1]

# Perform independent t-test
t_stat, p_value = ttest_ind(group_A, group_B)

print("T-statistic:", round(t_stat, 3))
print("P-value:", round(p_value, 4))

if p_value < 0.05:
    print("✅ Statistically significant difference in conversion!")
else:
    print("❌ No significant difference.")

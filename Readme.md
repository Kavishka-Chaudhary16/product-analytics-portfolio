# A/B Testing: CTA Conversion Optimization

**Goal:** Evaluate if CTA Variant B leads to higher sign-up rates than Variant A.

**Tools Used:** SQL (DB Fiddle), Python (Google Colab)

## 💡 SQL Analysis
- Created `users` table with A/B test variants and conversion flags
- Calculated conversion rate by variant
- Variant A: 50%, Variant B: 90%

## 📊 Python T-Test
- Used `scipy.stats.ttest_ind` to check for statistical significance
```python
from scipy.stats import ttest_ind

group_A = [1, 0, 1, 0, 1, 0, 1, 0, 0, 1]
group_B = [1, 1, 1, 1, 1, 0, 1, 1, 1, 1]

t_stat, p_value = ttest_ind(group_A, group_B)
print("T-statistic:", round(t_stat, 3))
print("P-value:", round(p_value, 4))

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Step 1: Simulated user signup and activity data
data = {
    'user_id': range(1, 11),
    'signup_date': pd.to_datetime([
        '2024-01-01', '2024-01-01', '2024-01-01', '2024-01-02', '2024-01-02',
        '2024-01-08', '2024-01-08', '2024-01-15', '2024-01-22', '2024-01-22'
    ]),
    'last_active_date': pd.to_datetime([
        '2024-01-01', '2024-01-02', '2024-01-04', '2024-01-03', '2024-01-10',
        '2024-01-08', '2024-01-15', '2024-01-17', '2024-01-30', '2024-02-10'
    ])
}

df = pd.DataFrame(data)

# Step 2: Create cohort group (based on signup week)
df['cohort_week'] = df['signup_date'].dt.to_period('W').apply(lambda r: r.start_time)
df['activity_week'] = df['last_active_date'].dt.to_period('W').apply(lambda r: r.start_time)

# Step 3: Calculate number of weeks between signup and last activity
df['weeks_since_signup'] = ((df['activity_week'] - df['cohort_week']) / np.timedelta64(1, 'W')).astype(int)

# Step 4: Create Retention Table
retention = df.pivot_table(index='cohort_week',
                           columns='weeks_since_signup',
                           values='user_id',
                           aggfunc='count')

retention.fillna(0, inplace=True)

# Step 5: Convert to retention rate
retention_rate = retention.div(retention[0], axis=0)

# Step 6: Display heatmap
import seaborn as sns
plt.figure(figsize=(10, 5))
sns.heatmap(retention_rate, annot=True, fmt=".0%", cmap="YlGnBu")
plt.title('30-Day Weekly Retention Cohorts')
plt.ylabel('Signup Cohort (Week)')
plt.xlabel('Weeks Since Signup')
plt.show()

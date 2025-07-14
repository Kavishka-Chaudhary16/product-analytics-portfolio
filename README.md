# Funnel Drop-off & Retention Cohort Analysis

## 🎯 Objective:
Analyze fintech user behavior after sign-up. Identify where users drop off in the onboarding journey and study long-term retention patterns.

---

## 🛠️ SQL Funnel Breakdown

### Events Tracked:
- Step 1: `account_created`
- Step 2: `kyc_done`
- Step 3: `first_transaction`

```sql
SELECT
  COUNT(DISTINCT CASE WHEN event_name = 'account_created' THEN user_id END) AS step_1_account_created,
  COUNT(DISTINCT CASE WHEN event_name = 'kyc_done' THEN user_id END) AS step_2_kyc_done,
  COUNT(DISTINCT CASE WHEN event_name = 'first_transaction' THEN user_id END) AS step_3_transaction_done
FROM user_events;

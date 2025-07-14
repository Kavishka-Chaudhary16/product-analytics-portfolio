-- Step 1: Create user_events table
CREATE TABLE user_events (
  user_id INT,
  event_name VARCHAR(50),
  event_time TIMESTAMP
);

-- Step 2: Insert event data (simulated)
INSERT INTO user_events (user_id, event_name, event_time) VALUES
(1, 'account_created', '2024-01-01 10:00:00'),
(1, 'kyc_done', '2024-01-01 11:00:00'),
(1, 'first_transaction', '2024-01-02 09:00:00'),
(2, 'account_created', '2024-01-01 10:30:00'),
(2, 'kyc_done', '2024-01-01 11:30:00'),
(3, 'account_created', '2024-01-01 12:00:00'),
(4, 'account_created', '2024-01-01 13:00:00'),
(4, 'kyc_done', '2024-01-01 14:00:00'),
(4, 'first_transaction', '2024-01-02 09:30:00'),
(5, 'account_created', '2024-01-02 10:00:00');

-- Step 3: Funnel Drop-off Summary
SELECT
  COUNT(DISTINCT CASE WHEN event_name = 'account_created' THEN user_id END) AS step_1_account_created,
  COUNT(DISTINCT CASE WHEN event_name = 'kyc_done' THEN user_id END) AS step_2_kyc_done,
  COUNT(DISTINCT CASE WHEN event_name = 'first_transaction' THEN user_id END) AS step_3_transaction_done
FROM user_events;

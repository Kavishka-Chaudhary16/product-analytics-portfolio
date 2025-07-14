-- USERS TABLE FOR A/B TESTING
CREATE TABLE users (
  user_id INT,
  variant CHAR(1),  -- A or B
  sign_up_complete BOOLEAN
);

-- SAMPLE DATA (10 users in A, 10 users in B)
INSERT INTO users (user_id, variant, sign_up_complete) VALUES
-- Variant A users
(1, 'A', TRUE),
(2, 'A', FALSE),
(3, 'A', TRUE),
(4, 'A', FALSE),
(5, 'A', TRUE),
(6, 'A', FALSE),
(7, 'A', TRUE),
(8, 'A', FALSE),
(9, 'A', FALSE),
(10, 'A', TRUE),
-- Variant B users
(11, 'B', TRUE),
(12, 'B', TRUE),
(13, 'B', TRUE),
(14, 'B', TRUE),
(15, 'B', TRUE),
(16, 'B', FALSE),
(17, 'B', TRUE),
(18, 'B', TRUE),
(19, 'B', TRUE),
(20, 'B', TRUE);

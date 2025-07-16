# RFM + CLTV Customer Segmentation Dashboard (SQL Project)

This SQL project combines two powerful customer analytics techniques — **RFM segmentation** and **Customer Lifetime Value (CLTV)** — into a query.

The goal was to build a clean, data-driven view of customer behavior and long-term value using only SQL.

---

### What this project includes

- **RFM (Recency, Frequency, Monetary) Scoring**
  - Recency = Days since last purchase
  - Frequency = Total number of purchases
  - Monetary = Total revenue contributed
  - Each customer is scored on a scale of 1–5 for R, F, and M
  - Final RFM score is a 3-digit string (e.g., `545`)

- **CLTV (Customer Lifetime Value) Modeling**
  - Calculates expected value of each customer using:
    - Average order value
    - Purchase frequency
    - Customer lifespan (months between first & last order)
  - CLTV = AOV × Frequency × Lifespan

- **Customer Segments Assigned Based on Behavior**
  - Champions
  - Loyal Customers
  - At-Risk Users
  - Others

---

### Sample Output

| Customer | RFM Score | Segment        | CLTV     |
|----------|-----------|----------------|----------|
| Aditya   | 545       | Champion       | ₹7800.00 |
| Kavishka | 444       | Loyal Customer | ₹9300.00 |
| Neeraj   | 121       | At-Risk        | ₹0.00    |

---

### Why I built this

I wanted to simulate how real companies track customer value and behavior in one view — useful for marketing teams, growth analysts, or retention strategists.

This project helped me learn:
- How to score users and assign them tags using SQL
- How to combine behavioral metrics with financial value
- How to prepare `.sql` dashboards that are reusable and explainable

---

### Tools Used

- MySQL 8.0 (on db-fiddle.com)
- GitHub (manual upload of `.sql` and `.md` files)
- No additional libraries or tools — everything is plain SQL

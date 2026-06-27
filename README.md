# ecommerce-sql-analysis
End-To-End E-Commerce Analysis Using SQL On 470K+ Sessions &amp; 32K Orders.
# E-Commerce Business Analysis — Maven Fuzzy Factory

I wanted to build a project that goes beyond running queries — 
so I took a real e-commerce dataset and analyzed it the way 
an analyst would actually approach it at a company. 
Starting from "how is this business doing?" and drilling down 
until I had real answers and real recommendations.

---

## The Business

Maven Fuzzy Factory is a stuffed animal e-commerce brand. 
The data covers 3 years of operations — website traffic, 
orders, products, and refunds. My job was to figure out 
what's working, what isn't, and what the business should do about it.

- 472,871 website sessions
- 32,313 orders
- 4 products
- March 2012 to March 2015

Tool: MySQL | Dataset: Maven Analytics

---

## What I Found

### The business grew 26x in 3 years — but growth is hiding some problems

Revenue went from $2,999/month to $78,951/month. 
Profit margin sits at 62.7% which is strong for a physical product business. 
On the surface everything looks great.

But when you dig in, there are some things worth paying attention to.

---

### 1. One product is carrying the entire business

| Product | Orders | Revenue | Profit |
|---------|--------|---------|--------|
| Mr. Fuzzy | 24,226 | $1.21M | $738K |
| Love Bear | 5,796 | $347K | $217K |
| Sugar Panda | 4,985 | $229K | $157K |
| Mini Bear | 5,018 | $150K | $102K |

Mr. Fuzzy accounts for 73% of all orders. 
If that product has a quality issue, a competitor, or a supply problem — 
the business takes a serious hit. The other three products need more investment.

---

### 2. Social media ads are burning money

| Channel | Sessions | Orders | Conversion Rate |
|---------|----------|--------|----------------|
| gsearch | 169,602 | 10,011 | 5.90% |
| organic | 35,606 | 2,468 | 6.93% |
| bsearch | 33,558 | 2,133 | 6.36% |
| socialbook | 5,095 | 55 | 1.08% |

Every other channel converts at 5-7%. Socialbook converts at 1.08%. 
That budget should be moved to gsearch or bsearch immediately.

---

### 3. Mobile visitors almost never buy

| Device | Sessions | Orders | Conversion Rate |
|--------|----------|--------|----------------|
| Desktop | 169,715 | 12,638 | 7.45% |
| Mobile | 74,136 | 2,029 | 2.74% |

74,000 people visited on mobile. Only 2.74% bought something. 
Desktop converts at 7.45% — nearly 3x higher. 
The mobile checkout experience needs serious attention.

---

### 4. The funnel is leaking at two points

Tracked every step from landing page to order:

- **Product page → Cart: 57% drop-off** — people are browsing but not buying
- **Billing → Order complete: 50% drop-off** — people are abandoning at checkout

Two fixes that would likely move the needle: 
customer reviews on product pages and a simpler billing form.

---

### 5. Organic traffic is the most valuable — and it's being ignored

| Source | Repeat Customer Rate |
|--------|---------------------|
| Organic/Direct | 55.5% |
| bsearch | 7.1% |
| gsearch | 5.8% |

People who find the site organically come back at 55.5%. 
Paid search visitors come back at under 6%. 
The business is spending heavily on ads to acquire customers who don't return, 
while underinvesting in SEO that would bring loyal ones.

---

### 6. Sugar Panda has a quality problem that isn't going away

| Product | Refund Rate |
|---------|-------------|
| Sugar Panda | 6.04% |
| Mr. Fuzzy | 5.11% |
| Love Bear | 2.23% |
| Mini Bear | 1.28% |

Checked the refund rate month by month — Sugar Panda has been 
sitting at 4-7% since launch with no improvement. 
This needs a proper root cause investigation, not just monitoring.

---

### 7. The business has a retention problem

Only 17% of orders come from repeat customers. 
83% of revenue depends on constantly acquiring new people. 
If ad costs go up or traffic drops, revenue drops with it. 
A loyalty program or post-purchase email sequence could change this significantly.

---

## Recommendations

| Priority | Recommendation | Why |
|----------|---------------|-----|
| High | Cut or redirect socialbook budget | 1.08% CVR vs 5-7% everywhere else |
| High | Fix mobile checkout experience | 74k sessions at 2.74% CVR = massive missed revenue |
| High | Investigate Sugar Panda refunds | 6% refund rate, no improvement in 2 years |
| Medium | Invest in SEO | Organic visitors 10x more loyal than paid |
| Medium | Build retention program | 17% repeat rate is too low |
| Low | Diversify beyond Mr. Fuzzy | 73% order concentration is a business risk |

---

## SQL Used in This Project

This project goes beyond basic queries. Concepts used:

- Multi-table JOINs (up to 3 tables)
- Aggregate functions with GROUP BY and HAVING
- Subqueries
- CASE WHEN for dynamic labeling
- CTEs to break complex logic into readable steps
- Window functions — LAG() for month over month growth
- Date functions for time series analysis

---

*Note: March 2015 data is incomplete (dataset ends March 19). 
Revenue decline in that month reflects missing data, not actual business performance.*

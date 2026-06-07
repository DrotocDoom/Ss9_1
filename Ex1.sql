CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        customer_id INT NOT NULL,
                        order_date DATE NOT NULL,
                        total_amount NUMERIC(12,2) NOT NULL CHECK (total_amount >= 0)
);

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
    (101, '2025-01-10', 1500000),
    (102, '2025-01-12', 2300000),
    (101, '2025-02-05', 500000),
    (103, '2025-02-15', 3200000),
    (102, '2025-03-01', 1800000);

CREATE INDEX idx_customer_id ON orders (customer_id);

EXPLAIN ANALYSE SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
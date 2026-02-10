create database Insurance_Claims;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15)
); 
CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
); 
CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    customer_id INT,
    agent_id INT,
    policy_type VARCHAR(10) CHECK (policy_type IN ('Auto', 'Home', 'Life')),
    premium DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
); 
CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claim_date DATE,
    description TEXT,
    claim_amount DECIMAL(10, 2),
    status VARCHAR(10) CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
); 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    claim_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
); 
INSERT INTO customers (customer_id, name, date_of_birth, phone) VALUES
(1, 'John Smith',        '1985-02-14', '+1-202-555-0123'),
(2, 'Maria Gonzalez',    '1990-08-21', '+1-202-555-0198'),
(3, 'Ahmed Khan',        '1978-11-03', '+1-202-555-0114'),
(4, 'Mei Ling',          '1995-06-30', '+1-202-555-0177'),
(5, 'James Anderson',    '1982-04-18', '+1-202-555-0155'),
(6, 'Fatima Al-Zahra',   '1989-12-25', '+1-202-555-0109'),
(7, 'Carlos Martinez',   '1993-09-11', '+1-202-555-0141'),
(8, 'Amina Yusuf',       '1987-05-08', '+1-202-555-0188'),
(9, 'Liam O''Connor',    '2000-03-22', '+1-202-555-0120'),
(10, 'Priya Raj',        '1992-10-10', '+1-202-555-0166'),
(11, 'David Brown',      '1980-07-01', '+1-202-555-0133'),
(12, 'Elena Petrova',    '1997-01-15', '+1-202-555-0112'),
(13, 'Junaid Alam',      '1986-08-05', '+1-202-555-0190'),
(14, 'Sophie Dubois',    '1991-03-19', '+1-202-555-0149'),
(15, 'William Johnson',  '1975-12-02', '+1-202-555-0101'); 
INSERT INTO agents (agent_id, name, department) VALUES
(1, 'Alice Johnson',     'Sales'),
(2, 'Bob Williams',      'Support'),
(3, 'Charlie Davis',     'Technical'),
(4, 'Diana Prince',      'Sales'),
(5, 'Ethan Clark',       'Marketing'),
(6, 'Fiona Garcia',      'Support'),
(7, 'George Miller',     'Technical'),
(8, 'Hannah Lee',        'Sales'),
(9, 'Ian Wright',        'Support'),
(10, 'Jessica Brown',    'Marketing'),
(11, 'Kevin Thompson',   'Sales'),
(12, 'Laura Wilson',     'Technical'),
(13, 'Michael Scott',    'Support'),
(14, 'Natalie Adams',    'Marketing'),
(15, 'Oliver Stone',     'Sales');
INSERT INTO policies (policy_id, customer_id, agent_id, policy_type, premium, start_date, end_date) VALUES
(1, 1, 3, 'Auto', 120.50, '2023-01-01', '2024-01-01'),
(2, 2, 5, 'Home', 95.00, '2023-02-15', '2024-02-15'),
(3, 3, 1, 'Life', 150.75, '2023-03-10', '2024-03-10'),
(4, 4, 2, 'Auto', 110.00, '2023-04-01', '2024-04-01'),
(5, 5, 4, 'Home', 130.25, '2023-05-20', '2024-05-20'),
(6, 6, 7, 'Life', 180.00, '2023-06-05', '2024-06-05'),
(7, 7, 3, 'Auto', 140.50, '2023-07-11', '2024-07-11'),
(8, 8, 6, 'Home', 100.00, '2023-08-01', '2024-08-01'),
(9, 9, 8, 'Life', 170.30, '2023-09-15', '2024-09-15'),
(10, 10, 2, 'Auto', 115.00, '2023-10-01', '2024-10-01'),
(11, 11, 10, 'Home', 98.25, '2023-11-20', '2024-11-20'),
(12, 12, 11, 'Life', 160.00, '2023-12-05', '2024-12-05'),
(13, 13, 9, 'Auto', 125.75, '2024-01-10', '2025-01-10'),
(14, 14, 12, 'Home', 105.00, '2024-02-14', '2025-02-14'),
(15, 15, 14, 'Life', 190.00, '2024-03-01', '2025-03-01');
INSERT INTO claims (claim_id, policy_id, claim_date, description, claim_amount, status) VALUES
(1, 1, '2023-03-05', 'Rear-end collision damage', 2500.00, 'Approved'),
(2, 2, '2023-04-10', 'Water damage from pipe burst', 3200.00, 'Approved'),
(3, 3, '2023-05-18', 'Death benefit claim', 50000.00, 'Pending'),
(4, 4, '2023-06-01', 'Minor accident - bumper repair', 800.00, 'Approved'),
(5, 5, '2023-07-22', 'Storm roof damage', 4200.00, 'Approved'),
(6, 6, '2023-08-03', 'Life insurance payout', 75000.00, 'Approved'),
(7, 7, '2023-09-15', 'Hit-and-run incident', 3900.00, 'Pending'),
(8, 8, '2023-10-05', 'Kitchen fire damage', 5600.00, 'Rejected'),
(9, 9, '2023-11-11', 'Policyholder deceased', 100000.00, 'Approved'),
(10, 10, '2023-12-19', 'Rear fender replacement', 1100.00, 'Pending'),
(11, 11, '2024-01-10', 'Flood damage in basement', 4700.00, 'Approved'),
(12, 12, '2024-02-14', 'Accidental death benefit', 85000.00, 'Pending'),
(13, 13, '2024-03-01', 'Collision with tree', 3000.00, 'Rejected'),
(14, 14, '2024-04-20', 'Fire damage in living room', 6200.00, 'Approved'),
(15, 15, '2024-05-06', 'Natural death claim', 90000.00, 'Approved');
INSERT INTO payments (payment_id, claim_id, payment_date, amount) VALUES
(1, 1, '2023-03-10', 2500.00),
(2, 2, '2023-04-15', 3200.00),
(3, 4, '2023-06-05', 800.00),
(4, 5, '2023-07-25', 4200.00),
(5, 6, '2023-08-10', 75000.00),
(6, 9, '2023-11-20', 100000.00),
(7, 11, '2024-01-15', 4700.00),
(8, 14, '2024-04-25', 6200.00),
(9, 15, '2024-05-10', 90000.00),
(10, 7, '2023-10-01', 1950.00),      
(11, 7, '2023-10-15', 1950.00),     
(12, 12, '2024-02-20', 85000.00),
(13, 3, '2023-06-01', 50000.00),
(14, 10, '2023-12-25', 1100.00),
(15, 8, '2023-10-10', 0.00); 
-- 1.	List all claims for a specific customer.  
SELECT 
    c.claim_id,
    c.policy_id,
    c.claim_date,
    c.description,
    c.claim_amount,
    c.status
FROM 
    claims c
JOIN 
    policies p ON c.policy_id = p.policy_id
JOIN 
    customers cu ON p.customer_id = cu.customer_id
WHERE 
    cu.customer_id = 3;
 --    2.	Calculate the total claim amount paid out per policy type.
    SELECT 
    p.policy_type,
    SUM(c.claim_amount) AS total_claim_paid
FROM 
    claims c
JOIN 
    policies p ON c.policy_id = p.policy_id
WHERE 
    c.status = 'Approved'
GROUP BY 
    p.policy_type; 
    -- 3.	Find the agent who has sold the most policies. 
    SELECT 
    a.agent_id,
    a.name AS agent_name,
    COUNT(p.policy_id) AS policies_sold
FROM 
    agents a
JOIN 
    policies p ON a.agent_id = p.agent_id
GROUP BY 
    a.agent_id, a.name
ORDER BY 
    policies_sold DESC
LIMIT 1; 
-- 4.	Identify customers with more than one active policy.
SELECT 
    cu.customer_id,
    cu.name,
    COUNT(p.policy_id) AS active_policies
FROM 
    policies p
JOIN 
    customers cu ON p.customer_id = cu.customer_id
WHERE 
    CURRENT_DATE BETWEEN p.start_date AND p.end_date
GROUP BY 
    cu.customer_id, cu.name
HAVING 
    COUNT(p.policy_id) > 1;
-- 5.	Calculate the average claim amount.
SELECT 
    AVG(claim_amount) AS average_claim_amount
FROM 
    claims; 
-- 6.	Find policies that have no claims filed against them. 
SELECT p.*
FROM Policies p
LEFT JOIN Claims c ON p.policy_id = c.policy_id
WHERE c.claim_id IS NULL; 
-- 7.	List all claims that are still pending approval.
SELECT *
FROM Claims
WHERE status = 'Pending'; 
-- 8.	Calculate the total premium revenue per agent. 
SELECT  name, SUM(p.premium) AS total_premium_revenue
FROM Agents a
JOIN Policies p ON a.agent_id = p.agent_id
GROUP BY a.name;
-- 9.	Identify the most common type of claim.
SELECT claim_amount, COUNT(*) AS total_claims
FROM claims
GROUP BY claim_amount
ORDER BY total_claims DESC
LIMIT 1; 
-- 10.	Find the customer with the highest total claim amount approved. 
SELECT 
    cu.customer_id,
    cu.name,
    SUM(c.claim_amount) AS total_approved_claim_amount
FROM 
    claims c
JOIN 
    policies p ON c.policy_id = p.policy_id
JOIN 
    customers cu ON p.customer_id = cu.customer_id
WHERE 
    c.status = 'Approved'
GROUP BY 
    cu.customer_id, cu.name
ORDER BY 
    total_approved_claim_amount DESC
LIMIT 1;











     







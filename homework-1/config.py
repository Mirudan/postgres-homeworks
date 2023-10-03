import os

DB_PASS = os.getenv('PASSWORD_DB')

EMPLOYEES_PATH = os.path.join("north_data", "employees_data.csv")
CUSTOMERS_PATH = os.path.join("north_data", "customers_data.csv")
ORDERS_PATH = os.path.join("north_data", "orders_data.csv")

DB_TABLES = [
    ('employees', EMPLOYEES_PATH),
    ('customers', CUSTOMERS_PATH),
    ('orders', ORDERS_PATH),
]

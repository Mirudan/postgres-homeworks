from psycopg2._psycopg import cursor
from config import DB_PASS, DB_TABLES
import psycopg2
import csv


def upload_table_in_db(cur: cursor, filename: str, table_name: str) -> None:
    """
    Загружает таблицу в БД
    """
    with open(filename, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        title = next(reader)
        values = ', '.join(["%s"] * len(title))
        query = f'INSERT INTO {table_name} VALUES ({values})'
        for row in reader:
            cur.execute(query, row)


def main():
    conn = psycopg2.connect(host="localhost", database="north", user="postgres", password=DB_PASS)
    try:
        with conn:
            with conn.cursor() as cur:
                for table_name, filename in DB_TABLES:
                    upload_table_in_db(cur, filename, table_name)
    except Exception as e:
        print(f'Возникла ошибка {e}')
    finally:
        conn.close()


if __name__ == '__main__':
    main()

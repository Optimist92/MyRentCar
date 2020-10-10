@echo off
@set Path=C:\pgsql;C:\pgsql\bin
@rem пример выполнения SQL-запроса из файла
@rem psql --username=root --password=root --dbname=postgres --file=D:\Studies\Workspaces\My_project\car_rental\database\create_db.sql
@rem psql --username=root --password --dbname=rent --file=D:\Studies\Workspaces\My_project\car_rental\database\create_tables.sql
psql --username=root --password --dbname=my_db -c "\encoding UTF8" --file=D:\Studies\Workspaces\My_project\car_rental\database\fill_tables_test.sql

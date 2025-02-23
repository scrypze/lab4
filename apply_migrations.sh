#!/bin/bash
set -e # Останавливаем выполнение при ошибке
set -x # Включаем вывод команд для отладки

# echo "Waiting for PostgreSQL to be ready..."
# until pg_isready -h "$POSTGRES_HOST" -p 5432 -U "$POSTGRES_USER"; do
#   sleep 2
# done

echo "Applying migrations..."
for file in /migrations/*.sql; do
  echo "Applying $file..."
  psql "postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB" -f "$file"
done

echo "Migrations applied successfully!"

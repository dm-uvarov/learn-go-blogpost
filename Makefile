postgres:
	docker run --name postgres14 -p 5433:5432 -e POSTGRES_PASSWORD=secret -d postgres:14-alpine

createdb:
	docker exec -it postgres14 createdb --username=postgres --owner=postgres blogpost

dropdb:
	docker exec -it postgres14 dropdb blogpost

migrateup:
	migrate --path db/migration -database "postgresql://postgres:secret@localhost:5433/blogpost?sslmode=disable" -verbose up

migratedown:
	migrate --path db/migration -database "postgresql://postgres:secret@localhost:5433/blogpost?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
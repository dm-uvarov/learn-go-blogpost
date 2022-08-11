CREATE TABLE "users" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "username" varchar UNIQUE NOT NULL
);

CREATE TABLE "posts" (
  "post_id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "user_id" bigserial NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "title" varchar NOT NULL,
  "content" text NOT NULL
);

CREATE INDEX ON "users" ("id");

CREATE INDEX ON "users" ("username");

CREATE INDEX ON "posts" ("user_id");

CREATE INDEX ON "posts" ("title");

CREATE INDEX ON "posts" ("created_at");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
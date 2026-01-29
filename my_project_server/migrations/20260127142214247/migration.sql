BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_messages" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "role" text NOT NULL,
    "content" text NOT NULL,
    "intentType" text,
    "metadata" text,
    "timestamp" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "chat_user_idx" ON "chat_messages" USING btree ("userId");
CREATE INDEX "chat_timestamp_idx" ON "chat_messages" USING btree ("timestamp");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "insights" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "type" text NOT NULL,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "priority" bigint NOT NULL DEFAULT 0,
    "iconName" text,
    "actionType" text,
    "actionData" text,
    "isDismissed" boolean NOT NULL DEFAULT false,
    "expiresAt" timestamp without time zone,
    "generatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "insight_user_idx" ON "insights" USING btree ("userId");
CREATE INDEX "insight_dismissed_idx" ON "insights" USING btree ("isDismissed");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tasks" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "title" text NOT NULL,
    "description" text,
    "dueDate" timestamp without time zone,
    "priority" text NOT NULL DEFAULT '''medium'''::text,
    "status" text NOT NULL DEFAULT '''pending'''::text,
    "category" text,
    "isRecurring" boolean NOT NULL DEFAULT false,
    "recurrenceRule" text,
    "reminderAt" timestamp without time zone,
    "completedAt" timestamp without time zone,
    "aiSuggested" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "task_user_idx" ON "tasks" USING btree ("userId");
CREATE INDEX "task_due_date_idx" ON "tasks" USING btree ("dueDate");
CREATE INDEX "task_status_idx" ON "tasks" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "name" text NOT NULL,
    "avatarUrl" text,
    "timezone" text DEFAULT '''UTC'''::text,
    "notificationsEnabled" boolean DEFAULT true,
    "lastActiveAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_email_idx" ON "users" USING btree ("email");


--
-- MIGRATION VERSION FOR my_project
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('my_project', '20260127142214247', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260127142214247', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;

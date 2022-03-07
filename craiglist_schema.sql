-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EvUCgb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "state" string   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" int   NOT NULL,
    "username" string   NOT NULL,
    "preferred_reg_id" int   NOT NULL,
    "email" string   NOT NULL,
    "phone" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Users_username" UNIQUE (
        "username"
    ),
    CONSTRAINT "uc_Users_email" UNIQUE (
        "email"
    )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "title" string   NOT NULL,
    "display_contact" BOOLEAN   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "test" STRING   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preferred_reg_id" FOREIGN KEY("preferred_reg_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");


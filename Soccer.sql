-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Stadiums" (
    "id" int   NOT NULL,
    "city" string   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Stadiums" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Teams" (
    "id" int   NOT NULL,
    "Name" string   NOT NULL,
    "home" int   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "id" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Coaches" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "current_team_id" int   NOT NULL,
    CONSTRAINT "pk_Coaches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Player_Team" (
    'player_id' int NOT NULL FOREIGN KEY REFERENCES Players(id),
    'team_id' int NOT NULL FOREIGN KEY REFERENCES Teams(id)
    'date_joined'timestamp NOT NULL,
    'date_left' timestamp
    CONSTRAINT 'pk_Player_team' PRIMARY KEY (
        'player_id', 'team_id'
    )

)

CREATE TABLE "Matches" (
    "id" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "visiting_team_id" int   NOT NULL,
    "date" date   NOT NULL,
    "stadium_id" int   NOT NULL FOREIGN KEY REFERENCES Stadiums(id),
    "head_ref_id" int   NOT NULL FOREIGN KEY REFERENCES Referees(id),
    "assist_ref1_id" int   NOT NULL FOREIGN KEY REFERENCES Referees(id),
    "assist_ref2_id" int   NOT NULL FOREIGN KEY REFERENCES Referees(id),
    "season_id" int   NOT NULL FOREIGN KEY REFERENCES Seasons(id),
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL FOREIGN Key,
    "match_id" int   NOT NULL,
    "gtime" timestamp   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_home" FOREIGN KEY("home")
REFERENCES "Stadiums" ("id");

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_current_team_id" FOREIGN KEY("current_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_visiting_team_id" FOREIGN KEY("visiting_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "Stadiums" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_head_ref_id" FOREIGN KEY("head_ref_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_assist_ref1_id" FOREIGN KEY("assist_ref1_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_assist_ref2_id" FOREIGN KEY("assist_ref2_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Seasons" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

CREATE INDEX "idx_Teams_Name"
ON "Teams" ("Name");


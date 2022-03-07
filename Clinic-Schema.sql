-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EvUCgb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Doctors" (
    "id" int   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    "specialty" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Insurance_Co" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Insurance_Co" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Coverage_Plan" (
    "id" int   NOT NULL,
    "company_id" int   NOT NULL,
    "name" String   NOT NULL,
    CONSTRAINT "pk_Coverage_Plan" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" int   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    "insurance_id" int   NOT NULL,
    "plan_id" int   NOT NULL,
    "birthday" date   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "date" date   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" int   NOT NULL,
    "name" string   NOT NULL,
    "description" string   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Coverage_Plan" ADD CONSTRAINT "fk_Coverage_Plan_company_id" FOREIGN KEY("company_id")
REFERENCES "Insurance_Co" ("id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_insurance_id" FOREIGN KEY("insurance_id")
REFERENCES "Insurance_Co" ("id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_plan_id" FOREIGN KEY("plan_id")
REFERENCES "Coverage_Plan" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");


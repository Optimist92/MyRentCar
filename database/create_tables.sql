CREATE TABLE "class" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "type" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "fuel" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "transmission" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);


CREATE TABLE "model" (
     "id" SERIAL PRIMARY KEY,
     "class_id" INTEGER NOT NULL REFERENCES "class",
    "make_of_car" TEXT NOT NULL,
     "model_of_car" TEXT NOT NULL,
     "transmission_id" INTEGER NOT NULL REFERENCES "transmission",
     "type_id" INTEGER NOT NULL REFERENCES "type",
     "fuel_id" INTEGER NOT NULL REFERENCES "fuel",
     "avg_fuel_cons" REAL NOT NULL,
     "power" INTEGER NOT NULL,
     "capacity" INTEGER NOT NULL,
     "years_of_production" TEXT NOT NULL
);

CREATE TABLE "price" (
    "id" SERIAL PRIMARY KEY REFERENCES "model" ON DELETE CASCADE,
    "cost1" INTEGER NOT NULL,
    "cost4" INTEGER NOT NULL,
    "cost8" INTEGER NOT NULL
);

/* TABLE "option" (
	"id" SERIAL PRIMARY KEY REFERENCES "model",
	"air_cond" BOOLEAN DEFAULT false,
	"power_windows" BOOLEAN DEFAULT false,
	"seat_heating" BOOLEAN DEFAULT false,
	"wheel_heating" BOOLEAN DEFAULT false,
	"parking_sensors" BOOLEAN DEFAULT false,
	"cruise_control" BOOLEAN DEFAULT false,
	"CD/MP3/USB" BOOLEAN DEFAULT false,
	"bluetooth" BOOLEAN DEFAULT false,
	"leather_interior" BOOLEAN DEFAULT false
);*/

CREATE TABLE "car" (
	"id" SERIAL PRIMARY KEY,
	"model_id" INTEGER NOT NULL REFERENCES "model",
	"reg_number_auto" VARCHAR(7) NOT NULL,
	"rented" BOOLEAN DEFAULT FALSE,
	"year_of_issue" VARCHAR(4) NOT NULL,
	"color" TEXT NOT NULL,
	"on_repair" BOOLEAN DEFAULT FALSE,
    "air_cond" BOOLEAN DEFAULT false,
    "power_windows" BOOLEAN DEFAULT false,
    "seat_heating" BOOLEAN DEFAULT false,
    "wheel_heating" BOOLEAN DEFAULT false,
    "parking_sensors" BOOLEAN DEFAULT false,
    "cruise_control" BOOLEAN DEFAULT false,
    "CD/MP3/USB" BOOLEAN DEFAULT false,
    "bluetooth" BOOLEAN DEFAULT false,
    "leather_interior" BOOLEAN DEFAULT false
);

CREATE TABLE "status_order" (
    "id" INTEGER PRIMARY KEY,
    "name" VARCHAR(255) NOT null
);

CREATE TABLE "discount" (
	"id" SERIAL PRIMARY KEY,
	"discount_name" TEXT NOT NULL,
	"percent" NUMERIC (2, 2) NOT NULL
);

CREATE TABLE "usr" (
	"id" SERIAL PRIMARY KEY,
	"username" TEXT NOT NULL UNIQUE,
	"password" VARCHAR(255) NOT NULL
);

CREATE TABLE "role" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "user_roles" (
    "user_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usr(id),
    FOREIGN KEY (role_id) REFERENCES role(id),
    UNIQUE (user_id, role_id)
);


CREATE TABLE "accident" (
	"id" SERIAL PRIMARY KEY,
	"date_accident" DATE NOT NULL,
	"damage_comm" TEXT NOT NULL,
	"repair_cost" INTEGER NOT NULL
);

CREATE TABLE "client" (
	"id" SERIAL PRIMARY KEY REFERENCES "usr" ON DELETE CASCADE,
	"name" TEXT DEFAULT NULL,
	"surname" TEXT DEFAULT NULL,
	"email" TEXT DEFAULT NULL,
	"address" TEXT DEFAULT NULL,
	"passport" TEXT UNIQUE,
	"birthday" DATE DEFAULT NULL,
	"phone" TEXT DEFAULT NULL,
	"driver_lic_number" TEXT UNIQUE,
	"discount_id" INTEGER REFERENCES "discount" ON DELETE RESTRICT
);

CREATE TABLE "order" (
    "id" SERIAL PRIMARY KEY,
    "date_order" DATE NOT NULL,
    "plan_date_end" DATE NOT NULL,
    "date_end" DATE DEFAULT NULL,
    "client_id" INTEGER REFERENCES "client",
    "car_id" INTEGER REFERENCES "car",
    "accident_id" INTEGER REFERENCES "accident",
    "price" INTEGER NOT NULL,
    "total_price" INTEGER,
    "status_order_id" INTEGER NOT NULL
);

CREATE TABLE "usr_client"(
    "user_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usr (id),
    FOREIGN KEY (client_id) REFERENCES client (id),
    UNIQUE (user_id, client_id)
);

/*CREATE TABLE "staff" (
	"id" INTEGER PRIMARY KEY REFERENCES "usr" ON DELETE CASCADE,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"post" TEXT NOT NULL
  );*/


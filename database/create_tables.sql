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
	"class_id" INTEGER NOT NULL REFERENCES "class" ON DELETE CASCADE,
	"make_of_car" TEXT NOT NULL,
	"model_of_car" TEXT NOT NULL,
	"transmission_id" INTEGER NOT NULL REFERENCES "transmission" ON DELETE CASCADE,
	"type_id" INTEGER NOT NULL REFERENCES "type" ON DELETE CASCADE,
	"fuel_id" INTEGER NOT NULL REFERENCES "fuel" ON DELETE CASCADE,
	"avg_fuel_cons" REAL NOT NULL,
	"power" INTEGER NOT NULL,
	"capacity" INTEGER NOT NULL,
	"years_of_production" TEXT NOT NULL
);
 
CREATE TABLE "price" (
	"id" INTEGER PRIMARY KEY,
	"cost1" INTEGER NOT NULL,
	"cost4" INTEGER NOT NULL,
	"cost8" INTEGER NOT NULL
);

ALTER TABLE "price" ADD FOREIGN KEY (id) REFERENCES "model"(id) ON DELETE CASCADE;

CREATE TABLE "option" (
	"id" INTEGER PRIMARY KEY REFERENCES "model" ON DELETE CASCADE,
	"air_cond" SMALLINT NOT NULL CHECK ("air_cond" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"power_windows" SMALLINT NOT NULL CHECK ("power_windows" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"seat_heating" SMALLINT NOT NULL CHECK ("seat_heating" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"wheel_heating" SMALLINT NOT NULL CHECK ("wheel_heating" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"parking_sensors" SMALLINT NOT NULL CHECK ("parking_sensors" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"cruise_control" SMALLINT NOT NULL CHECK ("cruise_control" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"CD/MP3/USB" SMALLINT NOT NULL CHECK ("CD/MP3/USB" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"bluetooth" SMALLINT NOT NULL CHECK ("bluetooth" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"leather_interior" SMALLINT NOT NULL CHECK ("leather_interior" IN (0, 1))
	/*
	 * 0 - NO
	 * 1 - YES
	 */
);

CREATE TABLE "car" (
	"id" SERIAL PRIMARY KEY,
	"model_id" INTEGER NOT NULL REFERENCES "model" ON DELETE CASCADE,
	"reg_number_auto" VARCHAR(7) NOT NULL,
	"rented" SMALLINT NOT NULL CHECK ("rented" IN (0, 1)),
	/*
	 * 0 - NO
	 * 1 - YES
	 */
	"year_of_issue" VARCHAR(4) NOT NULL,
	"color" TEXT NOT NULL,
	"on_repair" SMALLINT NOT NULL CHECK ("on_repair" IN (0, 1))
	/*
	 * 0 - NO
	 * 1 - YES
	 */
);

CREATE TABLE "discount" (
	"id" SERIAL PRIMARY KEY,
	"discount_name" TEXT NOT NULL,
	"percent" NUMERIC (2, 2) NOT NULL
);

CREATE TABLE "usr" (
	"id" SERIAL PRIMARY KEY,
	"username" TEXT NOT NULL UNIQUE,
	"password" VARCHAR(255) NOT NULL,
    "is_active" BOOLEAN NOT NULL
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
	"car_id" INTEGER NOT NULL REFERENCES "car" ON DELETE RESTRICT,
	"damage_comm" TEXT NOT NULL,
	"repair_cost" INTEGER NOT NULL
);

CREATE TABLE "client" (
	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"email" TEXT DEFAULT NULL,
	"address" TEXT NOT NULL,
	"passport" TEXT NOT NULL UNIQUE,
	"birthday" DATE NOT NULL,
	"phone" TEXT NOT NULL,
	"driver_lic_number" TEXT NOT NULL,
	"discount_id" INTEGER NOT NULL REFERENCES "discount" ON DELETE RESTRICT
);

CREATE TABLE "order" (
	"id" SERIAL PRIMARY KEY,
	"date_order" DATE NOT NULL,
	"plan_date_end" DATE NOT NULL,
	"date_end" DATE DEFAULT NULL,
	"order_days" SMALLINT NOT NULL,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT,
	"car_id" INTEGER NOT NULL REFERENCES "car" ON DELETE RESTRICT,
	"price" INTEGER NOT NULL,
	"accident_id" INTEGER NOT NULL REFERENCES "accident" ON DELETE RESTRICT,
	"total_price" INTEGER NOT NULL
);

CREATE TABLE "staff" (
	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"post" TEXT NOT NULL
);

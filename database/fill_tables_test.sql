INSERT INTO "class"
------------------------------------
("id", 		 "name"         ) VALUES
------------------------------------
(   1,     'Эконом класс'   ),
(   2,     'Средний класс'  ),
(   3,     'Бизнес класс'   ),
(   4,     'Кроссовер'      ),
(   5,     'Минивэн'        );
SELECT setval('class_id_seq', 5);

INSERT INTO "fuel"
------------------------------------
("id", 		 "name"         ) VALUES
------------------------------------
(   1,     'АИ-92'   ),
(   2,     'АИ-95'  ),
(   3,     'АИ-98'   ),
(   4,     'АИ-100'   ),
(   5,     'Дизель'   );
SELECT setval('type_id_seq', 5);

INSERT INTO "type"
------------------------------------
("id", 		 "name"         ) VALUES
------------------------------------
(   1,     'Седан'   ),
(   2,     'Хэтчбэк'  ),
(   3,     'Универсал'   ),
(   4,     'Кроссовер'   ),
(   5,     'Минивэн'   ),
(   6,     'Купэ'   );
SELECT setval('type_id_seq', 6);

INSERT INTO "transmission"
------------------------------------
("id", 		 "name"         ) VALUES
------------------------------------
(   1,     'Механическая'   ),
(   2,     'Автоматическая'  ),
(   3,     'Вариатор'   ),
(   4,     'Робот'   );
SELECT setval('type_id_seq', 4);

INSERT INTO "model"
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
("id", "class_id", "make_of_car"     , "model_of_car", "transmission_id", "type_id", "fuel_id"   , "avg_fuel_cons", "power", "capacity" , "years_of_production" ) VALUES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
(   1,     1     , 'VOLKSWAGEN'      ,    'POLO'     ,   	   1	     ,   1	   , 	 2	  	 ,		6.4      ,	 110   ,	1598	,		'2015-...'		),
(   2,     1     ,   'TOYOTA'        ,    'YARIS'    ,   	   1		 , 	 2     ,     2	     ,		5.0      ,	 111   ,	1496	,		'2014-...'		),
(   3,     1     , 	  'LADA'         ,    'GRANTA'   ,   	   1		 , 	 2     ,     2	     ,		6.5      ,	 106   ,	1596	,		'2011-2018'		),
(   4,     1     ,   'RENAULT'       ,    'LOGAN'    ,    	   1		 ,   1	   ,     2	     ,		7.1      ,	 82    ,	1598	,		'2018-...'		),
(   5,     1     ,   'HYUNDAI'       ,    'ACCENT'   ,   	   1		 ,   1     ,     2	     ,		7.2      ,	 140   ,	1591	,		'2010-...'		),
(   6,     1     ,    'FORD'         ,    'FIESTA'   ,   	   1		 ,   1	   ,     2	     ,		5.9      ,	 105   ,	1591	,		'2012-...'		),
(   7,     4     ,    'RENAULT'      ,    'KAPTUR'   ,   	   2		 ,   4	   ,     2	     ,		6.8      ,	 143   ,	1998	,		'2016-2020'		),
(   8,     1     ,   'HYUNDAI'       ,    'SOLARIS'  ,   	   1		 ,   1	   ,     2	     ,		6.3      ,	 123   ,	1591	,		'2017-2020'		),
(   9,     1     ,   'NISSAN'        ,    'ALMERA'   ,   	   2		 ,   1	   ,     2	     ,		7.2      ,	 102   ,	1597	,		'2012-...'		),
(  10,     2     , 'VOLKSWAGEN'      ,    'POLO'     ,   	   2		 ,   1	   ,     2	     ,		7.0      ,	 110   ,	1598	,		'2015-...'		),
(  11,     2     ,   'SKODA'         ,    'RAPID'    ,   	   2		 ,   2     ,     2	     ,		6.4      ,	 110   ,	1598	,		'2017-2019'		),
(  12,     2     ,   'HYUNDAI'       ,    'ACCENT'   ,   	   2		 ,   1     ,     2	     ,		7.8      ,	 140   ,	1591	,		'2010-...'		),
(  13,     2     ,   'HYUNDAI'       ,    'SOLARIS'  ,   	   2		 ,   1     ,     2	     ,		6.6      ,	 123   ,	1591	,		'2017-2020'		),
(  14,     2     ,   'HYUNDAI'       ,    'ELANTRA'  ,   	   2		 ,   1     ,     2	     ,		7.4      ,	 150   ,	1999	,		'2016-2019'		),
(  15,     2     ,    'KIA'          ,    'RIO'      ,   	   2		 ,   1     ,     2	     ,      5.5      ,	 123   ,	1591	,		'2017-...'		),
(  16,     2     , 'VOLKSWAGEN'      ,    'JETTA'    ,   	   4		 ,   1     ,     2	     ,      6.5      ,	 110   ,	1598	,		'2014-2018'		),
(  17,     2     , 'VOLKSWAGEN'      ,    'GOLF'     ,   	   4		 ,   2     ,     2	     ,      5.2      ,	 150   ,	1395	,		'2017-2019'		),
(  18,     2     ,   'TOYOTA'        ,    'COROLLA'  ,   	   3		 ,   1     ,     2	     ,      6.3      ,	 122   ,	1598	,		'2016-2018'		),
(  19,     5     ,   'DODGE'         ,    'CARAVAN'  ,   	   2		 ,   5     ,     1	     ,      11.2     ,	 173   ,	3301	,		'2007-2010'		),
(  20,     3     , 'BMW 5-SERIES'    ,    'G30'      ,   	   2		 ,   3     ,     5	     ,      4.7      ,	 265   ,	2993	,		'2016-...'		),
(  21,     3     , 'BMW 7-SERIES'    ,    'G12 LONG' ,   	   1		 ,   1     ,     2	     ,      9.5      ,	 530   ,	4395	,		'2019-...'		),
(  22,     3     , 'MERCEDES C-KLASS',    'W205'     ,   	   1		 ,   1     ,     2	     ,      5.6      ,	 211   ,	1991	,		'2013-2018'		),
(  23,     3     , 	  'FORD'         ,    'MONDEO'   ,   	   1		 ,   1     ,     2	     ,      9.0      ,	 240   ,	1999	,		'2013-...'		),
(  24,     3     , 'VOLKSWAGEN'      ,    'PASSAT B8',   	   4		 ,   1     ,     2	     ,      5.8      ,	 180   ,	1798	,		'2014-2019'		),
(  25,     3     ,    'LEXUS'        ,    'LS'       ,   	   1		 ,   1     ,     2	     ,      10.7     ,	 386   ,	4608	,		'2012-2017'		),
(  26,     3     ,    'MAZDA'        ,    '6'        ,   	   1		 ,   1     ,     2	     ,      6.1      ,	 150   ,	1998	,		'2015-2018'		),
(  27,     3     ,   'TOYOTA'        ,    'CAMRY'    ,   	   1		 ,   1     ,     2	     ,      10.5     ,	 249   ,	3456	,		'2014-2017'		),
(  28,     3     ,     'AUDI'        ,    'RS6'      ,   	   4		 ,   3     ,     3	     ,      9.8     ,	 560   ,	3993	,		'2013-...'		),
(  29,     3     ,     'BMW'         ,    'M4'       ,   	   1		 ,   6     ,     3	     ,      8.3     ,	 431   ,	1979	,		'2013-...'		),
(  30,     5     ,  'VOLKSWAGEN'     ,    'SHARAN'   ,   	   4		 ,   5     ,     5	     ,      5.2     ,	 150   ,	1968	,		'2015-...'		);
SELECT setval('model_id_seq', 30);

INSERT INTO "price"
------------------------------------
("id",  "cost1"   ,  "cost4"   , "cost8"   ) VALUES
------------------------------------
(   1,   7400     ,   6300     ,  5900     ),
(   2,   7700     ,   6600     ,  6200     ),
(   3,   5900     ,   5300     ,  4800     ),
(   4,   8000     ,   7400     ,  6900     ),
(   5,   6300     ,   5900     ,  5300     ),
(   6,   6900     ,   6300     ,  5900     ),
(   7,   8200     ,   7600     ,  6400     ),
(   8,   8000     ,   7400     ,  6300     ),
(   9,   6300     ,   6300     ,  6300     ),
(  10,   9500     ,   8400     ,  6300     ),
(  11,   9500     ,   8400     ,  6300     ),
(  12,   7400     ,   6300     ,  5900     ),
(  13,   6900     ,   6300     ,  5900     ),
(  14,   9500     ,   9000     ,  8400     ),
(  15,   7400     ,   6300     ,  5900     ),
(  16,   11000    ,   9900     ,  8800     ),
(  17,   6900     ,   6300     ,  5900     ),
(  18,   9500     ,   8400     ,  7400     ),
(  19,   7400     ,   6300     ,  5900     ),
(  20,   33000    ,   28600    ,  24200    ),
(  21,   43800    ,   39600    ,  35200    ),
(  22,   17400    ,   15800    ,  14100    ),
(  23,   14300    ,   11000    ,  8800     ),
(  24,   10600    ,   9700     ,  8800     ),
(  25,   17600    ,   15800    ,  14100    ),
(  26,   14100    ,   12300    ,  10600    ),
(  27,   13200    ,   13200    ,  13200    ),
(  28,   17600    ,   14100    ,  13200    ),
(  29,   39600    ,   35200    ,  33000    ),
(  30,   7400     ,   6300     ,  5900     );

INSERT INTO "option"
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
("id", "air_cond", "power_windows" , "seat_heating", "wheel_heating", "parking_sensors", "cruise_control",     "CD/MP3/USB"     , "bluetooth", "leather_interior") VALUES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(   1,     0     ,        1        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     0      ,          0        ),
(   2,     1     ,        1        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     0      ,          0        ),
(   3,     0     ,        0        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     0      ,          0        ),
(   4,     0     ,        0        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           0          ,     0      ,          0        ),
(   5,     1     ,        1        ,        0      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     0      ,          0        ),
(   6,     1     ,        1        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     0      ,          0        ),
(   7,     1     ,        1        ,        0      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     0      ,          0        ),
(   8,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  0          ,           1          ,     1      ,          0        ),
(   9,     1     ,        0        ,        1      ,   	 	0	    , 	  	0          , 	  0          ,           1          ,     1      ,          0        ),
(  10,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     0      ,          0        ),
(  11,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  0          ,           1          ,     1      ,          0        ),
(  12,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  13,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  0          ,           1          ,     1      ,          0        ),
(  14,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  15,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  16,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  17,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  18,     1     ,        1        ,        1      ,   	 	0	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  19,     1     ,        1        ,        1      ,   	 	0	    , 	  	0          , 	  1          ,           1          ,     0      ,          0        ),
(  20,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  21,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  22,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  23,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  24,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  25,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        ),
(  26,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  27,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  28,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  29,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          1        ),
(  30,     1     ,        1        ,        1      ,   	 	1	    , 	  	1          , 	  1          ,           1          ,     1      ,          0        );

INSERT INTO "car"
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
("id", "model_id", "reg_number_auto" , "rented", "year_of_issue",  "color"  , "on_repair") VALUES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(   1,     1     ,     '7285AT2'     ,    0    ,      2018      ,  'белый'  , 	  0      ),
(   2,     1     ,     '7286AT2'     ,    0    ,      2018      ,  'черный' , 	  0      );
SELECT setval('car_id_seq', 2);

INSERT INTO "usr"
--------------------------------------------
("id", "username"   , "password") VALUES
--------------------------------------------
(1   , 'admin'   , '$2y$12$MRJE5qgeprGrw1cV2rgog.IJ1wOIadaUXKOPFs2FEZUfWEIxJB4Sm'),
(2   , 'manager' , '$2y$12$OjydToXkj079ZrR9xzpKvOMeHQix61mt9Yy4jeaQyMH0isLhhZnF.'),
(3   , 'operator', '$2y$12$AbPuEfKMfM1FqtNcK7E7heqGOPSN6z9dAK3E1ti/7z4C.Kb6BZEj.');
SELECT setval('usr_id_seq', 3);

INSERT INTO "role"
------------------------------------
("id", 		 "name"         ) VALUES
------------------------------------
(   1,     'ROLE_ADMIN'   ),
(   2,     'ROLE_MANAGER'  ),
(   3,     'ROLE_OPERATOR'   ),
(   4,     'ROLE_USER'      );
SELECT setval('role_id_seq', 4);

INSERT INTO "usr_roles"
------------------------------------
("users_id", "roles_id" ) VALUES
------------------------------------
(   1   ,     1  ),
(   2   ,     2  ),
(   3   ,     3  );






INSERT INTO "discount"
--------------------------------------------
("id", "discount_name"  , "percent") VALUES
--------------------------------------------
(1   , 'Скидка 0%'      ,    1.00  ),
(2   , 'Скидка 10%'     ,    0.90  ),
(3   , 'Скидка 20%'     ,    0,80  );

SELECT setval('discount_id_seq', 3);

/*INSERT INTO "admin"
----------------------------------
("id", "hardware_key"     ) VALUES
----------------------------------
(   1, 'ROOT_HARDWARE_KEY'),
(   2, 'ADMN_HARDWARE_KEY');

INSERT INTO "client"
--------------------------------------------------------
("id", "email"           , "phone"              ) VALUES
--------------------------------------------------------
(   3, 'vera@gmail.com'  , '+375 (29) 123-45-67'),
(   4, 'nadezhda@mail.ru', '+375 (33) 987-65-43'),
(   5, 'lubov@tut.by'    , '+375 (25) 555-55-55');*/

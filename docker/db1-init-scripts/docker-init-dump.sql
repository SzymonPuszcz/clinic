CREATE TABLE public.patients (
    id uuid NOT NULL,
    address character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL
);
ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);

---------------------------------------------------

CREATE TABLE public.doctors (
    id uuid NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    specialisation character varying(255) NOT NULL
);
ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);

---------------------------------------------------

CREATE TABLE public.appointments (
    id uuid NOT NULL,
    location character varying(255) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    doctor_id uuid NOT NULL,
    patient_id uuid NOT NULL
);
ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk8exap5wmg8kmb1g1rx3by21yt FOREIGN KEY (patient_id) REFERENCES public.patients(id);

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fkmujeo4tymoo98cmf7uj3vsv76 FOREIGN KEY (doctor_id) REFERENCES public.doctors(id);

---------------------------------------------------

INSERT INTO public.doctors (id,first_name,last_name,specialisation) VALUES
('1b243259-f668-44dd-a58a-e30b1d3a4b99','Jimmy','Jast','DENTIST'),
('51fb81ed-88ac-481b-95eb-78e3ee41c422','Tova','Howe','SURGEON'),
('4e471425-9b0d-4885-a6a2-061f909f79f9','Addie','Rempel','PHYSIOTHERAPIST'),
('b223924c-781f-4ccc-8ccb-4c17290aa8eb','Shanon','Buckridge','PHYSIOTHERAPIST'),
('59fcff90-dbfa-4497-a820-4de4c0a2b4dc','Hiedi','Roob','PHYSIOTHERAPIST'),
('de2e77ce-f41f-4c6e-a750-24b70d1ecd33','Lenard','Hyatt','PHYSIOTHERAPIST'),
('5e578001-54a4-472a-baf2-dfb52864ffef','Quinton','Sipes','PHYSIOTHERAPIST'),
('50824d5b-6d5b-40c7-ba4a-696212c6913d','Dallas','Rohan','DENTIST'),
('6855b9ff-b625-4f55-9d6a-3b6a192a343e','Basil','Windler','DENTIST'),
('2889d790-08f4-4458-843f-92721d26df1b','Jerold','Veum','PHYSIOTHERAPIST');

---------------------------------------------------

INSERT INTO public.patients (id,address,first_name,last_name) VALUES
('6e50a355-f6de-4046-ad97-a90a7b4a498d','2603 Hiedi Cove, Cormiermouth, CO 90363-3108','Jimmy','Jast'),
('777d3cf5-4696-4575-942a-fb63e5623c3c','54757 Fritz Street, North Chere, LA 33086','Chanelle','Morissette'),
('be640dc9-824f-47f5-bdd4-d1b20eb61d58','013 Louie Loaf, Keenanton, WV 93360-5304','Sadie','Gorczany'),
('580e3a06-5bc5-4722-94cc-062959b080dc','96680 Volkman Orchard, Schustershire, WI 02931-9652','Jesus','Hintz'),
('d8c587df-e176-4571-8558-ff8a26d99497','233 Tamar Fork, Port Muoi, CT 22282','Petronila','Lebsack'),
('59fb5fcf-b62a-4ed5-b178-26cb808c28f9','Apt. 515 190 Dirk Pass, East Yolando, NV 12146','Jerrell','Marquardt'),
('397c8dc8-88b0-4a98-8c19-3421f62c0023','Apt. 692 690 Huels Roads, Kerlukeborough, TN 94565','Cody','Fisher'),
('a1b0dcf2-0d50-46fe-a46d-83f819b998a4','889 OConnell Points, Priceborough, KY 72140','Eleonor','Feest'),
('5389cdc1-169e-4a81-963d-3a0b16472e40','363 Mante Field, Delmarland, GA 47578','Asa','Legros'),
('209434d4-35fd-4764-9558-ec1baf5ba0c3','10535 Rohan Circles, Bodeville, SD 15359','Zachary','Johns');
INSERT INTO public.patients (id,address,first_name,last_name) VALUES
('2c6535ff-625a-47e4-a951-02e66e9d3e5c','0810 Buckridge Trace, Adamshaven, KY 96632-7927','Delbert','McDermott'),
('fb34a288-8266-482d-a1cb-69d66a01a817','7946 Xavier Extension, Romeohaven, SD 09336','Renaldo','Cassin'),
('85f5741b-b837-4c02-8c3c-a36c8d95c08e','9162 Elenore Cliffs, North Noahmouth, VT 83176-6731','Tammie','Bahringer'),
('f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df','Apt. 627 23702 Kenda Rapids, Port Jeraldine, TX 64566-0518','Josh','Schuppe'),
('79764974-8658-4d8e-8049-7e00913660f0','Suite 208 95676 Thomas Corner, Aliburgh, AZ 20377','Bart','Dooley'),
('065a5903-2b58-4a40-9ce6-620f8279e39d','Apt. 309 8354 Mraz Shoal, Kautzerville, MA 57843','Howard','Kilback'),
('6c68fbb9-d4e1-44e6-a276-458654452a7c','211 Shayne Trail, North Kyle, NJ 20808','Doyle','Rempel'),
('7037320f-1e5f-4b23-bc25-8802da653bda','47766 Lauretta Skyway, North Bernita, NY 40556-7858','Yetta','Langosh'),
('04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7','1078 Gertha Park, Boscoville, DE 82442-0650','Florence','Hessel'),
('2de01975-8d69-4d00-a628-ee98f9763c61','Suite 824 71789 Luettgen Place, East Harveymouth, HI 18738-7724','Maxima','Dare');
INSERT INTO public.patients (id,address,first_name,last_name) VALUES
('3ad2db91-e609-4f31-ab2a-656f309707f8','3637 Donald Burg, Felixshire, NC 55324-2329','Marshall','DuBuque'),
('aa6314df-200d-4451-96c8-b5a297640fb3','138 Howe Prairie, West Romona, OK 35982','Juana','Kirlin'),
('32779e92-bbf5-4a8c-ba32-37cc179b6de4','Apt. 690 87739 Tony Cliffs, Missymouth, AK 88200-6874','Dewayne','Haag'),
('c5d2d192-90d5-4b73-a0cd-d79053d5b2b8','Suite 288 31819 Royal Place, North Rodgerland, WI 96120-1581','Darius','Farrell'),
('26d083cf-13fd-4cbc-98ff-9f16f96e6da7','066 Beier Crossing, Teodoroside, IN 98957','Benjamin','Cremin'),
('5c94e789-311a-409a-ad96-3e39283321ae','Apt. 518 0823 Emmy Rapids, Leannonville, TX 88748','Melynda','Klocko'),
('68f1fe4d-eb17-40ef-bfcc-b755b222872b','Apt. 492 3304 Nadia Causeway, Stacyberg, WA 69041','Shane','Orn'),
('f104d833-606c-46eb-8f2b-0d7535d36887','09862 Murray Springs, Richardburgh, LA 23472-0651','Jonna','Walker'),
('0bc37c43-2557-476a-9d9e-11b927b8c4dc','Suite 647 31351 Stehr Knoll, Mikaport, AR 51817','Van','Schinner'),
('edd414ad-5247-4171-8c03-d660d5062cf5','Suite 280 28151 Norbert Rapids, East Garlandchester, AK 24331','Agustin','Fisher');
INSERT INTO public.patients (id,address,first_name,last_name) VALUES
('f2267b1a-877b-43d6-9333-62386451d605','Suite 643 9528 Rau Village, West Kasie, LA 36564-2293','Marketta','Rowe'),
('d771208e-5772-47e7-b727-ad8378b35a1d','5671 Magaly Junction, Port Manual, NV 20829-3371','Darius','Altenwerth'),
('3ecdd708-83ff-4cde-8b24-9356e2737b68','6182 Moen Landing, North Elisha, AL 00285','Cameron','Smith'),
('cb533843-4d0e-4f85-a9f9-ac03988e392f','23475 Heidenreich Stravenue, Mathafurt, ND 52095','Dong','Mueller'),
('52beb772-69bc-4342-a5c3-e2e42b2ecf40','Apt. 807 4251 Moshe Fords, Charleyton, WV 12286-0280','Jolanda','Block'),
('58ff749b-d192-4fdb-9d8c-2c71beddb023','Suite 681 79729 Dominique Expressway, Port Lawrencetown, NY 28666-4067','Cornell','Corkery'),
('d2ab998a-4c2d-4cc9-ac5f-59cbeb4ca4be','23534 Price Alley, Port Jintown, MD 34320','Delbert','Kreiger'),
('34cbc92c-b9f9-4729-9242-d4b729eb05eb','358 Rubin Club, Maribethshire, OH 52912-7440','Alisha','Davis'),
('8801d6d4-b869-4fb5-a039-d4c128813520','92823 Keeling Rapids, Lake Jerrold, MO 96708','Valery','Rogahn'),
('517b78de-b4f0-46f7-919d-ff92f274fef3','Suite 626 618 Santo Shores, Friesenfort, VA 66030','Cora','Pollich');
INSERT INTO public.patients (id,address,first_name,last_name) VALUES
('a7fbd0cb-ac54-4257-a09f-eaa00da5ca95','3613 Joie Rapid, Larissashire, SD 00854','Millicent','Conner'),
('5956d9ec-67aa-467e-b31a-d865014a5239','Apt. 505 3998 Major Mountain, New Carminestad, UT 23917-1039','Damion','OReilly'),
('a581fa75-4373-413a-ab81-7b5350c90cb0','Suite 188 771 Kessler Prairie, West Jeffery, RI 52936-6152','Joesph','Morar'),
('9d27ed42-06f2-4854-b09f-46803e152c00','325 Dickens Island, North Williams, FL 69460','Daina','Russel'),
('12083ed6-11db-49a4-8ca4-4ef4c10f4b53','Apt. 498 7987 Satterfield Cove, Crissymouth, RI 56249','Lashell','Prohaska'),
('1a45bbc3-141c-43ee-9771-837f0ec66bb0','Apt. 387 8723 Bogan Island, Hilllport, AR 28010','Rodolfo','Christiansen'),
('3a8a200d-a059-4d56-8683-04d082ea87bd','42237 Moon Rue, Lake Victorview, OK 89540','Otto','Zieme'),
('7e718eb7-3942-4ee4-8b0d-c56a3ceec090','943 Lubowitz Bypass, Lake Blancastad, LA 03045','Theron','Larkin'),
('dd2425e2-b7e9-46e5-a49a-297ba5e3569c','1396 Sonja Ports, New Jameberg, GA 30092-1038','Maria','Lind'),
('29d24ccb-ac96-43f3-b824-c6a546616933','Apt. 493 32879 Volkman Fall, Elishaville, ID 80709-5026','Will','Steuber');

---------------------------------------------------

INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('61a9c0fb-1e81-447c-beda-b3ee3afb6ee8','Apt. 626 039 Heller Mount, Port Shanonmouth, MA 03633-1087','2021-05-10 20:53:47','2889d790-08f4-4458-843f-92721d26df1b','edd414ad-5247-4171-8c03-d660d5062cf5'),
('74e39ada-11d7-4e6e-ad76-7060643da491','375 Chere Estate, Lake Tempie, NM 47573','2021-08-26 14:42:44','4e471425-9b0d-4885-a6a2-061f909f79f9','85f5741b-b837-4c02-8c3c-a36c8d95c08e'),
('12235d77-f09b-4d73-917d-a9ce9cfd27ec','9214 Bosco Spring, Romaguerabury, CT 48959','2022-02-26 04:05:01','4e471425-9b0d-4885-a6a2-061f909f79f9','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('467e1641-dc84-4a27-8f6a-2572fed31c99','273 Susann Underpass, North Jenae, NJ 94897','2022-07-14 21:30:05','4e471425-9b0d-4885-a6a2-061f909f79f9','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('87d4ea38-64a7-4c4c-a6a9-594dc035bd1e','Apt. 965 26471 Joaquin Views, West Melissiaview, MS 10656-9688','2022-09-10 01:18:32','5e578001-54a4-472a-baf2-dfb52864ffef','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('322ec50b-8470-4fba-9077-083aa5e08440','5273 Schultz Grove, East Lonnybury, MN 37134','2022-02-06 18:43:28','4e471425-9b0d-4885-a6a2-061f909f79f9','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('4b0dd8ba-f71e-44ad-830e-e0f1ed91900e','2146 Mikel Cove, Lake Lillian, WV 00500','2021-08-13 22:33:43','2889d790-08f4-4458-843f-92721d26df1b','fb34a288-8266-482d-a1cb-69d66a01a817'),
('72420e74-e413-422a-ac1b-29be70f681ec','69094 Loan Greens, East Teddy, MO 56521-8368','2022-01-20 23:24:35','2889d790-08f4-4458-843f-92721d26df1b','58ff749b-d192-4fdb-9d8c-2c71beddb023'),
('130b20fc-2111-4bc5-80ed-9d814754377d','40038 Refugio Circles, North Erikmouth, UT 84591-3351','2021-05-15 18:52:45','50824d5b-6d5b-40c7-ba4a-696212c6913d','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('285999a1-16ef-440c-aed1-6e2c7057ca1c','6970 Kessler Ways, Toryport, AR 30661-0811','2022-05-23 21:04:04','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','5956d9ec-67aa-467e-b31a-d865014a5239');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('7336af16-99ee-4860-bfe4-c9a0322c5223','Suite 906 47579 Elmer River, Julianeberg, VA 64081','2022-07-24 15:39:12','5e578001-54a4-472a-baf2-dfb52864ffef','f2267b1a-877b-43d6-9333-62386451d605'),
('72e727dd-737d-41da-b789-a68c42dc55dd','Apt. 008 9277 Eldridge Radial, West Cliffordfurt, UT 35137-9460','2021-06-18 12:10:48','1b243259-f668-44dd-a58a-e30b1d3a4b99','5956d9ec-67aa-467e-b31a-d865014a5239'),
('384ffbfb-a6d3-4b39-8678-1151210c29e3','Apt. 754 988 Jule Flat, Port Torrieborough, AZ 91628','2021-05-02 03:55:47','5e578001-54a4-472a-baf2-dfb52864ffef','d8c587df-e176-4571-8558-ff8a26d99497'),
('6ca20906-9ec7-478e-b0ad-1d9fc4571f6c','1823 Feil Island, Port Joshland, OR 98471','2022-09-11 06:46:56','6855b9ff-b625-4f55-9d6a-3b6a192a343e','9d27ed42-06f2-4854-b09f-46803e152c00'),
('cf188403-4f8c-4b74-9ed2-e6b9c4878d10','4566 Marvin Crossing, Port Jerica, CT 05181-2694','2022-07-07 11:17:45','b223924c-781f-4ccc-8ccb-4c17290aa8eb','5389cdc1-169e-4a81-963d-3a0b16472e40'),
('1151b0f3-5e37-4a6e-b2c8-9a14fbf8909c','Suite 089 56762 Weber Crossroad, West Thomas, AZ 03773','2022-08-05 04:16:40','2889d790-08f4-4458-843f-92721d26df1b','8801d6d4-b869-4fb5-a039-d4c128813520'),
('ef3c00a3-2b6c-41c2-a9c0-951919bfc89b','7309 Jamal Curve, Junitaview, TN 83545-7843','2021-07-17 09:37:10','b223924c-781f-4ccc-8ccb-4c17290aa8eb','d771208e-5772-47e7-b727-ad8378b35a1d'),
('d6fa0697-5de5-4063-b722-fd3535de1458','Apt. 482 112 Kyle Meadows, New Maye, OR 08087','2021-08-12 05:29:04','5e578001-54a4-472a-baf2-dfb52864ffef','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8'),
('b42caa2c-7fa3-4790-ad2e-578b456a7d70','Apt. 647 76640 Mitchel Springs, Lake Marlene, MT 55678-5807','2022-05-06 02:22:48','50824d5b-6d5b-40c7-ba4a-696212c6913d','d771208e-5772-47e7-b727-ad8378b35a1d'),
('a38f8f18-39b4-4adb-b78f-cddbddb26753','Apt. 361 3008 Joie Rapid, Larissashire, SD 54493','2022-06-21 19:32:40','1b243259-f668-44dd-a58a-e30b1d3a4b99','1a45bbc3-141c-43ee-9771-837f0ec66bb0');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('4ff981b3-04a4-46ad-9043-a088279e15fe','1078 Gertha Park, Boscoville, DE 82442-0650','2021-07-27 18:07:18','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('b406f7d4-3ac7-4127-be4d-382dfa089b81','8036 Vince Alley, Franklinside, AL 82471-7891','2022-06-17 20:21:44','5e578001-54a4-472a-baf2-dfb52864ffef','7e718eb7-3942-4ee4-8b0d-c56a3ceec090'),
('6ad49c5e-9247-4a7f-b06c-3239e9c6875b','42346 Faustino Fields, North Marshall, RI 00144','2022-10-30 05:55:15','b223924c-781f-4ccc-8ccb-4c17290aa8eb','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('55787969-0ce4-4cd5-9e00-226d96bdeee2','Apt. 933 555 Connie Trafficway, New Brendanberg, NV 88269-3931','2022-02-09 23:15:49','1b243259-f668-44dd-a58a-e30b1d3a4b99','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('590bee40-d1db-4066-b3bb-54e1fdde82be','1718 Hessel Circle, Dewayneshire, MT 92834-1986','2021-05-13 18:37:57','4e471425-9b0d-4885-a6a2-061f909f79f9','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('91abf58c-6d60-4fed-a8c6-1be6572426a2','068 Daugherty Rue, Lueilwitzbury, DE 74915','2022-08-26 11:24:32','2889d790-08f4-4458-843f-92721d26df1b','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('59c99773-b67f-4695-8a95-c5bedad9063f','Suite 288 31819 Royal Place, North Rodgerland, WI 96120-1581','2021-12-04 10:00:52','50824d5b-6d5b-40c7-ba4a-696212c6913d','7e718eb7-3942-4ee4-8b0d-c56a3ceec090'),
('137d547c-b394-4e68-8ba3-c3c7676467c7','Suite 106 698 Polly Route, North Bertram, CT 95741-0115','2021-08-24 06:34:45','51fb81ed-88ac-481b-95eb-78e3ee41c422','8801d6d4-b869-4fb5-a039-d4c128813520'),
('2fc87ba8-31e3-4c96-b60f-1bb1041bc070','Apt. 238 8748 Gail Center, North Dimplebury, ME 09289','2022-09-26 21:32:07','4e471425-9b0d-4885-a6a2-061f909f79f9','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('bc1dfa6b-98ba-48ef-8531-e08263be885a','4923 Hickle Causeway, Port Edna, CA 30469','2021-06-12 17:09:37','6855b9ff-b625-4f55-9d6a-3b6a192a343e','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('73f22ed9-6845-4326-94c0-60fdd769d6c5','Apt. 019 9098 Mireya Estates, Lake Heideburgh, CO 62234-7206','2021-08-04 15:26:21','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','f2267b1a-877b-43d6-9333-62386451d605'),
('d7a852e9-5dc4-4d4c-b12c-2df4edd7d584','Suite 346 525 Kuvalis Vista, Schultzborough, TN 64731-3515','2022-02-23 22:14:16','5e578001-54a4-472a-baf2-dfb52864ffef','7037320f-1e5f-4b23-bc25-8802da653bda'),
('3909b82c-a0b3-4372-a1ea-d73a0dd39859','1021 Valeria Ramp, Heidenreichfurt, WV 55809-4280','2021-06-07 01:35:37','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','6c68fbb9-d4e1-44e6-a276-458654452a7c'),
('1ecc8ec3-17a3-4fc8-9a58-41769b8a3483','00770 Keneth Lock, West Brandenland, OK 99646-7764','2021-12-27 00:13:52','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','3ecdd708-83ff-4cde-8b24-9356e2737b68'),
('832eb472-9f1c-4942-a042-7b8fcebc1cb3','3224 Ethyl Prairie, South Berry, NC 88174','2022-06-09 17:40:03','50824d5b-6d5b-40c7-ba4a-696212c6913d','79764974-8658-4d8e-8049-7e00913660f0'),
('87894a46-a851-4004-a97a-866b7306dcbd','Apt. 082 933 Zulauf Junctions, Noahbury, CO 71500','2022-12-19 00:24:57','2889d790-08f4-4458-843f-92721d26df1b','edd414ad-5247-4171-8c03-d660d5062cf5'),
('43143221-009d-4ac8-9d24-106bc234c2bb','6182 Moen Landing, North Elisha, AL 00285','2021-03-17 19:45:15','4e471425-9b0d-4885-a6a2-061f909f79f9','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('de8196c9-51e8-41e2-802b-62e41bf91a61','Apt. 423 47552 Carlo Village, North Jewel, NJ 09510-9196','2021-04-11 00:41:59','5e578001-54a4-472a-baf2-dfb52864ffef','26d083cf-13fd-4cbc-98ff-9f16f96e6da7'),
('9d2cfa70-b292-406c-bccf-ae3535a60b43','Suite 742 5112 Brakus Shores, Moshemouth, IL 28602-8066','2021-04-25 13:51:22','5e578001-54a4-472a-baf2-dfb52864ffef','12083ed6-11db-49a4-8ca4-4ef4c10f4b53'),
('8c0f71fa-7579-410f-b12c-c34dff9c4f62','Suite 526 817 Vania River, South Palmer, CO 97292','2022-09-20 09:36:04','2889d790-08f4-4458-843f-92721d26df1b','32779e92-bbf5-4a8c-ba32-37cc179b6de4');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('d00444ad-c847-4c9e-8ce5-b739772b8273','Suite 195 52297 Schaefer Squares, North Dane, MO 45023','2022-11-20 10:44:12','2889d790-08f4-4458-843f-92721d26df1b','a7fbd0cb-ac54-4257-a09f-eaa00da5ca95'),
('a80b306e-1eda-4cc7-8204-35402d592629','Apt. 204 209 Davis Ferry, Harveymouth, VT 57414-9358','2022-12-05 01:29:53','4e471425-9b0d-4885-a6a2-061f909f79f9','f104d833-606c-46eb-8f2b-0d7535d36887'),
('b3002e7a-5db5-4ee4-b96e-aa11f6847621','Suite 741 92620 Paucek Drives, West Valeryfurt, IL 49928','2021-03-24 06:41:50','6855b9ff-b625-4f55-9d6a-3b6a192a343e','edd414ad-5247-4171-8c03-d660d5062cf5'),
('8d7a5ea4-64d5-4eac-9a16-4400b2e65701','Suite 439 92635 Dorla Track, North Joniberg, PA 62661','2022-03-06 12:41:01','b223924c-781f-4ccc-8ccb-4c17290aa8eb','3ad2db91-e609-4f31-ab2a-656f309707f8'),
('c3d6ad82-14a3-413b-b186-d41dbc3b2a1d','3793 McKenzie Wells, Lake Cythiafurt, AL 94719-8450','2022-11-23 15:54:57','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('0f8e2c8a-8ff9-44ad-98a8-cf3c679613d6','Suite 398 072 Cummings Common, Langworthview, RI 45888-0345','2022-07-27 18:23:27','6855b9ff-b625-4f55-9d6a-3b6a192a343e','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('9e0bbbce-c4e6-426f-9f36-b3ed3d4c5019','Apt. 615 2337 Jeremiah Park, New Kathrine, FL 41984','2021-03-25 20:06:20','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('412bd59a-d3dd-4747-b435-868e4f00026e','Suite 600 060 Jim Groves, Dietrichport, AZ 83882-2142','2021-08-19 11:35:51','50824d5b-6d5b-40c7-ba4a-696212c6913d','32779e92-bbf5-4a8c-ba32-37cc179b6de4'),
('33796c95-9889-4c10-ae7a-56e93088d0b1','49263 Sanford Turnpike, Lake Nikiahaven, IA 71183','2022-06-21 18:03:50','51fb81ed-88ac-481b-95eb-78e3ee41c422','0bc37c43-2557-476a-9d9e-11b927b8c4dc'),
('998fdc86-54ed-4d81-b964-e99210f60d2c','32801 Darrel Station, Lavellechester, CT 07002','2021-03-26 02:34:10','5e578001-54a4-472a-baf2-dfb52864ffef','3ecdd708-83ff-4cde-8b24-9356e2737b68');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('f775ba4f-f6b9-456b-bd8c-c19a7d07e9d5','Apt. 422 3789 Lockman Rue, West Shon, PA 54070','2021-10-28 23:37:41','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','9d27ed42-06f2-4854-b09f-46803e152c00'),
('ea894514-3222-44a6-b219-1653f9570c78','894 Guadalupe Center, Seanport, LA 30304','2021-10-12 04:54:50','6855b9ff-b625-4f55-9d6a-3b6a192a343e','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('d5979084-875c-4ed8-ac70-8cb57e0e9407','4855 Reynalda Landing, Lucinaside, WV 71396','2021-05-06 02:46:36','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','58ff749b-d192-4fdb-9d8c-2c71beddb023'),
('cdf6b383-e622-4a53-b9b6-f7dc18605e66','Apt. 179 167 Jillian Run, Trompburgh, IL 68217-5493','2022-04-22 11:40:04','b223924c-781f-4ccc-8ccb-4c17290aa8eb','85f5741b-b837-4c02-8c3c-a36c8d95c08e'),
('d30920e5-e478-4ad5-93c4-5322cf3ad07e','Apt. 107 3999 Josh Harbor, New Jorgeshire, SC 41064','2022-01-15 20:54:09','6855b9ff-b625-4f55-9d6a-3b6a192a343e','edd414ad-5247-4171-8c03-d660d5062cf5'),
('d76b7794-09eb-477d-a289-0c2836a611d8','Suite 561 1658 Wiegand Island, Gleasonburgh, NM 29707','2022-10-22 02:02:34','6855b9ff-b625-4f55-9d6a-3b6a192a343e','f2267b1a-877b-43d6-9333-62386451d605'),
('fb78c6a8-4251-40ce-a7cb-1f5b1d564683','63910 Wisoky Landing, North Sol, RI 79957','2021-10-08 19:01:33','6855b9ff-b625-4f55-9d6a-3b6a192a343e','0bc37c43-2557-476a-9d9e-11b927b8c4dc'),
('0da17c4f-36ba-4800-9b45-261f34a56a3d','Suite 714 36404 Reinaldo Forge, East Felix, MA 88980-2182','2022-07-25 05:33:24','50824d5b-6d5b-40c7-ba4a-696212c6913d','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8'),
('a65830fe-a679-4e7d-b907-437a97d833b7','937 Flatley Roads, Seematon, MD 90717-1148','2021-06-04 02:29:24','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','d2ab998a-4c2d-4cc9-ac5f-59cbeb4ca4be'),
('95485344-efc6-4ce7-809e-783d198dd19b','Apt. 998 07242 Witting Estate, South Antonettemouth, LA 67131-8305','2021-04-23 20:38:02','50824d5b-6d5b-40c7-ba4a-696212c6913d','397c8dc8-88b0-4a98-8c19-3421f62c0023');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('671615b2-6681-4837-a45e-9a0a35cc245b','848 Gretchen Loop, North Salfort, ND 15965-5453','2021-10-17 10:57:05','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','2de01975-8d69-4d00-a628-ee98f9763c61'),
('88b32d2f-0d3e-4d2e-b94a-1781fb794407','Suite 656 2155 Pouros Lights, Lake Shannonburgh, AL 53838-0144','2021-05-25 17:11:32','6855b9ff-b625-4f55-9d6a-3b6a192a343e','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('c059727d-df75-4cfb-aff5-a19a2084cd84','106 Kirk Groves, Carterville, NE 30569','2022-06-01 12:00:36','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('f910636c-a364-4afc-b600-951d9f4739f7','Apt. 150 5716 Torphy Village, Lake Shastahaven, WI 38272','2021-08-21 01:09:21','5e578001-54a4-472a-baf2-dfb52864ffef','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('ec9877c8-cc1b-44b9-bd58-c621ff88418d','Suite 092 67689 Nitzsche Well, Capriceport, TN 82946','2022-12-26 23:42:16','1b243259-f668-44dd-a58a-e30b1d3a4b99','580e3a06-5bc5-4722-94cc-062959b080dc'),
('8134f184-92d0-4977-95f6-76856b45aed6','1773 Cremin Cliffs, North Roxannview, TX 23155-0266','2021-11-03 03:40:35','4e471425-9b0d-4885-a6a2-061f909f79f9','9d27ed42-06f2-4854-b09f-46803e152c00'),
('cc26f2fc-d7bb-437a-9ca6-b494aa063fe1','Apt. 398 42694 Kirlin Vista, Johnsonhaven, WA 00653','2021-12-24 13:30:27','6855b9ff-b625-4f55-9d6a-3b6a192a343e','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('24653c75-704c-4a11-8966-74e3fc17565d','Suite 106 427 Harlan Cape, East Terranceburgh, OK 82862-5159','2022-08-29 00:22:57','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','52beb772-69bc-4342-a5c3-e2e42b2ecf40'),
('ebdcc752-237e-46c4-80b3-69542e02f60e','Apt. 234 83497 Huel Mission, Port Kandrahaven, NE 38760-8674','2021-08-17 07:03:51','51fb81ed-88ac-481b-95eb-78e3ee41c422','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('b1139b0a-d5cd-476e-af44-e22441ca4e78','Apt. 748 5274 Powlowski Village, West Anna, MI 44887','2021-11-02 08:25:00','50824d5b-6d5b-40c7-ba4a-696212c6913d','52beb772-69bc-4342-a5c3-e2e42b2ecf40');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('689df4df-9a2b-4eb7-97c3-73a45b9cadb6','Suite 384 1519 Streich Underpass, Lake Johnnie, IA 78251-0139','2022-06-12 19:19:26','2889d790-08f4-4458-843f-92721d26df1b','85f5741b-b837-4c02-8c3c-a36c8d95c08e'),
('a1072286-51ff-4d9d-a5e4-510fd8f3a948','Apt. 647 791 Jacobi Oval, West Corettafort, WI 82732-6460','2021-06-10 19:51:51','51fb81ed-88ac-481b-95eb-78e3ee41c422','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('1d50c5b1-70cc-4120-b267-a91d017104c6','55290 Soon Groves, East Raymond, OK 92092-9289','2022-08-11 12:27:02','b223924c-781f-4ccc-8ccb-4c17290aa8eb','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('865f5fa5-6e84-46cd-8e34-bc6fb8d1b6e8','7801 Pacocha Shore, North Charissaport, KS 55731','2022-03-24 06:28:12','b223924c-781f-4ccc-8ccb-4c17290aa8eb','d771208e-5772-47e7-b727-ad8378b35a1d'),
('e6fbd1a5-0573-40dc-a084-827977538817','Suite 621 0604 Altenwerth Station, Runtefurt, UT 96274','2021-08-21 22:51:11','5e578001-54a4-472a-baf2-dfb52864ffef','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('398513a5-917e-4fb8-9203-f9f59bc485a6','Suite 277 13161 Johnson Gardens, North Judsonburgh, AR 58548','2022-04-12 09:45:17','5e578001-54a4-472a-baf2-dfb52864ffef','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('6ae9eec7-0c77-4d51-ae3d-6eec8587f97d','Suite 082 772 Steuber Well, Lake Dedra, OH 45398-7666','2022-11-17 04:57:14','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('992b4f00-98d8-4820-b10b-22f1a25beeda','4569 Lucie Cliff, Runolfsdottirfort, TN 42532','2022-02-28 19:32:22','b223924c-781f-4ccc-8ccb-4c17290aa8eb','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('06622546-48a3-44d7-bee1-246e0e89d748','Apt. 047 743 Hills Plains, South Angela, KY 97504-3908','2022-03-31 00:25:29','50824d5b-6d5b-40c7-ba4a-696212c6913d','d8c587df-e176-4571-8558-ff8a26d99497'),
('3257fe7c-37a1-4272-adf7-24d0294cf4e0','Suite 091 749 Gorczany Coves, Williemouth, WV 18774','2021-03-28 13:19:16','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','68f1fe4d-eb17-40ef-bfcc-b755b222872b');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('90decc74-c7f6-420c-8056-120bc2bb2b29','Suite 504 25865 Arletta Union, New Shonnafort, WY 53695-9158','2022-01-14 00:39:24','1b243259-f668-44dd-a58a-e30b1d3a4b99','32779e92-bbf5-4a8c-ba32-37cc179b6de4'),
('ba16df54-3093-43f2-ba8b-26962fa6ef3b','811 Jesse Court, Ericview, WY 60037-3390','2021-05-17 00:46:28','4e471425-9b0d-4885-a6a2-061f909f79f9','a7fbd0cb-ac54-4257-a09f-eaa00da5ca95'),
('d7f954d2-cc50-4ef1-8cbb-c19613ad62fb','Suite 533 73992 Nikolaus Road, Yostside, AK 36485','2021-10-09 06:04:44','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','58ff749b-d192-4fdb-9d8c-2c71beddb023'),
('df29d6bd-df90-4715-9378-68f131c9f6be','Suite 085 88657 Vaughn Cliffs, East Larraine, AZ 71238-8816','2022-09-27 08:19:27','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('9f496bad-5630-4309-8a8b-d5bf15ae6d62','Suite 194 888 Velda Islands, Conroyville, VA 63200','2022-02-20 12:58:30','6855b9ff-b625-4f55-9d6a-3b6a192a343e','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('e9ec3337-1f6c-4f4c-8369-cd33829eae32','Apt. 328 484 Darlena Loop, East Newton, AL 08124','2022-04-27 05:34:11','2889d790-08f4-4458-843f-92721d26df1b','2de01975-8d69-4d00-a628-ee98f9763c61'),
('a0a15225-8aa6-4c18-ac9d-3346d55d057f','Apt. 166 328 Gleichner Rapids, Lemkechester, AZ 17843-7256','2021-10-03 17:09:32','b223924c-781f-4ccc-8ccb-4c17290aa8eb','580e3a06-5bc5-4722-94cc-062959b080dc'),
('d82a4bcb-6a7b-4636-8aca-09543ea45e75','401 Efrain Glens, Barbraton, TN 96434','2021-07-01 04:12:47','5e578001-54a4-472a-baf2-dfb52864ffef','2c6535ff-625a-47e4-a951-02e66e9d3e5c'),
('cb9bc4d8-ddce-4452-84d2-0709214b0f8a','Apt. 298 1091 Milford Views, East Rigoberto, KY 21586','2022-11-25 00:37:29','2889d790-08f4-4458-843f-92721d26df1b','f2267b1a-877b-43d6-9333-62386451d605'),
('be45e2f0-5b02-4a2f-9fdb-037a9f639744','Apt. 316 992 Elton Unions, Port Sharilyn, IL 70914-5703','2022-06-12 18:11:45','2889d790-08f4-4458-843f-92721d26df1b','aa6314df-200d-4451-96c8-b5a297640fb3');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('27408fa0-6f68-4b1b-b448-30d854821686','Apt. 348 98281 Goodwin Fork, South Walker, NC 21280','2021-08-18 16:13:59','b223924c-781f-4ccc-8ccb-4c17290aa8eb','32779e92-bbf5-4a8c-ba32-37cc179b6de4'),
('ef05c727-702a-44bf-856b-6f0a1772b275','Apt. 484 78389 Keebler Fields, Lenorefort, ND 19535','2022-01-16 16:06:37','50824d5b-6d5b-40c7-ba4a-696212c6913d','2c6535ff-625a-47e4-a951-02e66e9d3e5c'),
('b8c4692e-129c-488d-b126-6ad7a1cdbc50','725 Lashaunda Freeway, Hillsville, MA 52275','2022-11-24 16:25:37','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('9fb44361-82e3-4c28-b184-76b836c22a18','Suite 871 818 Wiegand Creek, Manteborough, OH 65868-2039','2022-09-04 12:46:33','2889d790-08f4-4458-843f-92721d26df1b','fb34a288-8266-482d-a1cb-69d66a01a817'),
('eeb927f0-5228-44b9-9836-b70c76a8f6d1','Apt. 284 177 Dino Coves, Satterfieldtown, TX 84309-6277','2022-05-24 00:35:11','5e578001-54a4-472a-baf2-dfb52864ffef','12083ed6-11db-49a4-8ca4-4ef4c10f4b53'),
('0e78d66c-d48f-488e-a19a-5a1413945fa3','046 Deena Crescent, South Haishire, ND 69875-2880','2021-11-16 02:13:16','50824d5b-6d5b-40c7-ba4a-696212c6913d','3ecdd708-83ff-4cde-8b24-9356e2737b68'),
('4c7d19fb-73f5-43ef-998c-3a501feca66d','12267 Boyer Center, Port Vanda, NC 65188','2022-07-28 10:11:32','2889d790-08f4-4458-843f-92721d26df1b','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('7e342929-fabf-40da-94cd-87596ef709a0','12954 Daniel Run, Marhtaton, KY 56057-5129','2022-03-02 18:06:21','1b243259-f668-44dd-a58a-e30b1d3a4b99','d8c587df-e176-4571-8558-ff8a26d99497'),
('b08a2198-ef16-44f0-a5b3-b312e991bd2c','Apt. 749 1036 Jerde Squares, South Daneshire, IA 31637','2022-07-24 00:52:39','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('f7633bc0-7a37-4f90-9848-5337dbc061a8','02234 Sonya Roads, South Kim, CA 41594-1834','2021-03-17 07:01:31','2889d790-08f4-4458-843f-92721d26df1b','8801d6d4-b869-4fb5-a039-d4c128813520');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('cf0f6d88-9490-4341-b53b-2ab63e7ae3bf','5344 Wisozk Landing, Tyramouth, MA 66207-9975','2022-06-08 00:54:02','4e471425-9b0d-4885-a6a2-061f909f79f9','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('124e7d08-afcf-4ba1-8736-9935aff20ee1','Suite 553 7449 Randell Extension, North Jeannine, NC 96252-5502','2021-08-04 19:08:11','50824d5b-6d5b-40c7-ba4a-696212c6913d','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('c6a28b55-2733-4109-9972-d6061d390160','Suite 427 433 Tommie Villages, Fisherfort, CT 95891','2022-01-21 20:04:53','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','8801d6d4-b869-4fb5-a039-d4c128813520'),
('44794f2f-645a-465d-b074-aa9437700790','Suite 176 272 Norman Fields, Steveshire, NY 08162-7267','2021-09-14 10:31:09','51fb81ed-88ac-481b-95eb-78e3ee41c422','5c94e789-311a-409a-ad96-3e39283321ae'),
('111ca7ea-c502-4f9a-ae63-c2ff0d84d26e','222 Priscila Prairie, South Zolaland, RI 70556-7529','2022-03-31 10:08:21','b223924c-781f-4ccc-8ccb-4c17290aa8eb','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('a2c87706-4e66-470f-b6db-ae38ce36eabd','Apt. 307 802 Moen Burg, Lake Seymour, SD 14467','2022-05-11 03:27:54','b223924c-781f-4ccc-8ccb-4c17290aa8eb','32779e92-bbf5-4a8c-ba32-37cc179b6de4'),
('bb61435a-fb31-4bd6-8032-4772bbf24339','926 Fritsch Land, Treutelchester, LA 37403-0477','2022-12-01 02:25:17','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('15f860c3-45cd-4992-8707-ab085bf0c1bb','248 Bogan Oval, Port Robyn, ND 95327-7405','2021-10-06 06:04:49','4e471425-9b0d-4885-a6a2-061f909f79f9','52beb772-69bc-4342-a5c3-e2e42b2ecf40'),
('c58f3475-d061-4ebd-978c-9811d3dfdeb5','6814 Antoine Fork, Turcotteland, ND 23391','2021-06-15 02:01:13','1b243259-f668-44dd-a58a-e30b1d3a4b99','3ecdd708-83ff-4cde-8b24-9356e2737b68'),
('ab5e03fa-f455-4497-8b19-0d38566f1682','9629 Rolfson Walk, East Celeste, NE 27691','2022-08-11 13:09:05','6855b9ff-b625-4f55-9d6a-3b6a192a343e','34cbc92c-b9f9-4729-9242-d4b729eb05eb');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('d8eb2697-3e19-493a-8f4a-3b9e614bcfde','Suite 902 30469 Kris Rapids, Alysonstad, TX 45962','2022-11-23 03:25:07','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','6c68fbb9-d4e1-44e6-a276-458654452a7c'),
('387ace7c-b4c2-46b0-8faf-44115956c494','Apt. 591 26741 Pollich Cliffs, North Julianehaven, AZ 53770-0031','2022-10-11 15:44:49','5e578001-54a4-472a-baf2-dfb52864ffef','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('c6e31e50-3bc7-4322-8a0f-c8d7ac917fdd','Suite 470 9166 Rice Corners, Rennermouth, MI 81735-0774','2022-11-10 11:08:49','1b243259-f668-44dd-a58a-e30b1d3a4b99','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('acc65083-4d00-41b0-93c9-f859e9cf211a','Suite 439 4049 Alfred Trail, South Robbyn, ME 81088','2021-07-09 07:08:34','b223924c-781f-4ccc-8ccb-4c17290aa8eb','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('e234fbd8-1ae5-4070-a796-8f39519990af','Suite 718 721 Blanda Mountain, West Maricruz, AK 65649-6704','2022-05-25 10:14:38','1b243259-f668-44dd-a58a-e30b1d3a4b99','6c68fbb9-d4e1-44e6-a276-458654452a7c'),
('dbc4c34a-3cde-4f4e-bcc5-6e5d00867a8d','Suite 514 0500 Maricruz Ways, West Rickieland, MO 31462-9026','2022-06-03 16:18:18','6855b9ff-b625-4f55-9d6a-3b6a192a343e','065a5903-2b58-4a40-9ce6-620f8279e39d'),
('dc3e2546-d701-41f9-99e9-7c867c6d80d1','Suite 337 650 Borer Shore, New Myrtle, MO 64411','2021-05-04 16:20:46','6855b9ff-b625-4f55-9d6a-3b6a192a343e','12083ed6-11db-49a4-8ca4-4ef4c10f4b53'),
('c3bb058d-8e1a-40be-8e11-9691614725d3','4264 Tressie Stream, Lake Agustin, NV 70573-8205','2022-03-20 18:49:49','4e471425-9b0d-4885-a6a2-061f909f79f9','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('d28581bc-2927-4c3e-adeb-c74975ccd402','Suite 545 734 Marchelle Plaza, North Christena, TN 50760-9194','2022-06-27 20:46:28','51fb81ed-88ac-481b-95eb-78e3ee41c422','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('60c4c6c6-f73b-428b-af81-d5ded45560ae','Apt. 711 219 Marry Crest, Arturoburgh, OK 53871','2021-11-24 13:16:30','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('31750261-f533-49e5-b1df-e6a97d8ff872','16617 Graig Lock, North Naidatown, NE 98676','2021-03-18 04:20:18','1b243259-f668-44dd-a58a-e30b1d3a4b99','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('a64d7a36-c865-40a0-80a6-2948751b3446','58679 Bayer Hollow, Margretchester, IA 98564','2022-09-09 15:31:53','4e471425-9b0d-4885-a6a2-061f909f79f9','7e718eb7-3942-4ee4-8b0d-c56a3ceec090'),
('6b255c7f-b3e9-4d2f-aa8d-951eb60359b8','Suite 823 2194 Sawayn Plains, Port Clarkside, NY 47967','2021-05-11 06:37:55','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('c3d886d7-f2ea-4647-a8d9-5829bbd0a7de','Apt. 545 84502 Jacobi Harbors, Lake Gayle, MT 65088-4754','2022-10-08 20:59:13','51fb81ed-88ac-481b-95eb-78e3ee41c422','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('f5836323-e357-407c-a17f-54181e6e2aac','Apt. 056 11640 Tristan River, West Millard, IN 69775','2022-01-21 10:05:46','50824d5b-6d5b-40c7-ba4a-696212c6913d','a1b0dcf2-0d50-46fe-a46d-83f819b998a4'),
('fe632816-c211-48c8-9b49-a0c20bb28310','2062 Noel Landing, East Dawnbury, MA 63546','2022-04-07 07:21:34','6855b9ff-b625-4f55-9d6a-3b6a192a343e','580e3a06-5bc5-4722-94cc-062959b080dc'),
('08b6be49-3ea4-489f-ac89-bd1d288109f9','4739 Gutkowski Parks, Medhurstborough, OK 28773','2022-07-01 22:01:58','51fb81ed-88ac-481b-95eb-78e3ee41c422','26d083cf-13fd-4cbc-98ff-9f16f96e6da7'),
('3088cba4-06a2-460d-a3bc-01113d794e13','06276 Ilda Green, West Zachary, IN 18177','2022-04-19 07:59:22','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','2de01975-8d69-4d00-a628-ee98f9763c61'),
('ca3d1ad2-d0ed-41d7-abeb-8efc88083bec','Suite 611 3914 Homenick Coves, South Rocio, MO 69370','2021-03-16 17:29:43','1b243259-f668-44dd-a58a-e30b1d3a4b99','f2267b1a-877b-43d6-9333-62386451d605'),
('4bc9485e-bf18-4e36-8416-5a5f7b319266','Suite 489 649 Johnson Freeway, Beauborough, WI 80366','2022-06-13 00:55:53','5e578001-54a4-472a-baf2-dfb52864ffef','fb34a288-8266-482d-a1cb-69d66a01a817');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('0869477c-cb2e-42a1-99b7-2a96dfab8ace','3913 Bartell Bridge, Port Anastad, ND 77394-2772','2021-08-03 00:25:06','4e471425-9b0d-4885-a6a2-061f909f79f9','79764974-8658-4d8e-8049-7e00913660f0'),
('b461e1c8-d5ba-406c-a15f-0f6669795db0','Apt. 605 663 Gregory Keys, Cyrusside, AZ 53625-1578','2021-12-24 14:04:47','4e471425-9b0d-4885-a6a2-061f909f79f9','5956d9ec-67aa-467e-b31a-d865014a5239'),
('192e1349-6004-45a1-aa4d-2eb627603b97','692 Genevive Plains, Weissnatshire, NY 88392','2021-10-05 18:31:21','2889d790-08f4-4458-843f-92721d26df1b','d2ab998a-4c2d-4cc9-ac5f-59cbeb4ca4be'),
('8d914c76-a8e5-4414-b4b3-e66d6360671a','Apt. 958 217 Mckinley Valleys, West Lauren, PA 27080-1626','2022-04-29 19:27:43','6855b9ff-b625-4f55-9d6a-3b6a192a343e','7037320f-1e5f-4b23-bc25-8802da653bda'),
('b358a887-fd4a-445c-a9b3-a751f75ac503','Apt. 292 588 King Trace, North Janise, OK 21812','2022-11-25 02:47:06','4e471425-9b0d-4885-a6a2-061f909f79f9','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('ec48edc8-9de7-4f51-9d15-b5b8e7ce4ecf','Apt. 346 7629 Kirlin Glens, Port Cortezton, RI 13160','2022-01-16 00:13:58','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('956520bf-9330-4d12-9c48-f5170f4ff97e','Apt. 903 9753 Kilback Dam, South Vanda, NM 05745-0125','2022-01-15 07:53:12','4e471425-9b0d-4885-a6a2-061f909f79f9','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('e08420ad-0a32-4f36-9948-63655d85746b','Apt. 425 2590 Scotty Drives, Lake Carmeliaview, GA 05128','2021-04-24 06:12:42','1b243259-f668-44dd-a58a-e30b1d3a4b99','3ad2db91-e609-4f31-ab2a-656f309707f8'),
('8cc03c9e-9334-42dd-b88c-bd9a22a6bac3','674 Lynette Walks, North Dylan, CT 52119-9368','2021-09-15 06:51:35','b223924c-781f-4ccc-8ccb-4c17290aa8eb','209434d4-35fd-4764-9558-ec1baf5ba0c3'),
('d40bbf00-0099-4d0d-9713-a1cea03d2fb0','3456 Edward Ways, East Horace, TX 68788-2869','2022-07-27 11:09:56','5e578001-54a4-472a-baf2-dfb52864ffef','a1b0dcf2-0d50-46fe-a46d-83f819b998a4');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('7d2fbd8f-2613-4782-96dc-0ba8bd4b6b26','Apt. 556 10280 Valentine Village, Farrellfurt, WY 97739','2022-03-21 16:36:49','2889d790-08f4-4458-843f-92721d26df1b','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('1ae2f274-72b8-4a9b-8563-01e3e3ccd932','Apt. 353 21227 Raye Court, Port Claudeborough, VT 85360-4277','2022-06-28 22:55:20','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','3ad2db91-e609-4f31-ab2a-656f309707f8'),
('a1576c68-3132-46c2-82d5-5098a6d5814d','01509 Batz Pines, Dickensshire, FL 03443','2022-04-15 17:22:58','b223924c-781f-4ccc-8ccb-4c17290aa8eb','edd414ad-5247-4171-8c03-d660d5062cf5'),
('f3fe84c9-b222-470a-bf33-6bbf6b4c3463','Suite 325 144 Daren Meadows, South Kyongview, CA 48838','2021-12-03 12:32:26','4e471425-9b0d-4885-a6a2-061f909f79f9','58ff749b-d192-4fdb-9d8c-2c71beddb023'),
('ddd14d64-c25d-4044-ac15-9a9e1c21f14c','Suite 553 962 Penney Parkways, Port Chungfurt, OK 81337','2021-05-31 21:26:06','6855b9ff-b625-4f55-9d6a-3b6a192a343e','d2ab998a-4c2d-4cc9-ac5f-59cbeb4ca4be'),
('9873cc1a-9433-473f-92db-89d85e4b05d6','Apt. 950 7879 Zulauf Mount, South Corettaside, CT 22941-7493','2022-11-02 19:36:51','5e578001-54a4-472a-baf2-dfb52864ffef','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('be55bb89-4ff7-4ad1-affb-4e1f7cd5689d','Suite 534 708 Gustavo Mill, Lucasmouth, MN 47298','2021-09-07 11:02:30','6855b9ff-b625-4f55-9d6a-3b6a192a343e','5956d9ec-67aa-467e-b31a-d865014a5239'),
('947b2f2a-d5bf-4d3d-a6de-bcc9a94c0799','43678 Bogan Way, North Cruzhaven, WY 42057','2022-01-03 10:13:00','2889d790-08f4-4458-843f-92721d26df1b','209434d4-35fd-4764-9558-ec1baf5ba0c3'),
('253dfc99-3b0a-44fe-81e0-13de9f4c2e9f','95975 Dicki Stream, Lake Metaton, SD 25436','2021-04-27 11:47:28','51fb81ed-88ac-481b-95eb-78e3ee41c422','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('c9688dea-5384-4f03-95ce-f52529491406','Apt. 253 26072 Kelley Valley, Sanfordbury, WI 92312','2022-09-16 05:51:00','1b243259-f668-44dd-a58a-e30b1d3a4b99','d8c587df-e176-4571-8558-ff8a26d99497');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('4122ef8b-cb30-442e-926e-f4a8d11837c0','Apt. 027 62881 Pfeffer Overpass, West Brant, AL 10844','2022-10-03 12:05:47','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','79764974-8658-4d8e-8049-7e00913660f0'),
('b63ec778-929a-4596-87c7-68a30a671b31','Suite 585 045 Botsford Shores, South Jonnieville, KS 83549','2021-09-30 04:46:38','51fb81ed-88ac-481b-95eb-78e3ee41c422','3a8a200d-a059-4d56-8683-04d082ea87bd'),
('e51fb419-0150-45c2-ac12-a8c663d835cd','Suite 114 343 Effertz Gateway, Capricebury, MT 41319-3839','2021-12-03 02:46:46','5e578001-54a4-472a-baf2-dfb52864ffef','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('853a8477-47c2-406b-8f9a-125d72631981','Suite 982 8645 Lessie Mountain, Alveraland, TX 29567','2022-05-21 23:38:38','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','79764974-8658-4d8e-8049-7e00913660f0'),
('e9153df1-1e87-44ad-bf34-142eeabe464a','716 Hessel Ports, Bashirianmouth, KY 53387','2022-12-08 18:29:25','5e578001-54a4-472a-baf2-dfb52864ffef','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('5bd9b167-558a-4906-9457-73f131f82127','Suite 951 8860 Gutkowski Key, Lake Regine, MN 28409-1687','2021-04-23 13:03:11','6855b9ff-b625-4f55-9d6a-3b6a192a343e','5956d9ec-67aa-467e-b31a-d865014a5239'),
('d7b81da5-1ed0-4623-be82-7750b5951319','684 Lang Islands, West Danastad, AL 16617-1188','2022-08-17 09:05:52','4e471425-9b0d-4885-a6a2-061f909f79f9','12083ed6-11db-49a4-8ca4-4ef4c10f4b53'),
('85292444-8e60-49e6-bd33-58a0348a37f1','2907 Enoch Oval, Forresttown, MD 32329','2021-11-17 05:39:59','6855b9ff-b625-4f55-9d6a-3b6a192a343e','29d24ccb-ac96-43f3-b824-c6a546616933'),
('d0f04567-cf8d-4b4c-9b12-3fc1a6c0619f','50336 Mel Walk, West Emogeneshire, FL 99529','2021-10-16 14:22:58','5e578001-54a4-472a-baf2-dfb52864ffef','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('ebe812a0-fca3-4854-a829-85f3efea0190','217 Diane Plaza, South Rosiofort, ND 16138-8961','2022-01-20 18:15:36','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','d771208e-5772-47e7-b727-ad8378b35a1d');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('f30b55ca-4638-4b73-bce7-3076c79b870d','3749 Lashay Lakes, McKenzieton, LA 84833','2021-11-27 07:12:00','6855b9ff-b625-4f55-9d6a-3b6a192a343e','aa6314df-200d-4451-96c8-b5a297640fb3'),
('262ed866-2d93-49cb-bc4d-a05d17249509','336 Leta Pike, West Gary, WA 37646','2021-05-07 19:00:34','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','5956d9ec-67aa-467e-b31a-d865014a5239'),
('618d093d-e5ab-4c27-ad1e-00e9956fc84c','Suite 982 4098 McKenzie Village, Port Charissa, AZ 68824','2022-03-14 04:07:47','b223924c-781f-4ccc-8ccb-4c17290aa8eb','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('ec46f020-a36c-4125-a739-782da5b282ab','Apt. 609 3049 Cleo Drive, North Claudberg, MA 88681-5208','2022-10-03 13:54:36','b223924c-781f-4ccc-8ccb-4c17290aa8eb','517b78de-b4f0-46f7-919d-ff92f274fef3'),
('bd758d4f-11e5-4545-aa33-7db5a40a25e7','Apt. 883 763 Keneth Rapid, West Suzettebury, KS 35747','2021-11-19 09:54:34','1b243259-f668-44dd-a58a-e30b1d3a4b99','5956d9ec-67aa-467e-b31a-d865014a5239'),
('426b34ef-f4a2-44f1-b63a-e34029ce3923','Suite 303 0259 Jennine Spurs, Lynelltown, IL 22806-2996','2022-11-05 18:39:31','50824d5b-6d5b-40c7-ba4a-696212c6913d','5c94e789-311a-409a-ad96-3e39283321ae'),
('242916b8-f46f-45bd-809b-4472cea15327','3249 Purdy Isle, Erdmanfort, WA 70521-7768','2021-08-03 06:29:49','51fb81ed-88ac-481b-95eb-78e3ee41c422','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('2e9c59ec-df91-4fb5-8955-d108a4f7267b','Suite 177 931 Emerson Glens, Rogahnshire, MI 53217','2021-07-09 17:21:11','5e578001-54a4-472a-baf2-dfb52864ffef','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('b625454e-dfcd-47dd-a128-6d4ffd37e18f','65509 Milford Creek, West Indiraview, SC 35400-0349','2021-10-04 08:24:02','4e471425-9b0d-4885-a6a2-061f909f79f9','aa6314df-200d-4451-96c8-b5a297640fb3'),
('0a260dba-6df5-475f-9cd8-248c62b5c618','861 Mi Mountains, Leviview, AK 40847-5017','2021-04-19 19:20:41','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('e42e4387-3fcb-4a27-8639-1f23fef17b42','213 Arnetta Forge, Jaskolskistad, MT 85170-1564','2022-05-20 05:23:41','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('b45b71e7-11dd-44ae-a9fc-2db9ed0de77c','Suite 317 568 West Square, Wilfredotown, WA 97348-5377','2021-04-20 14:44:15','50824d5b-6d5b-40c7-ba4a-696212c6913d','580e3a06-5bc5-4722-94cc-062959b080dc'),
('46e26dd3-5f80-4923-9bed-84c225faf5a7','Apt. 200 690 Trinh Union, Jerrodville, NE 76710-4825','2021-04-08 14:31:00','50824d5b-6d5b-40c7-ba4a-696212c6913d','9d27ed42-06f2-4854-b09f-46803e152c00'),
('932737df-a4c6-4c5c-99b6-86a63bcf9397','30270 Doyle Curve, Port Dovie, NV 81961','2022-09-08 21:34:20','51fb81ed-88ac-481b-95eb-78e3ee41c422','2de01975-8d69-4d00-a628-ee98f9763c61'),
('3902f612-e441-40b9-a39f-bbdad34b7bb1','2265 Kessler Squares, Port Darceyville, VT 09961-5907','2021-05-26 16:19:33','50824d5b-6d5b-40c7-ba4a-696212c6913d','5956d9ec-67aa-467e-b31a-d865014a5239'),
('81315824-5815-41f6-b40b-6e28b3048513','Suite 781 2398 Harvey Isle, North Shavonne, NY 94106-7680','2023-01-10 13:31:59','b223924c-781f-4ccc-8ccb-4c17290aa8eb','0bc37c43-2557-476a-9d9e-11b927b8c4dc'),
('420f1884-5e71-4aed-ade0-abc04837026f','Apt. 130 045 Victor Cove, Hermannborough, OH 07400-6839','2022-09-16 11:04:47','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('977b561d-7554-4010-9dba-89f612cde494','61473 Freddy Pass, Valmouth, TN 88142-4375','2022-12-27 20:36:42','b223924c-781f-4ccc-8ccb-4c17290aa8eb','79764974-8658-4d8e-8049-7e00913660f0'),
('f88e1560-668a-4940-b708-3a3a8c2d642c','6943 Koelpin Divide, Kuhichaven, WI 60016','2021-07-06 10:02:08','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('da061c5b-eee2-4a7c-8608-77093ff9e48c','067 Marie Shore, Lake Shannon, GA 76936','2022-02-05 21:46:39','2889d790-08f4-4458-843f-92721d26df1b','3ecdd708-83ff-4cde-8b24-9356e2737b68');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('5cc59790-4a11-405b-8622-a7c141876063','Apt. 461 1285 Brianna Plaza, Schaeferbury, MI 00002-1050','2022-02-19 19:35:16','1b243259-f668-44dd-a58a-e30b1d3a4b99','0bc37c43-2557-476a-9d9e-11b927b8c4dc'),
('a0160b51-60f1-4e07-9019-2c0d5858a1cf','Apt. 905 62004 Effertz Vista, North Vincenza, OH 38339','2021-11-02 08:20:33','b223924c-781f-4ccc-8ccb-4c17290aa8eb','d8c587df-e176-4571-8558-ff8a26d99497'),
('6ba77868-411d-491d-90f8-1c1942b4ea2a','Apt. 752 0976 Beahan Junctions, Lacyberg, UT 87663-5000','2022-04-07 13:34:38','5e578001-54a4-472a-baf2-dfb52864ffef','517b78de-b4f0-46f7-919d-ff92f274fef3'),
('cfec94a3-2f42-4027-ad6c-8f125524c621','Apt. 409 24912 Booker Turnpike, Shaunland, CO 69157-6253','2022-07-21 10:47:58','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('79783403-5900-42d1-a9d2-2627ee97aafd','Suite 358 538 Brakus Turnpike, West Christenaland, TX 07772','2022-05-23 02:12:07','4e471425-9b0d-4885-a6a2-061f909f79f9','d8c587df-e176-4571-8558-ff8a26d99497'),
('532dec78-6a02-454a-ba01-7f806de82490','92364 Schmidt Burg, Wisozktown, RI 33459','2022-09-05 18:22:06','1b243259-f668-44dd-a58a-e30b1d3a4b99','52beb772-69bc-4342-a5c3-e2e42b2ecf40'),
('3ef99801-9b92-4829-9c4e-b151e2062c6d','078 Hand Tunnel, New Simon, RI 08855-6358','2022-09-16 10:06:31','1b243259-f668-44dd-a58a-e30b1d3a4b99','517b78de-b4f0-46f7-919d-ff92f274fef3'),
('595964b5-b62a-440e-b28a-b5e1ecc72acb','981 Moore Locks, Leuschkechester, AZ 90472','2021-09-21 23:10:45','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','7e718eb7-3942-4ee4-8b0d-c56a3ceec090'),
('8911e7be-7e15-4ab9-b3c0-c3ac31ddf105','7107 Thuy Forks, Tadtown, MO 66860','2022-04-09 20:59:57','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','5389cdc1-169e-4a81-963d-3a0b16472e40'),
('74b50679-9524-4fc0-8f64-9e22ea6f7109','Apt. 747 04189 Jordon Turnpike, Juleport, MT 93558','2022-02-20 15:26:27','2889d790-08f4-4458-843f-92721d26df1b','59fb5fcf-b62a-4ed5-b178-26cb808c28f9');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('6621faae-2e2f-42e4-af18-2a62fbc9c75a','Apt. 038 3397 Damian Fall, Lake Rickstad, OK 49671','2021-03-29 22:35:08','4e471425-9b0d-4885-a6a2-061f909f79f9','79764974-8658-4d8e-8049-7e00913660f0'),
('1aed1515-5eff-471e-8dc8-35ffea7e68ea','23231 Beatty Plains, Erichport, AZ 35656-5275','2022-04-15 12:38:32','5e578001-54a4-472a-baf2-dfb52864ffef','d771208e-5772-47e7-b727-ad8378b35a1d'),
('4aaf564d-42dc-4f15-ae1e-73cd4c3dea32','Apt. 524 1007 Monserrate Tunnel, West Errolton, WA 10522','2021-06-13 19:47:12','4e471425-9b0d-4885-a6a2-061f909f79f9','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8'),
('74138618-23ec-4631-a6cd-535cf06b4159','2206 Lavonia Flat, Pamilaside, MA 68345','2022-06-14 20:29:57','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','7037320f-1e5f-4b23-bc25-8802da653bda'),
('2beffae9-4eac-4488-b376-d0db4217b384','Apt. 707 94797 Aufderhar Fork, North Jamisonton, WY 45488-9237','2023-01-04 15:28:05','b223924c-781f-4ccc-8ccb-4c17290aa8eb','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('03cf55de-29da-49bd-a74d-4785462e3f95','Suite 588 79442 Hermiston Knolls, Lake Bradly, TX 29494-8947','2022-05-18 02:51:26','2889d790-08f4-4458-843f-92721d26df1b','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('452a53ac-67c7-4c65-830f-698af68ba776','24515 Hessel Squares, Stehrtown, IL 16656-9127','2022-03-07 07:23:37','5e578001-54a4-472a-baf2-dfb52864ffef','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('aa0e97ef-b5f6-4dee-8562-b2038e0b8b08','079 Renea Heights, Deandreside, AL 00507-6564','2021-04-24 00:44:18','2889d790-08f4-4458-843f-92721d26df1b','68f1fe4d-eb17-40ef-bfcc-b755b222872b'),
('85f7b095-8b35-4863-9dfa-d6687846b74c','Suite 781 9995 Crooks Overpass, Lockmanton, FL 35225-2282','2022-03-23 22:57:52','50824d5b-6d5b-40c7-ba4a-696212c6913d','9d27ed42-06f2-4854-b09f-46803e152c00'),
('ad9e36f1-0a8d-4ef6-81d1-0c57a8f49725','1886 Ernser Lakes, Willside, IA 59839','2022-12-11 10:36:22','51fb81ed-88ac-481b-95eb-78e3ee41c422','9d27ed42-06f2-4854-b09f-46803e152c00');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('b2ae09b9-6b6b-4e59-936d-5a7224328712','59625 Dominick Drive, South Aureliastad, CA 40362-9574','2021-12-19 17:44:34','2889d790-08f4-4458-843f-92721d26df1b','d8c587df-e176-4571-8558-ff8a26d99497'),
('18cbdc8c-0efb-44ed-94d9-4fa231792b71','03807 Donnelly Highway, Marquittachester, VT 41684-2482','2022-03-09 13:15:32','4e471425-9b0d-4885-a6a2-061f909f79f9','26d083cf-13fd-4cbc-98ff-9f16f96e6da7'),
('33e77679-ee9b-4790-9b51-1e924fb25f11','176 Bernhard Forges, North Lawanda, IL 26543-8424','2021-10-19 03:54:52','1b243259-f668-44dd-a58a-e30b1d3a4b99','a7fbd0cb-ac54-4257-a09f-eaa00da5ca95'),
('da8d05b8-acd9-4c5e-bf65-061204badced','Apt. 557 0700 Sung Squares, West Marianoborough, MN 18102','2022-01-26 01:28:49','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','3a8a200d-a059-4d56-8683-04d082ea87bd'),
('339a3850-c603-4edf-add7-863ef7c5b3a8','Suite 995 50124 Daniel Passage, Rippinborough, SC 01800','2023-01-10 23:39:59','2889d790-08f4-4458-843f-92721d26df1b','209434d4-35fd-4764-9558-ec1baf5ba0c3'),
('835d70b6-e3ad-44cc-b09b-965116616f31','Apt. 107 9929 Sherlene Glens, Elishaview, SC 66016','2022-05-12 17:35:24','b223924c-781f-4ccc-8ccb-4c17290aa8eb','d771208e-5772-47e7-b727-ad8378b35a1d'),
('98d35335-b75f-46f9-ac80-2ac6b33d62f7','Suite 590 602 Rolf Roads, New Frankie, MI 97430','2022-04-14 22:08:38','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','f104d833-606c-46eb-8f2b-0d7535d36887'),
('59adcabc-2a14-4f1c-aee9-abd6371144b7','6608 Feeney Dale, Mayertfort, UT 93508','2022-03-20 18:14:45','b223924c-781f-4ccc-8ccb-4c17290aa8eb','209434d4-35fd-4764-9558-ec1baf5ba0c3'),
('73269274-10f8-419a-8388-298c4a22b060','Apt. 510 61879 Christiansen Junction, Sangshire, ID 11545','2021-10-31 07:06:24','6855b9ff-b625-4f55-9d6a-3b6a192a343e','8801d6d4-b869-4fb5-a039-d4c128813520'),
('a55dc177-0bc4-449a-9ba5-88a49ac78b76','Suite 148 9064 McGlynn Inlet, Omarfurt, KY 25552-9916','2021-07-08 04:41:59','6855b9ff-b625-4f55-9d6a-3b6a192a343e','2de01975-8d69-4d00-a628-ee98f9763c61');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('470c6318-0e97-4d6f-a988-28617d2204d9','Suite 687 9331 Laverne Bypass, Hectorland, WV 21536-9068','2022-11-18 16:35:00','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','26d083cf-13fd-4cbc-98ff-9f16f96e6da7'),
('5e4ddfd2-3517-4a9c-a984-9407c8234d41','0144 Kuhic Crossing, Lizethberg, SC 79205-9925','2022-03-17 04:50:27','50824d5b-6d5b-40c7-ba4a-696212c6913d','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('cf40c44a-687d-4334-9557-cf78a07adc5e','Suite 697 8111 Gutkowski Junctions, Dolorisbury, NE 28869','2022-05-19 17:13:39','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','065a5903-2b58-4a40-9ce6-620f8279e39d'),
('c2cb409e-ef72-43c1-ab24-acb26dca5222','110 Cassin Stream, East Scottie, GA 54517-2594','2022-08-12 22:13:07','b223924c-781f-4ccc-8ccb-4c17290aa8eb','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('bb43d531-a40a-457a-9396-558bb56484ca','Apt. 637 89346 Johnathan Canyon, Lavonnastad, VT 26777-1944','2022-04-02 11:55:36','6855b9ff-b625-4f55-9d6a-3b6a192a343e','f104d833-606c-46eb-8f2b-0d7535d36887'),
('5b9bce68-a8d2-481a-9018-355ef9aeed11','Apt. 157 0105 Diann Manors, OKonland, MN 04375','2021-05-15 17:43:44','2889d790-08f4-4458-843f-92721d26df1b','d771208e-5772-47e7-b727-ad8378b35a1d'),
('a21c8c18-3c84-4132-b4b1-382e759f5eca','Apt. 306 423 Borer Rue, New Elwood, NE 50133','2022-05-11 07:02:37','51fb81ed-88ac-481b-95eb-78e3ee41c422','c5d2d192-90d5-4b73-a0cd-d79053d5b2b8'),
('950da5da-d5aa-447a-a7e3-9b2b80617c91','Suite 570 02981 Kozey Forges, Alvarofurt, AL 66188-9504','2022-07-05 02:11:02','51fb81ed-88ac-481b-95eb-78e3ee41c422','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('f5290a4b-0304-4964-9a4e-21fb087d0d8d','Suite 010 898 Barrows Radial, Wardfurt, CT 69543','2021-04-12 18:11:05','4e471425-9b0d-4885-a6a2-061f909f79f9','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('489951df-004b-4263-ba00-1da9d17c42ef','Suite 253 4760 Brakus Plains, Spinkabury, ME 77452-9069','2022-09-17 22:01:34','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('ff05268e-5f49-4bf0-b7e4-0f9235596275','90537 Rolfson Square, Lakinview, MN 78534-9331','2021-10-10 23:27:59','4e471425-9b0d-4885-a6a2-061f909f79f9','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('e3d66e74-1e89-4ba9-9f88-848e25ac5c2f','247 Walsh Mall, Antoneview, CT 15792-5530','2022-05-02 13:11:24','4e471425-9b0d-4885-a6a2-061f909f79f9','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('bf522782-8b43-4194-bd66-714208d1a6e5','95514 Wyman Stravenue, Lake Scottland, CA 80794-0163','2022-01-18 07:34:22','4e471425-9b0d-4885-a6a2-061f909f79f9','517b78de-b4f0-46f7-919d-ff92f274fef3'),
('6dcef7f5-2ba0-418a-a8b8-76dd0ab666ae','Apt. 329 603 Timothy Curve, Schneiderside, GA 12869','2022-08-23 03:11:51','6855b9ff-b625-4f55-9d6a-3b6a192a343e','6c68fbb9-d4e1-44e6-a276-458654452a7c'),
('fd04dd5c-0538-4655-a687-4ac8b2a65809','Suite 701 6719 Venice Glen, South Mistyburgh, VA 68839','2022-07-06 08:06:07','51fb81ed-88ac-481b-95eb-78e3ee41c422','5956d9ec-67aa-467e-b31a-d865014a5239'),
('ea21eac9-f6eb-45d5-8205-46f9634f2f65','Suite 927 86234 Wilburn Pines, Blockside, AR 31968','2022-01-17 02:51:53','51fb81ed-88ac-481b-95eb-78e3ee41c422','52beb772-69bc-4342-a5c3-e2e42b2ecf40'),
('4280403e-e4d6-49a3-94b0-6e7764e7d05b','Apt. 527 67738 Kulas Cliffs, Rolfsonbury, VT 87170-6701','2022-03-01 08:28:43','50824d5b-6d5b-40c7-ba4a-696212c6913d','3ecdd708-83ff-4cde-8b24-9356e2737b68'),
('43dd4cf6-4283-46e4-bbf0-ef59e2bfc0ca','090 Bethany Shoal, Lake Russell, KY 32483-1980','2022-03-29 02:49:38','50824d5b-6d5b-40c7-ba4a-696212c6913d','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('6df55c35-7c6c-45eb-af4f-3e246412573f','Apt. 605 119 Ian Prairie, Toiborough, AZ 79472','2021-03-24 07:25:57','1b243259-f668-44dd-a58a-e30b1d3a4b99','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('3b60e6ab-dfc2-4499-a9aa-c29cb8498523','228 Lakin Springs, Hammestown, NY 75249','2021-11-02 17:34:32','2889d790-08f4-4458-843f-92721d26df1b','1a45bbc3-141c-43ee-9771-837f0ec66bb0');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('9246845b-d195-4a2f-a32d-724e2b31e9ad','080 Marquis Divide, East Mickey, MI 41421','2022-07-29 03:41:27','b223924c-781f-4ccc-8ccb-4c17290aa8eb','edd414ad-5247-4171-8c03-d660d5062cf5'),
('594118d9-b4f4-4205-902b-bb333919ff1a','9419 Kimi Freeway, Arturoburgh, NH 06334','2022-04-15 14:59:27','51fb81ed-88ac-481b-95eb-78e3ee41c422','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('c5fa77bc-3577-412f-96e7-ab7fcabec264','Apt. 125 3301 Ardelia Lights, Quinnton, MA 42086','2022-02-01 07:03:27','4e471425-9b0d-4885-a6a2-061f909f79f9','26d083cf-13fd-4cbc-98ff-9f16f96e6da7'),
('f6abd684-75ef-47e5-af92-cd246c868d78','Suite 717 5928 Glenn Dam, Heidenreichhaven, NV 41129-2573','2022-06-18 00:42:17','5e578001-54a4-472a-baf2-dfb52864ffef','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('8db23de5-46db-4068-bea9-0ee8c24b8105','Apt. 738 98261 Abshire Path, West Scarlet, NM 52105-5769','2022-05-19 01:45:19','4e471425-9b0d-4885-a6a2-061f909f79f9','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('c1f88273-ea30-41e9-bd66-32a0c1a6b46b','Apt. 587 4075 Voncile Place, Port Kaycee, NY 28563','2022-03-31 06:00:22','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','3ad2db91-e609-4f31-ab2a-656f309707f8'),
('d86001b5-c77b-467a-9d88-8f3c58b20441','9576 Ligia Prairie, Everetteville, MS 23448','2022-04-03 03:53:02','50824d5b-6d5b-40c7-ba4a-696212c6913d','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('91645eb5-243d-44e0-be80-957fd4ecab72','Apt. 715 32948 Ondricka Extensions, Trompport, KS 17421-7693','2022-11-24 18:27:38','6855b9ff-b625-4f55-9d6a-3b6a192a343e','209434d4-35fd-4764-9558-ec1baf5ba0c3'),
('afeb053a-5cbb-4a62-b05b-2e48628a3dd4','Apt. 947 8998 Rosenbaum Roads, Lake Ken, WI 09120','2022-03-16 06:22:00','1b243259-f668-44dd-a58a-e30b1d3a4b99','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('6b8a2764-409d-40be-bdbd-6d0cd4bfd84e','78562 Norris Street, East Benedict, MI 45424','2022-01-14 16:47:31','6855b9ff-b625-4f55-9d6a-3b6a192a343e','edd414ad-5247-4171-8c03-d660d5062cf5');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('1c5f50d9-0d96-495d-b24e-7bd3691a8c90','Suite 774 444 Hirthe Brook, Hammesfort, AK 43997-5154','2022-03-07 00:39:12','50824d5b-6d5b-40c7-ba4a-696212c6913d','aa6314df-200d-4451-96c8-b5a297640fb3'),
('35196c44-fbc6-4235-87f6-df1e51afe523','Apt. 880 34876 Verona Island, Jaemouth, WA 05077','2022-05-07 05:01:56','1b243259-f668-44dd-a58a-e30b1d3a4b99','7e718eb7-3942-4ee4-8b0d-c56a3ceec090'),
('79ce21d1-2257-4ae3-8b3d-77679f5c696a','Apt. 479 6839 Wonda Skyway, East Rosannaborough, AL 57596-3803','2022-07-28 22:08:31','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','6e50a355-f6de-4046-ad97-a90a7b4a498d'),
('642704a0-5e8b-4e23-a7a4-1f6058f28249','Apt. 440 82793 Jennine Key, Langworthtown, SC 07274','2021-09-03 23:58:26','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','fb34a288-8266-482d-a1cb-69d66a01a817'),
('57119798-5d5c-43a8-a36b-ad4a921c6c4e','Apt. 187 80305 Herman Mountain, Johnmouth, VT 08140','2021-10-30 12:04:04','51fb81ed-88ac-481b-95eb-78e3ee41c422','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('b960c595-7089-4771-aed1-480b54d02fe6','Apt. 645 44512 Earl Shoal, Lake Leslie, MT 73799-4722','2021-05-02 14:03:31','6855b9ff-b625-4f55-9d6a-3b6a192a343e','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('07887d27-4ab6-48a4-9a28-383113eabf6d','Suite 411 977 Terrance Fords, Sipesport, AR 91294','2021-11-29 01:59:27','50824d5b-6d5b-40c7-ba4a-696212c6913d','79764974-8658-4d8e-8049-7e00913660f0'),
('4787b602-60fc-4fa3-800b-e48a7f0ab789','45062 Nader Place, North Christachester, TN 92168-5888','2021-12-01 20:24:34','2889d790-08f4-4458-843f-92721d26df1b','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('8beb3299-ffb8-435c-b4e2-d46ac3a83a24','Apt. 242 04247 Braun Stravenue, New Alenamouth, WV 34112-2108','2022-07-08 00:15:17','5e578001-54a4-472a-baf2-dfb52864ffef','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('24bddaeb-e5ef-48e1-a3f1-3fddb8f9d99b','081 Wilderman Spring, Baileyview, WA 22925','2022-12-06 15:15:31','51fb81ed-88ac-481b-95eb-78e3ee41c422','fb34a288-8266-482d-a1cb-69d66a01a817');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('4bdc2ac1-038c-46f8-944d-ff403f855140','143 Haywood Ports, Jakubowskibury, MT 17435-4656','2022-09-28 07:22:15','5e578001-54a4-472a-baf2-dfb52864ffef','d2ab998a-4c2d-4cc9-ac5f-59cbeb4ca4be'),
('e151aff2-ffdc-413a-8a13-590532fa294d','Apt. 896 4240 Aaron Dale, East Nigel, GA 10847-7541','2021-07-24 04:24:23','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','79764974-8658-4d8e-8049-7e00913660f0'),
('aa4b9d5a-fefd-4f28-8e7c-71e78d6c7659','43348 MacGyver Roads, Cummingsshire, NM 69978-8769','2022-10-29 10:10:52','2889d790-08f4-4458-843f-92721d26df1b','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('bbd2328b-aba3-433e-9583-7991a39772c2','66991 Terese Lane, West Wendie, NC 95153','2022-02-20 01:22:31','6855b9ff-b625-4f55-9d6a-3b6a192a343e','5956d9ec-67aa-467e-b31a-d865014a5239'),
('360d7599-7ef6-46d1-90e8-3f1fe53fba24','Suite 284 08385 Zemlak Extension, South Phuong, NV 19346','2022-05-23 20:47:52','b223924c-781f-4ccc-8ccb-4c17290aa8eb','0bc37c43-2557-476a-9d9e-11b927b8c4dc'),
('78e2dcb0-e917-4313-9127-66fc892368fe','Suite 429 7874 McGlynn Lane, Deonchester, VA 52197','2022-04-03 00:59:49','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','a1b0dcf2-0d50-46fe-a46d-83f819b998a4'),
('649e0a28-1c9a-4d51-a98c-70e9a3d62c3c','Apt. 567 34114 Williams Mills, Kozeyview, IL 77191-2296','2022-06-30 10:39:26','5e578001-54a4-472a-baf2-dfb52864ffef','5389cdc1-169e-4a81-963d-3a0b16472e40'),
('263790f8-4cc2-4db7-8ce0-a4b5f955f763','08392 Thora Tunnel, Ullrichtown, SC 18361','2021-04-17 23:22:51','51fb81ed-88ac-481b-95eb-78e3ee41c422','34cbc92c-b9f9-4729-9242-d4b729eb05eb'),
('195bbb53-47ed-4864-836c-f1e9c6d9ae5f','Apt. 686 12044 Schumm Estate, East Wei, TX 47083','2022-05-30 14:01:35','b223924c-781f-4ccc-8ccb-4c17290aa8eb','3ad2db91-e609-4f31-ab2a-656f309707f8'),
('97a2aafb-bf5a-4fc5-88bf-0d077caa72d5','98749 Weber Motorway, Jaskolskifurt, CA 44544-3498','2021-05-25 17:44:43','6855b9ff-b625-4f55-9d6a-3b6a192a343e','6c68fbb9-d4e1-44e6-a276-458654452a7c');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('f93b0f28-997e-4a12-80dc-67363d514ecd','Suite 740 238 Hand Key, Leatriceton, CO 95565','2022-03-21 04:44:08','5e578001-54a4-472a-baf2-dfb52864ffef','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('f89443c9-3e0f-4bc4-bd53-3319e9215abc','453 Morissette Shore, South Michealchester, SC 67793','2022-07-30 02:36:01','50824d5b-6d5b-40c7-ba4a-696212c6913d','3a8a200d-a059-4d56-8683-04d082ea87bd'),
('9bd23e9b-2030-48ae-8ae6-9070497a4e45','Suite 589 533 Boehm Ramp, Carrollstad, NM 45126','2022-11-10 04:15:22','5e578001-54a4-472a-baf2-dfb52864ffef','edd414ad-5247-4171-8c03-d660d5062cf5'),
('fa447d44-ae95-4d50-9f4e-9b9768a55519','Suite 577 5236 Christiansen Ferry, South Latosha, MO 80985','2022-07-16 23:13:33','51fb81ed-88ac-481b-95eb-78e3ee41c422','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('e514e1c4-82cc-4e8c-aeac-254a09d30710','Suite 233 24456 Hirthe Alley, Schneiderburgh, FL 23043','2021-10-26 07:41:36','2889d790-08f4-4458-843f-92721d26df1b','d771208e-5772-47e7-b727-ad8378b35a1d'),
('ddb6e2db-cae5-401e-9378-f26d9daded9f','1546 Beer Plain, Lake Phungmouth, RI 93618-0541','2022-11-10 10:26:36','2889d790-08f4-4458-843f-92721d26df1b','85f5741b-b837-4c02-8c3c-a36c8d95c08e'),
('50c0e4cd-1a7e-4b14-881d-b4488af36d4a','97279 Irving Valley, Skilesfurt, VT 63789','2022-04-28 05:09:12','2889d790-08f4-4458-843f-92721d26df1b','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('6ea7fb60-f9b2-428c-a5ea-c257431655e8','61951 Bode Via, Hortenseberg, ID 47569-5147','2022-12-12 13:27:19','51fb81ed-88ac-481b-95eb-78e3ee41c422','777d3cf5-4696-4575-942a-fb63e5623c3c'),
('43e4edd0-7541-478d-96ec-92b658291a42','Suite 206 64450 Lehner Extension, West Randall, AL 29372','2022-11-26 01:10:36','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('b76f62a5-ce40-4cd5-8f8f-961cb8504d21','Apt. 946 4949 Gail Turnpike, Loydtown, RI 39771','2021-08-02 22:49:19','51fb81ed-88ac-481b-95eb-78e3ee41c422','a581fa75-4373-413a-ab81-7b5350c90cb0');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('3c5e786b-42c1-467d-aa36-1e59d167f640','Suite 585 333 Eusebio Mountains, East Hazel, KY 75828','2022-12-29 14:10:22','6855b9ff-b625-4f55-9d6a-3b6a192a343e','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('676597f0-3253-4803-a2a7-e614c64ebffc','68459 Beahan Gateway, Lake Pamila, AK 87902-9173','2023-01-10 09:48:08','b223924c-781f-4ccc-8ccb-4c17290aa8eb','1a45bbc3-141c-43ee-9771-837f0ec66bb0'),
('2c0aee22-2099-4dbd-8f64-a3ba40bd1c2f','84326 Mark Stravenue, Andreahaven, KY 85561','2021-03-27 14:09:29','51fb81ed-88ac-481b-95eb-78e3ee41c422','5389cdc1-169e-4a81-963d-3a0b16472e40'),
('8f2930e6-e8ac-489e-9adb-3979049f08d9','255 Ratke Canyon, Corystad, NE 62098-3183','2021-12-21 23:24:10','50824d5b-6d5b-40c7-ba4a-696212c6913d','f2267b1a-877b-43d6-9333-62386451d605'),
('60ef54c1-9072-4843-9ffd-18e79cf29375','Apt. 570 35854 Fermin Spur, Andersontown, MI 97497','2021-06-09 10:21:24','5e578001-54a4-472a-baf2-dfb52864ffef','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('39e08ef7-773d-4f5c-8a5b-fd97d054cf73','541 Lionel Knolls, Hyattside, KS 67387-2984','2021-07-24 02:17:32','1b243259-f668-44dd-a58a-e30b1d3a4b99','79764974-8658-4d8e-8049-7e00913660f0'),
('507cbbdc-5964-45da-8da2-71ee69260808','Apt. 398 4474 Melvina Valleys, Ameeview, MI 76665-0901','2021-07-27 12:40:48','2889d790-08f4-4458-843f-92721d26df1b','9d27ed42-06f2-4854-b09f-46803e152c00'),
('6194df30-8f6e-4c39-89b7-8eb055268eb1','68288 Giovanna Trafficway, North Tommy, NY 87048','2022-06-21 02:41:51','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','397c8dc8-88b0-4a98-8c19-3421f62c0023'),
('2f68c20c-6953-40ec-901c-431ae765a98b','9179 Lonna Track, Hermanbury, TX 37997','2021-10-24 16:36:11','6855b9ff-b625-4f55-9d6a-3b6a192a343e','6c68fbb9-d4e1-44e6-a276-458654452a7c'),
('5cbb34cf-d284-4900-abbd-16de265f47c3','Apt. 996 261 Nestor Roads, New Teodorobury, SC 08336-3378','2022-01-03 11:33:08','6855b9ff-b625-4f55-9d6a-3b6a192a343e','2c6535ff-625a-47e4-a951-02e66e9d3e5c');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('f3e87c9f-fdbb-484a-97ba-d65b4d54f12e','Suite 940 7404 Fahey Fields, East Jacob, CA 72812','2022-04-27 05:28:21','4e471425-9b0d-4885-a6a2-061f909f79f9','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('f1b7b1d2-d881-476d-8350-637b857d39d8','824 Grady Groves, Magenland, IL 86227','2022-05-09 05:38:52','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','f2267b1a-877b-43d6-9333-62386451d605'),
('08553fce-ff13-4ecb-bdd4-e2bd78271efb','540 Raleigh Trafficway, Flatleyview, CA 50265','2022-05-18 16:08:42','4e471425-9b0d-4885-a6a2-061f909f79f9','be640dc9-824f-47f5-bdd4-d1b20eb61d58'),
('32815094-72b0-45fc-8a84-a33d398de50f','71677 Herzog Views, Port Abeport, WI 36771-1572','2021-07-21 14:48:05','5e578001-54a4-472a-baf2-dfb52864ffef','517b78de-b4f0-46f7-919d-ff92f274fef3'),
('74d02e37-1113-4123-b648-6cfe6cbbb6b9','11846 Dusty Run, Keritown, CA 83531','2021-09-05 06:35:59','6855b9ff-b625-4f55-9d6a-3b6a192a343e','79764974-8658-4d8e-8049-7e00913660f0'),
('08bcda10-4616-4ea0-a6fb-bcaa8726f9b9','8971 Lisabeth Place, Corriehaven, IA 46186-9957','2022-04-01 05:38:49','59fcff90-dbfa-4497-a820-4de4c0a2b4dc','cb533843-4d0e-4f85-a9f9-ac03988e392f'),
('401ff5c6-d28a-4869-b303-31690c4efd1f','Suite 098 3207 Orn Manor, Vandervortfurt, WI 95683-9708','2021-07-10 23:26:04','5e578001-54a4-472a-baf2-dfb52864ffef','dd2425e2-b7e9-46e5-a49a-297ba5e3569c'),
('5fdf56ae-c3b6-4247-a040-e6982fb6bc96','17032 Kulas Shoals, Jacobimouth, AR 38838-8479','2022-09-23 16:50:57','6855b9ff-b625-4f55-9d6a-3b6a192a343e','8801d6d4-b869-4fb5-a039-d4c128813520'),
('8e6b0f41-6f34-4753-8a8a-fc6f13d447d7','Suite 088 14513 Van Bypass, East Tyeshaville, AZ 71026','2022-06-28 22:16:35','50824d5b-6d5b-40c7-ba4a-696212c6913d','58ff749b-d192-4fdb-9d8c-2c71beddb023'),
('8f4e000a-a354-4ca3-a5e7-ebe3dd01d7da','Apt. 120 956 Brandee Port, Marcomouth, VT 30769','2022-08-30 00:49:48','1b243259-f668-44dd-a58a-e30b1d3a4b99','517b78de-b4f0-46f7-919d-ff92f274fef3');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('464cf61b-9a6e-44b7-9953-e8a44cd0a16e','Suite 711 66456 Lowe Knoll, Lake Christoperport, WY 39875','2022-01-28 09:30:36','4e471425-9b0d-4885-a6a2-061f909f79f9','79764974-8658-4d8e-8049-7e00913660f0'),
('4c64fd94-6a81-41ac-b53c-bb8292cb4a55','33728 April Walks, Stantonshire, NC 86497-1748','2021-04-09 21:59:27','b223924c-781f-4ccc-8ccb-4c17290aa8eb','580e3a06-5bc5-4722-94cc-062959b080dc'),
('d50008f6-67f9-4a17-b9cf-dff68305cbe2','Suite 299 989 Smitham Harbor, Herzogburgh, SD 47100-3058','2022-04-01 15:07:17','4e471425-9b0d-4885-a6a2-061f909f79f9','04c89c5b-73e9-4aad-9f6a-8a9d88f59ee7'),
('3a257c57-1d25-4bbd-b6ad-562a835da78b','143 Dannielle Creek, Braunton, MD 09011-0294','2022-03-15 16:34:04','2889d790-08f4-4458-843f-92721d26df1b','59fb5fcf-b62a-4ed5-b178-26cb808c28f9'),
('1b93894d-9591-4c9d-842a-d46088cbb01b','Apt. 747 291 Hermann Orchard, New Oma, IA 52457-8200','2021-04-23 09:52:58','5e578001-54a4-472a-baf2-dfb52864ffef','edd414ad-5247-4171-8c03-d660d5062cf5'),
('0a9ad1ef-c92b-4896-b2e5-feda4d66be82','Apt. 119 287 Armando Wall, Turnermouth, ME 23241','2021-06-22 23:53:58','51fb81ed-88ac-481b-95eb-78e3ee41c422','2c6535ff-625a-47e4-a951-02e66e9d3e5c'),
('4c2a8377-1dae-4969-b5ff-2cda8e82f173','51532 Tamara Port, Fadelmouth, NY 33307','2021-10-24 06:31:09','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','a581fa75-4373-413a-ab81-7b5350c90cb0'),
('26af68b2-3f20-425c-ad9c-240d6e86cb44','Suite 861 8205 Sharri Center, Lake Shiela, AZ 07253','2021-03-29 22:51:09','50824d5b-6d5b-40c7-ba4a-696212c6913d','f52a2a1b-d5c1-4aec-a1fa-88fd0579c9df'),
('30ce5859-a898-49ef-8085-69c80058fd3d','45416 Granville Land, Bruenland, NV 01301','2021-12-30 11:45:35','2889d790-08f4-4458-843f-92721d26df1b','580e3a06-5bc5-4722-94cc-062959b080dc'),
('189baaf5-777e-4528-bdc5-bbabe0dbdb22','502 Delbert Harbor, West Marloview, NC 19717-7669','2022-10-30 19:26:47','de2e77ce-f41f-4c6e-a750-24b70d1ecd33','edd414ad-5247-4171-8c03-d660d5062cf5');

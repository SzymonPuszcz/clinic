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

INSERT INTO public.doctors VALUES ('422e5296-f856-49c6-85c9-51b831651418', 'Drake', 'Ramoray', 'SURGEON');
INSERT INTO public.doctors VALUES ('98013caf-f275-46fc-afbc-02a91d6fc3ad', 'Doug', 'Ross', 'SURGEON');
INSERT INTO public.doctors VALUES ('22a59510-15f6-458a-9ea0-212b2d6b1ea9', 'Gregory', 'House', 'INTERNIST');
INSERT INTO public.doctors VALUES ('50598e68-ade7-4ab1-a8ef-7fc6303a53bd', 'Barry', 'Farber', 'DENTIST');

---------------------------------------------------

INSERT INTO public.patients VALUES ('884599eb-3c75-478d-84b7-5446688bef59', 'New York, NY', 'Rachel', 'Green');
INSERT INTO public.patients VALUES ('c480b9e3-9e3e-4a71-b745-2c1a738b3aa4', 'New York, NY', 'Ross', 'Geller');
INSERT INTO public.patients VALUES ('8e83af28-bc46-46cc-bdff-2b6757a24f34', 'New York, NY', 'Chandler', 'Bing');
INSERT INTO public.patients VALUES ('11f1af30-a628-4ce3-a972-e590b297954c', 'New York, NY', 'Monica', 'Geller');
INSERT INTO public.patients VALUES ('b0bfe49c-1804-4e71-b184-cabd17ce4849', 'New York, NY', 'Yoey', 'Tribbiani');

---------------------------------------------------

INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('654ddbba-893c-41b9-b70f-056d7d411775','Apt. 626 039 Heller Mount, Port Shanonmouth, MA 03633-1087','2021-07-08 15:11:15','422e5296-f856-49c6-85c9-51b831651418','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('5365cfe0-7c17-4c69-9dbd-bc967fa5721c','375 Chere Estate, Lake Tempie, NM 47573','2022-08-27 05:23:37','98013caf-f275-46fc-afbc-02a91d6fc3ad','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('a1fc3dea-3563-4a85-ad10-dd7418e86918','9214 Bosco Spring, Romaguerabury, CT 48959','2022-03-10 11:17:50','98013caf-f275-46fc-afbc-02a91d6fc3ad','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('a8d26700-a22d-4fd4-9f92-bda6a5008000','273 Susann Underpass, North Jenae, NJ 94897','2021-04-11 19:16:17','22a59510-15f6-458a-9ea0-212b2d6b1ea9','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('2b72ff5d-06f1-44c7-a560-8d7c1baa653c','Apt. 965 26471 Joaquin Views, West Melissiaview, MS 10656-9688','2021-03-23 06:43:59','22a59510-15f6-458a-9ea0-212b2d6b1ea9','11f1af30-a628-4ce3-a972-e590b297954c'),
('9e6ad699-5805-46d9-ab13-f7d7aa8d3c16','5273 Schultz Grove, East Lonnybury, MN 37134','2022-05-17 02:06:47','98013caf-f275-46fc-afbc-02a91d6fc3ad','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('e3f13d3e-74da-4606-89be-330d382d0e07','2146 Mikel Cove, Lake Lillian, WV 00500','2021-11-25 09:41:20','98013caf-f275-46fc-afbc-02a91d6fc3ad','884599eb-3c75-478d-84b7-5446688bef59'),
('1d4cad50-4a9e-4662-b5d9-9e1e8dd3fb5f','69094 Loan Greens, East Teddy, MO 56521-8368','2022-05-03 05:53:30','98013caf-f275-46fc-afbc-02a91d6fc3ad','11f1af30-a628-4ce3-a972-e590b297954c'),
('ca8b238c-7c28-4bb4-8128-a2a3ebe89845','40038 Refugio Circles, North Erikmouth, UT 84591-3351','2022-07-01 17:49:16','22a59510-15f6-458a-9ea0-212b2d6b1ea9','884599eb-3c75-478d-84b7-5446688bef59'),
('b3be610f-5cf3-4283-ad94-d633cde3f102','6970 Kessler Ways, Toryport, AR 30661-0811','2022-12-18 17:47:42','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','b0bfe49c-1804-4e71-b184-cabd17ce4849');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('38bfb66f-0c49-4c44-a608-442b04fe77ee','Suite 906 47579 Elmer River, Julianeberg, VA 64081','2021-07-26 06:57:17','422e5296-f856-49c6-85c9-51b831651418','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('6e999c9e-9d95-4584-b16d-f116f6a62d59','Apt. 008 9277 Eldridge Radial, West Cliffordfurt, UT 35137-9460','2022-11-24 03:27:08','22a59510-15f6-458a-9ea0-212b2d6b1ea9','884599eb-3c75-478d-84b7-5446688bef59'),
('5c2e295b-cbd2-47a7-9857-70957c3c33e1','Apt. 754 988 Jule Flat, Port Torrieborough, AZ 91628','2022-07-21 03:13:52','22a59510-15f6-458a-9ea0-212b2d6b1ea9','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('ddc10dd1-4fee-4431-9c33-b3cab699b49c','1823 Feil Island, Port Joshland, OR 98471','2021-06-15 18:55:15','422e5296-f856-49c6-85c9-51b831651418','884599eb-3c75-478d-84b7-5446688bef59'),
('66e7c84f-9462-4305-b85a-d09489493bae','4566 Marvin Crossing, Port Jerica, CT 05181-2694','2021-10-12 08:22:09','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','11f1af30-a628-4ce3-a972-e590b297954c'),
('11865a68-9e74-40b1-ab8d-ff08d3624c26','Suite 089 56762 Weber Crossroad, West Thomas, AZ 03773','2021-10-03 16:30:00','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('70c591c3-d054-4a51-9ddc-2ca6a9836729','7309 Jamal Curve, Junitaview, TN 83545-7843','2022-06-02 21:47:02','22a59510-15f6-458a-9ea0-212b2d6b1ea9','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('2460a1d0-6967-48d6-b699-b761bb3fca86','Apt. 482 112 Kyle Meadows, New Maye, OR 08087','2021-09-18 23:15:29','22a59510-15f6-458a-9ea0-212b2d6b1ea9','884599eb-3c75-478d-84b7-5446688bef59'),
('e8e088d2-7169-4849-9bfd-92021f7da05a','Apt. 647 76640 Mitchel Springs, Lake Marlene, MT 55678-5807','2022-10-14 13:18:30','22a59510-15f6-458a-9ea0-212b2d6b1ea9','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('b1f9654b-9628-45ed-8c12-6f4778234956','Apt. 361 3008 Joie Rapid, Larissashire, SD 54493','2022-07-13 21:02:59','98013caf-f275-46fc-afbc-02a91d6fc3ad','b0bfe49c-1804-4e71-b184-cabd17ce4849');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('2e020b64-cf44-41bb-8e91-25f41cb95cd9','1078 Gertha Park, Boscoville, DE 82442-0650','2021-11-15 20:56:37','98013caf-f275-46fc-afbc-02a91d6fc3ad','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('02bb62a4-66f2-4307-91d9-9a749bd5cce9','8036 Vince Alley, Franklinside, AL 82471-7891','2021-03-23 13:46:30','22a59510-15f6-458a-9ea0-212b2d6b1ea9','11f1af30-a628-4ce3-a972-e590b297954c'),
('fdbb898d-94cd-45ef-bfe4-be185008689b','42346 Faustino Fields, North Marshall, RI 00144','2022-05-26 13:04:55','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('8fb4b830-f763-4362-9ee4-9d4e565c56ef','Apt. 933 555 Connie Trafficway, New Brendanberg, NV 88269-3931','2022-11-29 19:21:46','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('b71ccdb5-0f50-47d2-ad5f-33f8d51afcf8','1718 Hessel Circle, Dewayneshire, MT 92834-1986','2022-01-17 11:57:24','422e5296-f856-49c6-85c9-51b831651418','884599eb-3c75-478d-84b7-5446688bef59'),
('8fac36bc-198b-414d-a603-accf5fd9e7c0','068 Daugherty Rue, Lueilwitzbury, DE 74915','2021-09-18 15:43:14','98013caf-f275-46fc-afbc-02a91d6fc3ad','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('01d7cb65-d143-475a-a945-4e72a4ded435','Suite 288 31819 Royal Place, North Rodgerland, WI 96120-1581','2022-08-31 14:37:51','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('cefb00ee-838a-4a7f-9110-13369b335864','Suite 106 698 Polly Route, North Bertram, CT 95741-0115','2022-02-18 05:57:30','22a59510-15f6-458a-9ea0-212b2d6b1ea9','884599eb-3c75-478d-84b7-5446688bef59'),
('505767a2-9f9c-4baf-b627-da8b5d3717e1','Apt. 238 8748 Gail Center, North Dimplebury, ME 09289','2021-09-15 14:04:15','22a59510-15f6-458a-9ea0-212b2d6b1ea9','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('97723347-98d6-46ed-a483-69b3627bc8c4','4923 Hickle Causeway, Port Edna, CA 30469','2021-09-10 14:38:37','98013caf-f275-46fc-afbc-02a91d6fc3ad','8e83af28-bc46-46cc-bdff-2b6757a24f34');
INSERT INTO public.appointments (id,"location",start_date,doctor_id,patient_id) VALUES
('2d90fa9e-cefa-48de-8870-812581857a60','Apt. 019 9098 Mireya Estates, Lake Heideburgh, CO 62234-7206','2022-12-13 23:32:35','98013caf-f275-46fc-afbc-02a91d6fc3ad','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('9cd72b19-a772-4f80-8273-67feb26d8467','Suite 346 525 Kuvalis Vista, Schultzborough, TN 64731-3515','2022-08-09 19:03:05','422e5296-f856-49c6-85c9-51b831651418','884599eb-3c75-478d-84b7-5446688bef59'),
('3cec28fd-c451-448c-93a6-68026a7eb538','1021 Valeria Ramp, Heidenreichfurt, WV 55809-4280','2021-07-25 05:25:26','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','884599eb-3c75-478d-84b7-5446688bef59'),
('2233de9b-5340-4e2d-8423-c4b2f349aa48','00770 Keneth Lock, West Brandenland, OK 99646-7764','2022-12-03 20:12:12','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','b0bfe49c-1804-4e71-b184-cabd17ce4849'),
('a48f0b1c-6a2d-462b-bd5f-6ff1f7b81ad0','3224 Ethyl Prairie, South Berry, NC 88174','2022-02-20 17:51:12','422e5296-f856-49c6-85c9-51b831651418','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('4ef4879b-0952-46ad-845e-1bbf97b3946f','Apt. 082 933 Zulauf Junctions, Noahbury, CO 71500','2022-09-02 06:10:27','98013caf-f275-46fc-afbc-02a91d6fc3ad','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('ab6f4adc-209b-4b50-8862-f6e3c3f3e7f1','6182 Moen Landing, North Elisha, AL 00285','2022-01-06 07:00:22','50598e68-ade7-4ab1-a8ef-7fc6303a53bd','8e83af28-bc46-46cc-bdff-2b6757a24f34'),
('f74de313-8233-4c07-b16c-29c6d478bc66','Apt. 423 47552 Carlo Village, North Jewel, NJ 09510-9196','2022-10-11 19:27:08','422e5296-f856-49c6-85c9-51b831651418','c480b9e3-9e3e-4a71-b745-2c1a738b3aa4'),
('ce9f994d-344b-4231-8ba8-2d3f1661acd8','Suite 742 5112 Brakus Shores, Moshemouth, IL 28602-8066','2021-05-26 16:00:39','22a59510-15f6-458a-9ea0-212b2d6b1ea9','884599eb-3c75-478d-84b7-5446688bef59'),
('2fb5db58-b15f-46fd-91df-f29aa45312f7','Suite 526 817 Vania River, South Palmer, CO 97292','2021-07-27 10:06:19','422e5296-f856-49c6-85c9-51b831651418','8e83af28-bc46-46cc-bdff-2b6757a24f34');

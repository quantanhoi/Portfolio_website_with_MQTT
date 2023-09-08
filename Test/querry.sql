-- Drop tables if they exist
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS contact;

-- Create skill table
CREATE TABLE skill (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- Create project table
CREATE TABLE project (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  url VARCHAR(255),
  icon VARCHAR(2083),
);

-- Create contact table
CREATE TABLE contact (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  detail VARCHAR(255)
);

INSERT INTO skill (name) VALUES
('C/C++'),
('Javascript'),
('Node.js'),
('HTML, CSS'),
('Python'),
('Postgresql'),
('Jira, Trello');

INSERT INTO project (name, url, icon) VALUES
('URL Alias Store', 'https://github.com/quantanhoi/url_alias_store', 'https://lh3.googleusercontent.com/pw/AIL4fc80LJ5gze61fg8OMXISjToyhAVge2zYlsJkVx28GnquQ3OPqSUz0XiHLMYNy4BEdvZwdSYUuNsb_4z9v7x4gdONMbzIPxkyHYIoorrBwiTOrK2C0CEXc8vk7PH1f0FojK_3GPMvjuU4b_FSlrn5oeUBGnG_DES43fuLulTAoVgXhCs-2Q9VIOT6v1FwSb8PlLsSrkWI-jQFqLe8NXa-862TWxwPDVE1nXRzYmVOuq_5Scm16ITtzfxPQ2Tridl3oBJNYDzknVkTJU87qhW6Y5hrotno79ghNNI3geEUfLoxWdtGjJAdBIF1NLt1KcAyDAYkxY79Ea1J2i_xnFh0pfKP4Tf91DZtZrNnygVbw0UoLMIY-v8A6l7GzIxumyM4X0PuVIKHx2yFGh5rzyS6HxjdzVbrPFTay7JtmQud4XjClGpqbLvGEoMpxfpqduc200DAydo8SM0Z_CMKPgEcBhxgeXbAqshj8XEL68siFvH2fROss675d07QILc84jSr418tZcpKsNksLenTkpPLB3JsxzQrokLPJmTIKbP1ReRouvjRFRVn99QHkjfdXPidCwqfLc0Aa2oGWduOCSp1X90WO2CuycSSgIqtKTXlmIijTVYp7A1DvKf7LE7QDXxZ8-LXFPGjIHZWMRxUZDkaF4GdzcEk1JRM0c3t0FqO3FGIv-Xum44CKjSqMWcXjgL7QHxEPGO1K4Ys1603h3Kkhuo0325W0OAW5M_B8h2k3fMYnhDClbbUosFtpm37oS-rM7yLKk-WuVJzrSEVm1GDTkxahKlpa21cFPnJPukRqdKqw4_i7KB-S7KSUbaqoWeUErTKa7akfokZHn5lZO9g1WAeqDGN6MafkyRO0XPY4aTDApdi75d_HZYcnQnbTb8hkSER9V4meji7EFEfHu8FNSs=w512-h512-s-no?authuser=0'),
('4x4 Gewinnt on Raspberry Pi', 'https://github.com/quantanhoi/4x4_gewinnt_mit_CoAp', 'https://lh3.googleusercontent.com/pw/AIL4fc_lZDLNW_GTzAcWUTk2xUSQSXNtmcy0-K5Mwcx1w2gupxJoqU83hmajuTT3OpV4HlkUDaoOMVml3b672PjZ18LJYZifuNKs4KMMLi8SclDgJeNqieHIyYsx3_qv8Fr9l2KxgxZTdTEmA_CnmCHiv3SQOaiRMTwm-tfbloEJbxnKh2T_tDbqcMMLSvJ2xvdhqqCVY7u0RaPpwx92rxxh1EL9hNJgknLeoJEtCJ7bHqEh5lbBqO9DsRQB8p8RgZ60NuiqkoUlXnxthF-dpNxyLspWC8UDD6qJyOIk5wVY6LhPsubs_Nxw8qhJkj4_ZW931OoZRHj0m3BjgvFQjPucqRdg1_7M5zUI-PW4JuRFz7v0xYWe8ENDtZqENkE790_h_Av42GsTgGqgs7l0sewkLYqDgN3sfR7vI97xY5yqKwrpcjIYnopkgIpjlN1I04RCqoaOIWy4KcxP5zR8IypV0M9GgXIrulmSfBxLXFUKl2WlCO01qWeOj4cQ_frozlAyuzTf_-436TxyBX10z2Xk_59kjJO2olITqhxN6Hh4Ni3glFPcYDUbi9NL-xoLYJwRkSz2uWsibpXBXOFXIj16LElbxgqJmOltwssx2LaNrAG8H9-M9HvsxInRz0r4-wNR9r_Dq5W6I3pfBKvqNsZ1GMZgmp51u9id3XOIWKzPJIPfZQL-BJfDQDh6BFl90u9tl-CkcjxnTXX3bu2NzwoZgEsVxfseTE3_b60TLHZVXu48Vy-e1CEzADN6_ULB1PUvqToaITjpeBjgrA49v82Coh6gKBqgQxouO46TaSi-5wkOnTuPqlvOUx-TRThI6puOG3mKZGOWsOBPabG8ED5AoLGFoLb2acDMPflb45kVs54DeOz35i569WZbecBfsPUALvJMGGDJhiDdusfsjrmCtlk=w754-h736-s-no?authuser=0'),
('Distributed System with Javascript', 'https://github.com/quantanhoi/JS_Verteiltes_System', 'https://lh3.googleusercontent.com/pw/AIL4fc_lYvdrVp2aA_U86EOexwCuir8bTsrFYBEbrjMJI9FlfzCJQcbp-TBKmkme9GXwNaamaxE1ZIr4QTunsNbLNXUlBwuEjTjbB0fSfDbyqnLGBTXx76kNe98Sb0gt9PVVrSiTEr269CLjU-wJjHUieFRdMzZoD-iZGcfDq6vYH03yUwrFxHsK_7-hceb7m2lu0ei-8_cV-xWSIEs1FghtuYMq-3AFbgce-efQc3RLNUEfzw4PtVMmN5x6QGLdICIYT7iCZ62Lt_ew5IYbujZOY8PCe4KQ4nGUKw3kuWbV84ICF-d9Bxm-NbdBZQ2h2RxkCKtw-aj9CSjYyCMUzKRI0jP4V6dFBwY7TaVnGO8EVraHAGBss9aV5U5sI_XJgKst1UJ031Eq-Mh97OvOnB0pakqD-HCrYj9buTDBScctiKo60iDRsdp2AoszKaVHj4VRCub4L5f_XqIVJqYqASG7hrAday8AGjJLWGmpdHImv14WUUQlcxKGfpXCn3tpT-XmlVhGuozGU9jDT3TqsqvhP53M8ddtyk6gRMmSgU_HmU0LQ2sccM8qYGpinWTQL-mbSXfIPItDcpHG-1hoSW-nKLJKquvWJZUHa69P4_8lykEzjO_mEIkpNHdHJURhO6wkT68NI1PqWAPoGWmIo71YfB4AbuB1phbWCprEhHso5-R8y7G0pl8ZigFIPjsCtBbUnunDGDhvg61twrgigzcBvdDxCLk3g2er9mtbRXLT6MC4_Cy0Cc7rvcrgqJOEykP-KVUPpe4wqAXOyFcgyifCLHpmALbScVz14a8YHMOXJSpHne6VyE4bHVlyZN-KY5Bvb0hbwABiDD2RjXvVcU6XBeK9FcdZuqo3_-mILm6RZr94nTkhUIjE9cpMjFOPNjm1sgaCoAiiJFemvCneKsavAZc=w512-h512-s-no?authuser=0');

INSERT INTO contact (name, detail) VALUES
('Mobile', '+49 1794159439'),
('Email', 'thieuquangtrung1999@gmail.com'),
('Facebook', 'https://www.facebook.com/thieuquang.trung.9'),
('Github', 'https://github.com/quantanhoi');
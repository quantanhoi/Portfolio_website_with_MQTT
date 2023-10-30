INSERT INTO Kategorie (Name) VALUES ('Vegetarian');
INSERT INTO Kategorie (Name) VALUES ('Italian');
INSERT INTO Kategorie (Name) VALUES ('Mexican');
INSERT INTO Kategorie (Name) VALUES ('Vietnamese');
INSERT INTO Kategorie (Name) VALUES ('Non-Vegans');
INSERT INTO Kategorie (Name) VALUES ('Vegan');



INSERT INTO Zutat (ID, Name, Beschreibung, Bild) VALUES  (1, 'Tomato', 'A type of vegetables', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168693574452400148/tomato.jpeg?ex=6552b1b5&is=65403cb5&hm=1d126a150e467cdd61dfd19f8cd5b08c7ac7dc5e5390d73fa3a5c3500ae96b20&');
INSERT INTO Zutat (ID, Name, Beschreibung, Bild) VALUES  (2, 'Pasta', 'A type of noodle', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168693574905364510/pasta.jpeg?ex=6552b1b5&is=65403cb5&hm=ce9cd1bf358ec247d41e79e0b1bad8745e1b8a6a1b95f97ee35acd6ee4c0b7f5&');
INSERT INTO Zutat (ID, Name, Beschreibung, Bild) VALUES  (3, 'Tofu', 'A product made of soja', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168693575240925274/tofu.jpg?ex=6552b1b5&is=65403cb5&hm=71ca4989ae9e9e4ceb4c5ba2bc708c4f78db3d63fb1804cf3f4a5dc83317da59&');
INSERT INTO Zutat (ID, Name, Beschreibung, Bild) VALUES  (4, 'Taco Shell', 'A type of bread?', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168693575865860116/taco-shell.jpeg?ex=6552b1b5&is=65403cb5&hm=653eb1af6b3c6f8d617465d5f5762175ae676c077ffb24246e128629812a9696&');
INSERT INTO Zutat (ID, Name, Beschreibung, Bild) VALUES 
(5, 'Shrimp', 'A type of seafood', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168685887274631298/tom-cang-xanh-la-tom-gi-tom-cang-xanh-gia-bao-nhieu-cach-so-tipsnote-800x450.png?ex=6552aa8c&is=6540358c&hm=d0298caf0b51633d44ce0d8e207644bd50f644d0ca006a4638959bfd46550f22&'),
(6, 'Bacon', 'A type of meat', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168686787552608266/bacon.jpg?ex=6552ab63&is=65403663&hm=600d75696a0794a9d8a68c74207056f279298231ebca80e97ab75229403d5413&'),
(7, 'Chicken', 'A type of meat', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168687556439846932/chicken.jpeg?ex=6552ac1a&is=6540371a&hm=b1bee5c9170aea5284b57ab635068a9ee380fad53e0dcbbb7515e193d0d63160&'),
(8, 'Noodle', 'A type of noodle', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168687583254040687/noodle.jpeg?ex=6552ac21&is=65403721&hm=e2b2d20e07596c4970aa3e9bd8bf8b675c72cac0297f263e4a70c65c303422a5&'),
(9, 'Salad', 'A type of vegetable', 'https://cdn.discordapp.com/attachments/1168685873903177840/1168687618016432138/salad.jpeg?ex=6552ac29&is=65403729&hm=ee4f1a51f93e6d9342b9a332fdad2860211b025df37fb94d0c76422c3b034338&');



INSERT INTO Rezept (ID, Name, Beschreibung, Rating, Bilder) VALUES 
(1, 'Pasta Pomodoro', 'Delicious Italian pasta with tomato sauce', 0, 'https://cdn.discordapp.com/attachments/1168685873903177840/1168694548168441916/spaghetti-al-pomodoro.jpg?ex=6552b29d&is=65403d9d&hm=e9b43621444e0e787513a7e0e1387103ea13dc3d3a36c3f7b4f1ce223fa5d90b&');
INSERT INTO Rezept (ID, Name, Beschreibung, Rating, Bilder) VALUES 
(2, 'Tofu Tacos', 'Mexican-style tacos with tofu', 0, 'https://cdn.discordapp.com/attachments/1168685873903177840/1168694547623198740/TofuTaco.webp?ex=6552b29d&is=65403d9d&hm=c55e3bc62b71676092b4370579170ff336aca02b1d9f3d41cc687e2bd22dee1e&');


INSERT INTO Kategorie_Rezept (Name, ID) VALUES ('Vegetarian', 1);
INSERT INTO Kategorie_Rezept (Name, ID) VALUES ('Italian', 1);
INSERT INTO Kategorie_Rezept (Name, ID) VALUES ('Vegan', 2);
INSERT INTO Kategorie_Rezept (Name, ID) VALUES ('Mexican', 2);


INSERT INTO RezeptStep (Rez_ID, ID, Beschreibung) VALUES (1, 1, 'Boil Pasta');
INSERT INTO RezeptStep (Rez_ID, ID, Beschreibung) VALUES (1, 2, 'Add tomato sauce');
INSERT INTO RezeptStep (Rez_ID, ID, Beschreibung) VALUES (2, 1, 'Fry Tofu');
INSERT INTO RezeptStep (Rez_ID, ID, Beschreibung) VALUES (2, 2, 'Put tofu in taco shell');


INSERT INTO RezeptStep_Zutat (Rez_Rez_ID, Rez_ID, ID) VALUES (1, 1, 1);
INSERT INTO RezeptStep_Zutat (Rez_Rez_ID, Rez_ID, ID) VALUES (1, 1, 2);
INSERT INTO RezeptStep_Zutat (Rez_Rez_ID, Rez_ID, ID) VALUES (2, 1, 3);
INSERT INTO RezeptStep_Zutat (Rez_Rez_ID, Rez_ID, ID) VALUES (2, 1, 4);



INSERT INTO Rezept_Zutat (ID, Zut_ID) VALUES (1, 1);
INSERT INTO Rezept_Zutat (ID, Zut_ID) VALUES (1, 2);
INSERT INTO Rezept_Zutat (ID, Zut_ID) VALUES (2, 3);
INSERT INTO Rezept_Zutat (ID, Zut_ID) VALUES (2, 4);

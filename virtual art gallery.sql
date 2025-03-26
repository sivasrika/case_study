create database VirtualArtGallery

create table Artist (
ArtistID int identity(2025031,1) primary key,
ArtistName varchar(255) not null,
Biography text,
BirthDate date,
Nationality varchar(100),
Website varchar(255),
ContactInfo varchar(255)
)


create table Artwork (
ArtworkID int identity(1,1) primary key,
Title varchar(255) not null,
Descriptions text,
CreationDate date,
Mediums varchar(100),
ImageURL varchar(255),
ArtistID int,
foreign key (ArtistID) references Artist(ArtistID)
)
  
create table Users (
UserID int identity(110301,1) primary key,  
Username varchar(100) unique not null,
Passwords varchar(255) not null,
Email varchar(255) unique not null,
FirstName varchar(100),
LastName varchar(100),
DateOfBirth date,
ProfilePicture varchar(255)
)

create table Gallery (
GalleryID int identity(10001,1) primary key,
GalleryName varchar(255) not null,
Descriptions text,
Locations varchar(255),
CuratorID int,
OpeningHours varchar(255),
foreign key (CuratorID) references Artist(ArtistID)
)

create table UserFavoriteArtwork (
UserID int,
ArtworkID int,
primary key (UserID, ArtworkID),
foreign key (UserID) references Users(UserID),
foreign key (ArtworkID) references Artwork(ArtworkID)
)

create table ArtworkGallery (
ArtworkID int,
GalleryID int,
primary key (ArtworkID, GalleryID),
foreign key (ArtworkID) references Artwork(ArtworkID),
foreign key (GalleryID) references Gallery(GalleryID)
)

--INSERTING VALUES INTO TABLE
insert into Artist (ArtistName, Biography, BirthDate, Nationality, Website, ContactInfo)
values ('Leonardo da Vinci', 'Italian polymath known for Mona Lisa and The Last Supper.', '1452-04-15', 'Italian', 'https://www.museoscienza.org/en/leonardo', 'info@museoscienza.org'),
('Pablo Picasso', 'Spanish painter and sculptor, co-founder of Cubism.', '1881-10-25', 'Spanish', 'https://www.museepicassoparis.fr/', 'contact@museepicassoparis.fr'),
('Vincent van Gogh', 'Dutch post-impressionist painter known for The Starry Night.', '1853-03-30', 'Dutch', 'https://www.vangoghmuseum.nl/en', 'info@vangoghmuseum.nl'),
('Salvador Dalí', 'Spanish surrealist artist known for The Persistence of Memory.', '1904-05-11', 'Spanish', 'https://www.salvador-dali.org/en/', 'info@salvador-dali.org'),
('Johannes Vermeer', 'Dutch Baroque painter known for Girl with a Pearl Earring.', '1632-10-31', 'Dutch', 'https://www.mauritshuis.nl/en/', 'info@mauritshuis.nl'),
('Sandro Botticelli', 'Italian painter of the Early Renaissance.', '1445-03-01', 'Italian', 'https://www.uffizi.it/en/', 'info@uffizi.it'),
('Edvard Munch', 'Norwegian painter known for The Scream.', '1863-12-12', 'Norwegian', 'https://www.nasjonalmuseet.no/en/', 'info@nasjonalmuseet.no'),
('Michelangelo', 'Italian sculptor, painter, and architect of the High Renaissance.', '1475-03-06', 'Italian', 'https://www.museivaticani.va/', 'info@museivaticani.va'),
('Rembrandt van Rijn', 'Dutch painter and etcher, a master of light and shadow.', '1606-07-15', 'Dutch', 'https://www.rijksmuseum.nl/en', 'info@rijksmuseum.nl'),
('Gustav Klimt', 'Austrian symbolist painter, known for his rich, golden style.', '1862-07-14', 'Austrian', 'https://www.belvedere.at/en', 'info@belvedere.at')

select * from Artist
insert into Artwork (Title, Descriptions, CreationDate, Mediums, ImageURL, ArtistID)
values ('Mona Lisa', 'A portrait of a woman with an enigmatic expression.', '1503-01-01', 'Oil on poplar panel', 'https://www.louvre.fr/en/explore/the-palace/mona-lisa', 2025031),
('Guernica', 'A powerful anti-war painting depicting the Spanish Civil War.', '1937-06-01', 'Oil on canvas', 'https://www.museoreinasofia.es/en/collection/artwork/guernica', 2025032),
('The Starry Night', 'A swirling night sky over a peaceful village.', '1889-06-01', 'Oil on canvas', 'https://www.moma.org/collection/works/79802', 2025033),
('The Persistence of Memory', 'A surreal landscape with melting clocks.', '1931-01-01', 'Oil on canvas', 'https://www.salvador-dali.org/en/artwork/catalogue-raisonne-paintings/obra/491/the-persistence-of-memory', 2025034),
('Girl with a Pearl Earring', 'A portrait of a young girl with a pearl earring.', '1665-01-01', 'Oil on canvas', 'https://www.mauritshuis.nl/en/discover/girl-with-a-pearl-earring/', 2025035),
('The Birth of Venus', 'Depicts the goddess Venus emerging from the sea.', '1486-01-01', 'Tempera on canvas', 'https://www.uffizi.it/en/artworks/the-birth-of-venus', 2025036),
('The Scream', 'An expressionist depiction of existential anguish.', '1893-01-01', 'Oil, tempera, and pastel on cardboard', 'https://www.nasjonalmuseet.no/en/collection/object/NG.M.00939', 2025037),
('The Creation of Adam', 'A fresco on the Sistine Chapel ceiling depicting God giving life to Adam.', '1511-01-01', 'Fresco', 'https://www.museivaticani.va/content/museivaticani/en/collezioni/musei/cappella-sistina.html', 2025038),
('The Night Watch', 'A dramatic group portrait of a militia company.', '1642-01-01', 'Oil on canvas', 'https://www.rijksmuseum.nl/en/rijksstudio/artists/rembrandt/objects#/SK-C-5,0', 2025039),
('The Kiss', 'A famous Art Nouveau painting of a couple embracing.', '1907-01-01', 'Oil and gold leaf on canvas', 'https://www.belvedere.at/en/kiss-gustav-klimt', 2025040)

select * from Artist

insert into Users (Username, Passwords, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
values ('John Doe', 'password123', 'johndoe@gmail.com', 'John', 'Doe', '1990-05-14', 'JohnDoe.jpg'),
('Jane Smith', 'securepass456', 'janesmith@gmail.com', 'Jane', 'Smith', '1988-11-22', 'JaneSmith.png'),
('Alex Miller', 'qwerty789', 'alexmiller@gmail.com', 'Alex', 'Miller', '1995-07-08', 'AlexMiller.jpg'),
('Sarah Connor', 'terminator2029', 'sarahconnor@gmail.com', 'Sarah', 'Connor', '1985-09-12', 'SarahConnor.jpg'),
('Michael Jordan', 'basketballGOAT', 'michaeljordan@gmail.com', 'Michael', 'Jordan', '1963-02-17', 'MichaelJordan.png'),
('Lisa Williams', 'myp@ssw0rd', 'lisawilliams@gmail.com', 'Lisa', 'Williams', '1992-04-30', 'LisaWilliams.jpg'),
('David Bowie', 'starman1972', 'davidbowie@gmail.com', 'David', 'Bowie', '1947-01-08', 'DavidBowie.jpg'),
('Emma Watson', 'hermione123', 'emmawatson@gmail.com', 'Emma', 'Watson', '1990-04-15', 'EmmaWatson.png'),
('Elon Musk', 'teslaX2024', 'elonmusk@gmail.com', 'Elon', 'Musk', '1971-06-28', 'ElonMusk.jpg'),
('Mark Zuckerberg', 'fbcreator99', 'markzuckerberg@gmail.com', 'Mark', 'Zuckerberg', '1984-05-14', 'MarkZuckerberg.jpg')

select * from Users

INSERT INTO Gallery (GalleryName, Descriptions, Locations, CuratorID, OpeningHours)
VALUES 
('The Louvre', 'World-famous museum home to the Mona Lisa.', 'Paris, France', 2025031, '09:00 AM - 06:00 PM'),
('Museo Reina Sofía', 'Spanish contemporary art museum featuring Guernica.', 'Madrid, Spain', 2025032, '10:00 AM - 08:00 PM'),
('Van Gogh Museum', 'Dedicated to the works of Vincent van Gogh.', 'Amsterdam, Netherlands', 2025033, '09:00 AM - 05:00 PM'),
('Dalí Theatre-Museum', 'A museum dedicated to Salvador Dalí.', 'Figueres, Spain', 2025034, '10:30 AM - 06:00 PM'),
('Mauritshuis', 'Dutch museum showcasing Vermeer’s works.', 'The Hague, Netherlands', 2025035, '10:00 AM - 05:00 PM'),
('Uffizi Gallery', 'Famous for Botticelli’s Birth of Venus.', 'Florence, Italy', 2025036, '08:15 AM - 06:30 PM'),
('The National Gallery', 'Houses world-renowned European paintings.', 'London, UK', 2025039, '10:00 AM - 06:00 PM'),
('Belvedere Museum', 'Features Klimt’s The Kiss.', 'Vienna, Austria', 2025040, '09:00 AM - 06:00 PM'),
('Rijksmuseum', 'Dutch museum featuring The Night Watch.', 'Amsterdam, Netherlands', 2025039, '09:00 AM - 05:00 PM'),
('National Museum', 'Norwegian museum showcasing Munch’s The Scream.', 'Oslo, Norway', 2025037, '11:00 AM - 04:00 PM');

select * from Gallery



INSERT INTO UserFavoriteArtwork (UserID, ArtworkID)
VALUES 
(110301, 1),  -- John Doe likes Mona Lisa
(110301, 3),  -- John Doe also likes The Starry Night
(110302, 2),  -- Jane Smith likes Guernica
(110302, 5),  -- Jane Smith also likes Girl with a Pearl Earring
(110303, 4),  -- Alex Miller likes The Persistence of Memory
(110303, 7),  -- Alex Miller also likes The Scream
(110304, 6),  -- Sarah Connor likes The Birth of Venus
(110305, 8),  -- Michael Jordan likes The Creation of Adam
(110306, 9),  -- Lisa Williams likes The Night Watch
(110307, 10); -- David Bowie likes The Kiss

select * from UserFavoriteArtwork

INSERT INTO ArtworkGallery (ArtworkID, GalleryID)
VALUES 
(1, 10001),  -- Mona Lisa → The Louvre
(2, 10002),  -- Guernica → Museo Reina Sofía
(3, 10003),  -- The Starry Night → Van Gogh Museum
(4, 10004),  -- The Persistence of Memory → Dalí Theatre-Museum
(5, 10005),  -- Girl with a Pearl Earring → Mauritshuis
(6, 10006),  -- The Birth of Venus → Uffizi Gallery
(7, 10010),  -- The Scream → National Museum
(8, 10007),  -- The Creation of Adam → The National Gallery
(9, 10009),  -- The Night Watch → Rijksmuseum
(10, 10008); -- The Kiss → Belvedere Museum

select * from ArtworkGallery

INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
    ('Hammy', '2020-10-15', 'vet', 'antibiotics');


INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES
    ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);


UPDATE petEvent
SET remark = '5 kittens, 2 male, 3 female'
WHERE petname = 'Fluffy' AND eventtype = 'litter';

INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ('Claws', '1997-08-03', 'vet', 'broken rib');


UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';


DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'dog';

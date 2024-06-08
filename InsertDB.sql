use palestra;


INSERT INTO Trainer VALUES 
	("CFT1", "Mario", "Rossi", "Laurea Scienze Motorie", 1400),
	("CFT2", "Luca", "Esposito", "Laurea Scienze Motorie", 1000),
	("CFT3", "Marco", "Antonio", "Diploma Tecnico", 1150),
	("CFT4", "Lucia", "Mare", "Diploma Scientifico", 1200);
    
    
INSERT INTO Segretario VALUES
	("CFS1", "Marilisa", "Giordano", "Diploma Artistico", 1350),
	("CFS2", "Ivan", "Drago", "Laurea Economia", 1000),
	("CFS3", "Marcello", "De Luca", "Laurea Informatica", 1500),
	("CFS4", "Giuseppe", "Romano", "Diploma Tecnico", 900);
	

INSERT INTO Attestato VALUES
	("Nutrizione Sportiva"),
	("Allenamento Forza"),
	("Allenamento Funzionale");


INSERT INTO Cliente VALUES
	("CFC1", "Gianni", "Di Lorenzo", "Napoli", "Nola", 800, "VIA1", 5),
	("CFC2", "Marco", "Di Napoli", "Napoli", "Pomigliano", 734, "VIA2", 40),
	("CFC3", "Simone", "Bruni", "Napoli", "Marigliano", 124, "VIA3", 17),
	("CFC4", "Matteo", "Rossi", "Napoli", "Saviano", 876, "VIA4", 23),
	("CFC5", "Gianluca", "Di Marco", "Napoli", "Pomigliano", 734, "VIA5", 28),
	("CFC6", "Lorenzo", "Neri", "Napoli", "Pomigliano", 734, "VIA6", 37),
	("CFC7", "Antonio", "Brando", "Napoli", "Saviano", 876, "VIA7", 81),
	("CFC8", "Viviana", "Esposito", "Napoli", "Brusciano", 123, "VIA8", 31),
	("CFC9", "Assunta", "Luna", "Napoli", "Brusciano", 123, "VIA9", 88),
	("CFC10", "Sara", "Esposito", "Napoli", "Mariglianella", 589, "VIA10", 3);
    
    
INSERT INTO Scheda VALUES
	("CFT1", "CFC1", "2023-01-10", "2023-02-10", 3),
	("CFT2", "CFC2", "2023-01-11", "2023-02-11", 5),
	("CFT3", "CFC3", "2023-02-22", "2023-03-22", 3),
	("CFT4", "CFC4", "2023-02-25", "2023-03-25", 4),
	("CFT1", "CFC5", "2023-03-01", "2023-04-01", 3),
	("CFT2", "CFC6", "2023-03-03", "2023-04-03", 3),
	("CFT2", "CFC7", "2022-12-13", "2023-01-13", 4),
	("CFT4", "CFC8", "2022-12-20", "2023-01-20", 3),
	("CFT1", "CFC9", "2023-02-04", "2023-03-04", 3),
	("CFT1", "CFC10","2023-03-10", "2023-04-10", 3);


INSERT INTO Abbonamento VALUES
	("CFC1", "2022-01-10", "2023-02-10", 400, 1),
	("CFC2", "2023-02-20", "2024-02-20", 450, 2),
	("CFC3", "2023-03-10", "2023-06-10", 150, 3),
	("CFC4", "2022-01-10", "2023-02-10", 400, 4),
	("CFC5", "2023-02-13", "2024-09-10", 340, 5),
	("CFC6", "2022-10-10", "2024-10-10", 430, 6),
	("CFC7", "2023-01-10", "2023-11-3", 330, 7),
	("CFC8", "2023-02-03", "2024-05-10", 560, 8),
	("CFC9", "2022-09-10", "2023-09-10", 460, 9),
	("CFC10", "2023-01-10", "2023-03-10", 200, 10);
    
    
INSERT INTO Evento VALUES
	("Natale in palestra", "2022-12-22", "Feste natalizie"),
	("Giornata dell'allenamento", "2023-02-10", "Allenamento di gruppo"),
	("Giornata della corsa", "2023-05-11", "Corsa all'aperto");
    
    
INSERT INTO Organizzazione VALUES
	("CFS1", "Natale in palestra", "2022-12-22"),
	("CFS2", "Natale in palestra", "2022-12-22"),
	("CFS3", "Natale in palestra", "2022-12-22"),
	("CFS1", "Giornata dell'allenamento", "2023-02-10"),
	("CFS2", "Giornata dell'allenamento", "2023-02-10"),
	("CFS1", "Giornata della corsa", "2023-05-11"),
	("CFS2", "Giornata della corsa", "2023-05-11");


INSERT INTO Possedere VALUES
	("Nutrizione Sportiva", "CFT1"),
	("Nutrizione Sportiva", "CFT2"),
	("Allenamento Forza", "CFT1"),
	("Allenamento Forza", "CFT3"),
	("Allenamento Funzionale", "CFT1"),
	("Allenamento Funzionale", "CFT4");


INSERT INTO Partecipazione VALUES
	("CFC1", "Natale in palestra", "2022-12-22", 1),
	("CFC2", "Natale in palestra", "2022-12-22", 2),
	("CFC10", "Natale in palestra", "2022-12-22", 3),
	("CFC4", "Natale in palestra", "2022-12-22", 4),
	("CFC8", "Natale in palestra", "2022-12-22", 5),
	("CFC2", "Giornata dell'allenamento", "2023-02-10", 1),
	("CFC1", "Giornata dell'allenamento", "2023-02-10", 1),
	("CFC5", "Giornata dell'allenamento", "2023-02-10", 2),
	("CFC2", "Giornata della corsa", "2023-05-11", 1),
	("CFC10", "Giornata della corsa", "2023-05-11", 1);

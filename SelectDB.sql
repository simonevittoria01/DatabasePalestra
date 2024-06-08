use palestra;

/*
Visualizzare in ordine crescente il nome e il cognome dei trainer con uno stipendio maggiore o uguale di 1000 
e, come titolo di studio, una Laurea in Scienze Motorie
*/
SELECT T.Nome, T.Cognome
FROM Trainer T
WHERE T.Stipendio >= 1000 AND T.TitoloStudio = "Laurea Scienze Motorie"
ORDER BY T.Nome, T.Cognome;


/*
Visualizzare nome e cognome dei Segretari che hanno organizzato l'evento "Natale in palestra"
ed hanno uno stipendio maggiore di 1000 euro
*/
SELECT S.Nome, S.Cognome
FROM Segretario S, Organizzazione O
WHERE S.CF = O.Segretario_CF AND O.Evento_Nome = "Natale in palestra" AND S.Stipendio > 1000;


/*
Visualizzare la somma degli stipendi di tutti i trainer della palestra
*/
SELECT SUM(T.Stipendio) AS StipendioTrainer
FROM Trainer T;


/*
Per ogni Trainer visualizzare il numero di schede create
*/
SELECT T.Nome, COUNT(*) AS NumeroDiSchede
FROM Trainer T, Scheda S
WHERE T.CF = S.Trainer_CF
GROUP BY T.CF, T.Nome;


/*
Visualizzare i Segretari che hanno organizzato più di due eventi
*/
SELECT S.Nome, COUNT(*) AS NumEventiOrganizzati
FROM Segretario S, Organizzazione O
WHERE S.CF = O.Segretario_CF
GROUP BY S.CF, S.Nome
HAVING COUNT(*) > 2;


/*
Visualizzare i trainer che hanno scritto più schede di allenamento 
*/
SELECT T.Nome, COUNT(*) AS NumSchede
FROM Trainer T, Scheda S
WHERE T.CF = S.Trainer_CF
GROUP BY T.CF, T.Nome
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
			FROM Trainer T, Scheda S
                        WHERE T.CF = S.Trainer_CF
                        GROUP BY T.CF, T.Nome);
                        
                        
/*
Visualizzare il nome e il cognome dei segreatri che hanno organizzato sia l'evento "Natale in palestra" che "Giornata della corsa"
*/
SELECT S.Nome, S.Cognome
FROM Segretario S, Organizzazione O
WHERE S.CF = O.Segretario_CF AND O.Evento_Nome = "Natale in palestra" AND S.CF IN(SELECT O.Segretario_CF
											FROM Organizzazione O
											WHERE O.Evento_Nome = "Giornata della corsa");
                        

/*
Visualizzare i clienti che hanno partecipato a tutti gli eventi
*/
SELECT C.CF, C.Nome, C.Cognome
FROM Cliente C
WHERE NOT EXISTS (SELECT*
			FROM Evento E
                    	WHERE NOT EXISTS (SELECT*
						FROM Partecipazione P
                                        	WHERE P.C_CF = C.CF AND P.E_Nome = E.Nome AND P.E_Data = E.DataEvento))

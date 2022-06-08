CREATE TABLE Livros
(
    L_id SERIAL PRIMARY KEY,
    nome  VARCHAR(255),
	ano DATE,
    reserva INTEGER,
	prateleira INTEGER
);
    INSERT INTO Livros (nome, ano, reserva, prateleira) VALUES('Código Limpo','1999-07-05', 20, 1);
    INSERT INTO Livros (nome, ano, reserva, prateleira) VALUES('Desenvolvimento Ágil Limpo','2011-04-12',13, 1);
    INSERT INTO Livros (nome, ano, reserva, prateleira) VALUES('O Codificador Limpo','2001-01-23',15, 2);
    INSERT INTO Livros (nome, ano, reserva, prateleira) VALUES('PL/SQL: Domine a linguagem do banco de dados Oracle','2002-09-07',10, 2);
    INSERT INTO Livros (nome, ano, reserva, prateleira) VALUES('Arquitetura Limpa','2008-11-13',10, 3);

    SELECT * FROM Livros ORDER BY reserva DESC;
	
	SELECT L_id, nome, ano, reserva, prateleira FROM Livros livro, (SELECT AVG(reserva) media, prateleira prateleiramedia FROM Livros 
	GROUP BY prateleira) mediareserva WHERE livro.prateleira = mediareserva.prateleiramedia AND livro.reserva >= mediareserva.media
###############################################################################################################################################################################
CREATE TABLE Mentores
(
    M_id SERIAL PRIMARY KEY,
    nome  VARCHAR(255),
	turma VARCHAR(255)
);
    INSERT INTO Mentores(nome, turma) VALUES ('Luan', 'Vertigo');
    INSERT INTO Mentores(nome, turma) VALUES ('Pensa', 'Vertigo');
    INSERT INTO Mentores(nome, turma) VALUES ('Susan', 'Five Academy');
    INSERT INTO Mentores(nome, turma) VALUES ('Fernando', 'Five Academy');
	
	SELECT * FROM Mentores
###############################################################################################################################################################################
CREATE TABLE Postagens(
    P_id SERIAL PRIMARY KEY,
    M_id INTEGER,
    texto VARCHAR(255), 
    FOREIGN KEY (M_id) REFERENCES Mentores(M_id)
);
    INSERT INTO Postagens(M_id, texto) VALUES (1, 'Java');
    INSERT INTO Postagens(M_id, texto) VALUES (2, 'Spring');
    INSERT INTO Postagens(M_id, texto) VALUES (3, 'Scrum');
    INSERT INTO Postagens(M_id, texto) VALUES (4, 'PostgreSQL');
	
	SELECT * FROM Postagens
###############################################################################################################################################################################
CREATE TABLE Curtidas(
    M_id INTEGER,
    P_id INTEGER,
	curtidas INTEGER,
    FOREIGN KEY (M_id) REFERENCES Mentores(M_id),
    FOREIGN KEY (P_id) REFERENCES Postagens(P_id)
);
    INSERT INTO Curtidas(M_id, P_id, curtidas) VALUES (1,4,10);
    INSERT INTO Curtidas(M_id, P_id, curtidas) VALUES (2,3,7);
    INSERT INTO Curtidas(M_id, P_id, curtidas) VALUES (3,2,15);
    INSERT INTO Curtidas(M_id, P_id, curtidas) VALUES (4,1,3);
	
	SELECT * FROM Curtidas
###############################################################################################################################################################################   
	SELECT nome, curtidas FROM Mentores, Curtidas WHERE Mentores.M_id = Curtidas.M_id GROUP BY(nome, curtidas) ORDER BY Curtidas DESC
	
	SELECT L_id, nome, ano, reserva, prateleira FROM Livros livro, (SELECT AVG(reserva) media, prateleira prateleiramedia FROM Livros 
	GROUP BY prateleira) mediareserva WHERE livro.prateleira = mediareserva.prateleiramedia AND livro.reserva >= mediareserva.media
    
	SELECT turma, P_id FROM Mentores INNER JOIN Curtidas ON Mentores.M_id = Curtidas.M_id ORDER BY turma;
    
	SELECT turma, ROUND( AVG(P_id)::numeric, 2 ) AS media FROM Mentores INNER JOIN Curtidas ON Mentores.M_id = Curtidas.M_id GROUP BY(turma);
############################################################################################################################################################################### 
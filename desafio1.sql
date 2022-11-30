DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nome_plano VARCHAR(45) NOT NULL,
      valor_plano DECIMAL(5,2) NOT NULL
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nome_usuario VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      data_assinatura DATE NOT NULL,
      planos_id INT NOT NULL,
      FOREIGN KEY (planos_id) references planos(id)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nome_album VARCHAR(45) NOT NULL,
      ano_lancamento INT NOT NULL,
      artistas_id INT NOT NULL,
      FOREIGN KEY (artistas_id) references artistas(id)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nome_musica VARCHAR(45) NOT NULL,
      albuns_id INT NOT NULL,
      segundos_de_duracao INT UNSIGNED NOT NULL,
      FOREIGN KEY (albuns_id) references albuns(id)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.artistas_seguidos(
      usuarios_id INT NOT NULL,
      artistas_id INT NOT NULL,
	  FOREIGN KEY (usuarios_id) references usuarios(id),
      FOREIGN KEY (artistas_id) references artistas(id),
      CONSTRAINT PRIMARY KEY(usuarios_id, artistas_id)
  ) ENGINE = InnoDB;

  CREATE TABLE SpotifyClone.historico_reproducoes(
	  historico_reproducao DATETIME,
      usuarios_id INT NOT NULL,
      musicas_id INT NOT NULL,
	  FOREIGN KEY (usuarios_id) references usuarios(id),
      FOREIGN KEY (musicas_id) references musicas(id),
      CONSTRAINT PRIMARY KEY(usuarios_id, musicas_id)
  ) ENGINE = InnoDB;
  
  INSERT INTO SpotifyClone.planos (nome_plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
	('universitário', 5.99),
	('pessoal',	6.99),
	('familiar', 7.99);
    
  INSERT INTO SpotifyClone.artistas (nome)
  VALUES
    ('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
  
  INSERT INTO SpotifyClone.usuarios(nome_usuario, idade, data_assinatura, planos_id)
  VALUES
	('Barbara Liskov',	82,	'2019-10-20',	1),
	('Robert Cecil Martin',	58,	'2017-01-06',	1),
	('Ada Lovelace',	37,	'2017-12-30',	4),
	('Martin Fowler',	46,	'2017-01-17',	4),
	('Sandi Metz',	58,	'2018-04-29',	4),
	('Paulo Freire',	19,	'2018-02-14',	2),
	('Bell Hooks',	26,	'2018-01-05',	2),
	('Christopher Alexander',	85,	'2019-06-05',	3),
	('Judith Butler',	45,	'2020-05-13',	3),
	('Jorge Amado',	58,	'2017-02-17',	3);
    
  INSERT INTO SpotifyClone.albuns(nome_album, artistas_id, ano_lancamento)
  VALUES 
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);
    
  INSERT INTO SpotifyClone.musicas(nome_musica, albuns_id, segundos_de_duracao)
  VALUES 
	("BREAK MY SOUL", 1, 279),
	("VIRGOS GROOVE", 1, 369),
	("ALIEN SUPERSTAR", 1, 116),
	("Dont Stop Me Now", 2, 203),
	("Under Pressure", 2, 152),
	("Como Nossos Pais", 3, 105),
	("O Medo de Amar e o Medo de Ser Livre", 3, 207),
	("Samba em Paris", 4, 267),
	("The Bards Song", 5, 244),
	("Feeling Good", 6, 100);
  
  INSERT INTO SpotifyClone.artistas_seguidos(usuarios_id, artistas_id)
  VALUES 
	(1, 1),
	(1,	2),
	(1,	3),
	(2,	1),
	(2,	3),
	(3,	2),
	(4,	4),
	(5,	5),
	(5,	6),
	(6,	6),
	(6,	1),
	(7,	6),
	(9,	3),
	(10, 2);
  
  INSERT INTO SpotifyClone.historico_reproducoes(historico_reproducao, usuarios_id, musicas_id)
  VALUES 
	('2022-02-28 10:45:55',	1,	8),
	('2020-05-02 05:30:35',	1,	2),
	('2020-03-06 11:22:33',	1,	10),
	('2022-08-05 08:05:17', 2,	10),
	('2020-01-02 07:40:33',	2,	7),
	('2020-11-13 16:55:13', 3,	10),
	('2020-12-05 18:38:30',	3,	2),
	('2021-08-15 17:10:10', 4,	8),
	('2022-01-09 01:44:33', 5,	8),
	('2020-08-06 15:23:43',	5,	5),
	('2017-01-24 00:31:17',	6,	7),
	('2017-10-12 12:35:20',	6,	1),
	('2011-12-15 22:30:49',	7,	4),
	('2012-03-17 14:56:41',	8,	4),
	('2022-02-24 21:14:22',	9,	9),
	('2015-12-13 08:30:22', 10, 3);
 
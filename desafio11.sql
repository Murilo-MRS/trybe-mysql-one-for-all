SELECT mus.nome_musica AS nome_musica,
CASE 
	WHEN mus2.nome_musica LIKE '%Bard%' THEN REPLACE(mus2.nome_musica, 'Bard', 'QA')
	WHEN mus2.nome_musica LIKE '%Amar%' THEN REPLACE(mus2.nome_musica, 'Amar', 'Code Review')
	WHEN mus2.nome_musica LIKE '%Pais%' THEN REPLACE(mus2.nome_musica, 'Pais', 'Pull Requests')
	WHEN mus2.nome_musica LIKE '%SOUL%' THEN REPLACE(mus2.nome_musica, 'SOUL', 'CODE')
	WHEN mus2.nome_musica LIKE '%SUPERSTAR%' THEN REPLACE(mus2.nome_musica, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.musicas AS mus
INNER JOIN SpotifyClone.musicas AS mus2 
ON mus.id = mus2.id
GROUP BY mus.id 
HAVING novo_nome IS NOT NULL
ORDER BY nome_musica DESC;
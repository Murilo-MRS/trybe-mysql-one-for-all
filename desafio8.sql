SELECT
	art.nome AS artista,
	alb.nome_album AS album
FROM SpotifyClone.albuns AS alb
INNER JOIN SpotifyClone.artistas AS art
ON alb.artistas_id = art.id
WHERE art.nome = 'Elis Regina'
ORDER BY artista ASC , album ASC;
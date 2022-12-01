SELECT
	art.nome AS artista,
	alb.nome_album AS album,
    COUNT(seg.artistas_id) AS seguidores
FROM SpotifyClone.albuns AS alb
INNER JOIN SpotifyClone.artistas AS art
ON alb.artistas_id = art.id
INNER JOIN SpotifyClone.artistas_seguidos AS seg
ON seg.artistas_id = art.id
GROUP BY alb.id
ORDER BY seguidores DESC , artista ASC , album ASC;
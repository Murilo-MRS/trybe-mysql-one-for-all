SELECT 
    COUNT(DISTINCT m.nome_musica) AS cancoes,
    COUNT(DISTINCT a.nome) AS artistas,
    COUNT(DISTINCT alb.nome_album) AS albuns
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.albuns AS alb 
ON alb.id = m.albuns_id OR m.albuns_id
INNER JOIN SpotifyClone.artistas AS a 
ON a.id = alb.artistas_id;
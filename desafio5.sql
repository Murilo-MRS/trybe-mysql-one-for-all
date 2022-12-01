SELECT m.nome_musica AS cancao, COUNT(h.usuarios_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes h
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musicas_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
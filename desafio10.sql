SELECT m.nome_musica AS nome, COUNT(h.usuarios_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes h
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musicas_id
INNER JOIN SpotifyClone.usuarios AS u
ON u.id = h.usuarios_id
WHERE u.planos_id = 1
OR u.planos_id = 3
GROUP BY nome
ORDER BY nome;
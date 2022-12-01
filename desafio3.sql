SELECT
  u.nome_usuario AS usuario,
  COUNT(h.usuarios_id) AS qt_de_musicas_ouvidas,
  FORMAT(SUM(m.segundos_de_duracao) / 60, 2 )AS total_minutos
FROM SpotifyClone.historico_reproducoes h
INNER JOIN SpotifyClone.usuarios AS u
ON u.id = h.usuarios_id
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musicas_id
GROUP BY h.usuarios_id
ORDER BY u.nome_usuario ASC;
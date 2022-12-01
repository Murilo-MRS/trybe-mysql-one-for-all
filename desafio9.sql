SELECT
  COUNT(h.usuarios_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducoes h
INNER JOIN SpotifyClone.usuarios AS u
ON u.id = h.usuarios_id
WHERE u.nome_usuario = 'Barbara Liskov'
GROUP BY h.usuarios_id;
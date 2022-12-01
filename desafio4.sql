SELECT u.nome_usuario AS usuario, 
	IF (MAX(YEAR(h.historico_reproducao)) >= 2021,'Usuário ativo','Usuário inativo') AS status_usuario
FROM SpotifyClone.historico_reproducoes h
INNER JOIN SpotifyClone.usuarios AS u
ON u.id = h.usuarios_id
GROUP BY h.usuarios_id
ORDER BY u.nome_usuario ASC;
-- Referencia al botón de la primera plataforma
local firstMapButton = game.Workspace.VotePlatform.VoteFirstMap.VoteButton
-- Referencia al botón de la segunda plataforma
local secondMapButton = game.Workspace.VotePlatform.VoteSecondMap.VoteButton
-- La referencia al elemento de texto que representa los votos en la primera plataforma
local firstMapText = firstMapButton.Parent.VoteCount.SurfaceGui.TextLabel
-- La referencia al elemento de texto que representa los votos en la segunda plataforma
local secondMapText = secondMapButton.Parent.VoteCount.SurfaceGui.TextLabel
-- Las variables de contador que almacenarán los votos para cada mapa
local countFirstMap = 0
local countSecondMap = 0

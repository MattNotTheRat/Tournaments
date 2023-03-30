--- Создаем хранимую процедуру для выбора команд по номеру чемпионата
CREATE PROCEDURE [dbo].[FindNamesOfTeam]
@TournamentId int
AS
BEGIN
SELECT t.Name AS TeamNames
FROM [Team] t
inner join [Team_Tournament] t1 on t1.TeamId=t.Id
WHERE t1.TournamentId = @TournamentId
END;

-- Выполняем процедуру по номеру чемпионата
EXEC [dbo].[FindNamesOfTeam] 2;
EXEC [dbo].[FindNamesOfTeam] 1;
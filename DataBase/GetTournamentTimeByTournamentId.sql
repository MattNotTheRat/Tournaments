Create procedure GetTournamentTimeByTournamentId
@Id int
as
select T.[Name], TT.[Time] from Team_Tournament as TT
inner join [Tournament] as T on T.Id=TT.TournamentId
group by T.[Name], TT.[Time] 

exec GetTournamentTimeByTournamentId 1 


CREATE DATABASE Tournament
use Tournament

CREATE TABLE [User] (
	[Id] int primary key identity,
	[Name] nvarchar(50) NOT NULL,
)
GO
CREATE TABLE [Tournament] (
	[Id] int primary key identity,
	[Name] nvarchar(50) NOT NULL,
	DisciplineId int NOT NULL,
	OwnerId int NOT NULL,
)
GO
CREATE TABLE [Discipline] (
	[Id] int primary key identity,
	Name nvarchar(50) NOT NULL,
)
GO
CREATE TABLE [Team] (
  	[Id] int primary key identity,
	[Name] nvarchar(50) NOT NULL,
)
GO
CREATE TABLE [User_Team] (
	UserId int NOT NULL,
	TeamId int NOT NULL
)
GO
CREATE TABLE [Match] (
	TournamentId int NOT NULL,
	TeamAId int NOT NULL,
	TeamBId int NOT NULL,
	WinTypeId int NOT NULL,
	TourNumber int NOT NULL
)
GO
CREATE TABLE [WinType] (
	[Id] int primary key identity,
	[Name] nvarchar(50) NOT NULL,
)
GO
CREATE TABLE [Team_Tournament] (
	TeamId int NOT NULL,
	TournamentId int NOT NULL,
	Mesto nvarchar(50) NOT NULL,
	[Time] int NOT NULL
)
GO

ALTER TABLE [Tournament] WITH CHECK ADD CONSTRAINT [Tournament_fk0] FOREIGN KEY ([DisciplineId]) REFERENCES [Discipline]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Tournament] CHECK CONSTRAINT [Tournament_fk0]
GO
ALTER TABLE [Tournament] WITH CHECK ADD CONSTRAINT [Tournament_fk1] FOREIGN KEY ([OwnerId]) REFERENCES [User]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Tournament] CHECK CONSTRAINT [Tournament_fk1]
GO

ALTER TABLE [Team] WITH CHECK ADD CONSTRAINT [Team_fk0] FOREIGN KEY ([Id]) REFERENCES [Team_Tournament]([TournamentId])
ON UPDATE CASCADE
GO
ALTER TABLE [Team] CHECK CONSTRAINT [Team_fk0]
GO

ALTER TABLE [User_Team] WITH CHECK ADD CONSTRAINT [User_Team_fk0] FOREIGN KEY ([UserId]) REFERENCES [User]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [User_Team] CHECK CONSTRAINT [User_Team_fk0]
GO
ALTER TABLE [User_Team] WITH CHECK ADD CONSTRAINT [User_Team_fk1] FOREIGN KEY ([TeamId]) REFERENCES [Team]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [User_Team] CHECK CONSTRAINT [User_Team_fk1]
GO

ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk0] FOREIGN KEY ([TournamentId]) REFERENCES [Tournament]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk0]
GO
ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk1] FOREIGN KEY ([TeamAId]) REFERENCES [Team]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk1]
GO
ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk2] FOREIGN KEY ([TeamBId]) REFERENCES [Team]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk2]
GO
ALTER TABLE [Match] WITH CHECK ADD CONSTRAINT [Match_fk3] FOREIGN KEY ([WinTypeId]) REFERENCES [WinType]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Match] CHECK CONSTRAINT [Match_fk3]
GO


ALTER TABLE [Team_Tournament] WITH CHECK ADD CONSTRAINT [Team_Tournament_fk0] FOREIGN KEY ([TeamId]) REFERENCES [Team]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Team_Tournament] CHECK CONSTRAINT [Team_Tournament_fk0]
GO
ALTER TABLE [Team_Tournament] WITH CHECK ADD CONSTRAINT [Team_Tournament_fk1] FOREIGN KEY ([TournamentId]) REFERENCES [Tournament]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Team_Tournament] CHECK CONSTRAINT [Team_Tournament_fk1]
GO


insert [User] 
Values ('Костя'),('Матвей'),('Вера'),('Паша'),('Кирилл'),('Гриша'),('Слава'),('Алина'),('Вова'),('Настя') 
 
insert [Team] 
Values ('Звёздочки'),('Победители'),('Локомотив'),('Зенит'),('Динамо')
 
insert [User_Team] 
Values (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5) 
 
insert [Discipline] 
Values ('Волейбол'),('Хоккей'),('Футбол'),('Баскетбол') 
 
insert [Tournament] 
Values ('Чемпионат России', 1, 1) 
 
insert [Team_Tournament] 
Values (1,1,'Школа ЦО Кудрова', 1240), (2,1,'Школа ЦО Кудрова', 1240) 
 
insert [WinType] 
Values ('Победили'),('Проиграли') 
 
insert [Match] 
Values (1,1,2,1,1),(1,1,2,2,2) 

select * from [User]
select * from [Team]
select * from [User_Team]
select * from [Discipline]
select * from [Tournament]
select * from [Team_Tournament]
select * from [WinType]
select * from [Match]
go

Create procedure GetTournamentTimeByTournamentId
@Id int
as
select T.[Name], TT.[Time] from Team_Tournament as TT
inner join [Tournament] as T on T.Id=TT.TournamentId
group by T.[Name], TT.[Time] 
go
exec GetTournamentTimeByTournamentId 1 
go

Create procedure GetTournamentMestoByTournamentId
@Id int
as
select T.[Name], TT.[Mesto] from Team_Tournament as TT
inner join [Tournament] as T on T.Id=TT.TournamentId
group by T.[Name], TT.[Mesto] 
go
exec GetTournamentMestoByTournamentId 1 
go

Create procedure GetAllTournamentsWhereParticipatedTeamByTeamId
@Id int
as
select Team.[Name], T.[Name] from Tournament as T
inner join [Team_Tournament] as TT on TT.TournamentId=T.Id
inner join [Team] on Team.Id=TT.TeamId
where Team.Id=@Id
group by Team.[Name], T.[Name]
go
exec GetAllTournamentsWhereParticipatedTeamByTeamId 2
go

Create procedure GetTeamNameByTournamentId
@Id int
as
select T.[Id], Team.[Name] from Team
inner join [Team_Tournament] as TT on TT.TournamentId=Team.Id
inner join [Tournament] as T on T.Id=TT.TournamentId
where T.Id=@Id
group by T.[Id], Team.[Name]
go
exec GetTeamNameByTournamentId 2
go

CREATE PROCEDURE FindNamesOfTeam
@TournamentId int
AS
SELECT t.Name AS TeamNames 
FROM Team t
inner join Team_Tournament t1 on t1.TeamId=t1.Id
VALUES(@TournamentId int)
go

EXEC FindNamesOfTeam @TournamentId = id
go

Create procedure GetParticipantsByTeamId
@Id int
as
select U.[Name] from [Team] as Te
inner join [User_Team] as U_T on Te.Id = U_T.TeamId
inner join [User] as U on U.Id = U_T.UserId
where Te.Id = @Id
go
exec GetParticipantsByTeamId 1
go

Create procedure AddTournament
	@Name NVARCHAR(50),
	@DisciplineId INT,
	@OwnerId INT
AS
INSERT [Tournament]([Name],[DisciplineId],[OwnerId])
VALUES (@Name, @DisciplineId, @OwnerId)
go
exec AddTournament 'Соревнование по волейболу в Крыму',1,1
go

Create procedure AddTeamInTournament
	@IdTeam INT,
	@IdTournament INT
AS
INSERT [Team_Tournament]([TeamId])
VALUES (@IdTeam)

go
exec AddTeamInTournament 1
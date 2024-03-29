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
Values ('Звёздочки'),('Победители')

insert [User_Team]
Values (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,2),(8,2),(9,2),(10,2)

insert [Discipline]
Values ('Волейбол')

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

---Хранимая процедура. Узнать названия команд в соревновании (по Id )

CREATE PROCEDURE FindNamesOfTeam
@TournamentId int
AS
SELECT t.Name AS TeamNames 
FROM Team t
inner join Team_Tournament t1 on t1.TeamId=t1.Id
VALUES(@TournamentId int)
GO

EXEC FindNamesOfTeam @TournamentId = id

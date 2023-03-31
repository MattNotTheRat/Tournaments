import pyodbc

def Option():
    return 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournament'

def GetTournamentTimeByTournamentId(Id):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTournamentTimeByTournamentId {Id}")
    result = cursor.fetchone()
    print(result)

#print(GetTournamentTimeByTournamentId(1))

def GetTournamentMestoByTournamentId(Id):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTournamentMestoByTournamentId {Id}")
    result = cursor.fetchone()
    print(result)

#print(GetTournamentMestoByTournamentId(1))

def GetAllTournamentsWhereParticipatedTeamByTeamId(Id):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetAllTournamentsWhereParticipatedTeamByTeamId {Id}")
    result = cursor.fetchall()
    print(result)

#print (GetAllTournamentsWhereParticipatedTeamByTeamId(1))

def GetParticipantsByTeamId(Id):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetParticipantsByTeamId {Id}")
    result = cursor.fetchall()
    print(result)

#print(GetParticipantsByTeamId(1))

def GetTeamNameByTournamentId(Id):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTeamNameByTournamentId {Id}")
    result = cursor.fetchall()
    print(result)

#print(GetTeamNameByTournamentId(1))

def AddTeamInTournament(IdTeam, IdTournament, Mesto, Time):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"AddTeamInTournament {IdTeam},{IdTournament},{Mesto},{Time}")
    connection.commit()
    connection.close()

#AddTeamInTournament(4,4,'СтадионШКИЛЬНИКОВ',1000)

def DeleteTeamFromTournament(TeamId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"DeleteTeamFromTournament {TeamId}")
    connection.commit()
    connection.close()

#DeleteTeamFromTournament(6)

def AddUserInTeam(UserId,TeamId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"AddUserInTeam {UserId},{TeamId}")
    connection.commit()
    connection.close()

#AddUserInTeam(11,6)

def DeleteUserFromTeam(UserId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"DeleteUserFromTeam {UserId}")
    connection.commit()
    connection.close()

#DeleteUserFromTeam(11)

def CreateTournament(TournamentName,DiciplineId,OwnerId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"CreateTournament {TournamentName},{DiciplineId},{OwnerId}")
    connection.commit()
    connection.close()

#CreateTournament('СпартакиадаШкольников',3,1)

def DeleteTournament(TournamentId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"DeleteTournament {TournamentId}")
    connection.commit()
    connection.close()

#DeleteTournament(3)

def CreateUser(UserName):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"CreateUser {UserName}")
    connection.commit()
    connection.close()

#CreateUser('Богдан')

def DeleteUser(UserId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"DeleteUser {UserId}")
    connection.commit()
    connection.close()

#DeleteUser(15)

def CreateTeam(TeamName):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"CreateTeam {TeamName}")
    connection.commit()
    connection.close()

#CreateTeam('Чемпионы')

def DeleteTeam(TeamId):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"DeleteTeam {TeamId}")
    connection.commit()
    connection.close()

#DeleteTeam(6)

def UpdateTournamentMesto(IdTournament,Mesto):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"UpdateTournamentMesto {IdTournament},{Mesto}")
    connection.commit()
    connection.close()

#UpdateTournamentMesto(4,'СтадионКудрово')

def UpdateTournamentTime(IdTournament,Time):
    connection_string = Option()
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"UpdateTournamentTime {IdTournament},{Time}")
    connection.commit()
    connection.close()

#UpdateTournamentTime(4,1430)
import pyodbc

def GetTournamentTimeByTournamentId(Id):
    connection_string = 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournamets'
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTournamentTimeByTournamentId {Id}")
    result = cursor.fetchone()
    print(result)

#print(GetTournamentTimeByTournamentId(1))

def GetTournamentMestoByTournamentId(Id):
    connection_string = 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournamets'
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTournamentMestoByTournamentId {Id}")
    result = cursor.fetchone()
    print(result)

#print(GetTournamentMestoByTournamentId(1))

def GetAllTournamentsWhereParticipatedTeamByTeamId(Id):
    connection_string = 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournamets'
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetAllTournamentsWhereParticipatedTeamByTeamId {Id}")
    result = cursor.fetchall()
    print(result)

#print (GetAllTournamentsWhereParticipatedTeamByTeamId(1))

def GetParticipantsByTeamId(Id):
    connection_string = 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournamets'
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetParticipantsByTeamId {Id}")
    result = cursor.fetchall()
    print(result)

#print(GetParticipantsByTeamId(1))

def GetTeamNameByTournamentId(Id):
    connection_string = 'DRIVER={SQL Server};SERVER=.;DATABASE=Tournamets'
    connection = pyodbc.connect(connection_string)
    cursor = connection.cursor()
    cursor.execute(f"GetTeamNameByTournamentId {Id}")
    result = cursor.fetchall()
    print(result)

#print(GetTeamNameByTournamentId(1))
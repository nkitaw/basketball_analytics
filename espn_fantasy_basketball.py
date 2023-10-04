#Install espn fantasy api package
pip install espn_api


# NBA Import
from espn_api.basketball import League


#bringing in league
league = League(league_id=273348, 
                year=2023,          espn_s2='AEAzUMGfJCNvNYycOCfu%2BVGH6utVMq1Srm8SmJB5rghtevtJxFMYgmSV7eJuVuaytrx9xFEQOOCO7gCyOpWCvfbuJXsqy6FeF2QtVkqvk63tqa5grApnPcu7b%2Fv%2F88C7%2FZcyqKftHgZSh9zKjCYCWlJ4gwGAYN5v2inp95jwveKBo%2F5B%2Bu8TALC4sqsSteNByF0Y0H%2FmomsBLpVExuTKzTWdvJCvLNoKpqa4dWff%2B1YN30Jflcwxfh4WKJgR3DDWhCy0c7iz5ivmKsOndFiz84Ha', 
                swid='{281C0299-327A-4C67-BCCA-5A94F76AAB6D}')


#Pulls a list of all team names
teams = league.teams

#Pulls second teams roster #kevs team
players = teams[1].roster

#calls in KD
kd = players[0]

#Pulls kd player id
kd.playerId

#this does everything above in one line
league.teams[1].roster[0].playerId

kd.avg_points
kd.total_points

kd_player_stats = kd.stats

kd.points_breakdown


import pandas as pd

# Sample list of people


# Create a Pandas DataFrame
df = pd.DataFrame(teams)

# Display the DataFrame
print(df)

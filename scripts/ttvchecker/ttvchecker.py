# %%
import sys
import requests
import sqlite3

db = '/home/colin/Documents/linuxgamenet/bittyblog.db'
template_file = '/home/colin/Documents/linuxgamenet/templates/twitch_banner.m'

# twitch_user = ''
# clientId = ''
# clientSecret = ''

# %%
def get_access_token():
    p = requests.post(
        'https://id.twitch.tv/oauth2/token',
        params={
            'client_id': clientId,
            'client_secret': clientSecret,
            'grant_type': 'client_credentials',
            'scope': 'bits:read'
        }
    )
    if p.status_code == 200:
        return p.json()['access_token']
    else:
        return None


def get_game_id(username, token):
    r = requests.get(
        'https://api.twitch.tv/helix/streams',
        params={
            'user_login': username
        },
        headers={
            'client-id': clientId,
            'Authorization': f'Bearer {token}'
        }
    )

    if r.status_code != 200 or len(r.json()['data']) == 0:
        return None

    return r.json()['data'][0]['game_id']


def get_game_name_from_id(gameid, token):
    r = requests.get(
        'https://api.twitch.tv/helix/games',
        params={
            'id': gameid
        },
        headers={
            'client-id': clientId,
            'Authorization': f'Bearer {token}'
        }
    )

    if r.status_code != 200 or len(r.json()['data']) == 0:
        return None

    return r.json()['data'][0]['name']


def invalidate_database(database_location):
    bbdb = sqlite3.connect(database_location)

    c = bbdb.cursor()
    c.execute("DELETE FROM last_update;")
    c.execute("INSERT INTO last_update (time) VALUES(CAST(strftime('%s', 'now') AS INT));")

    bbdb.commit()
    bbdb.close()

    return 0


def write_template(filename, username, gamename):
    try:
        f = open(filename, 'rt')
        is_empty = False if len(f.read()) > 10 else True
        f.close()
    except OSError:
        print('Failed to open file')
        return 1

    if is_empty and gamename is not None:
        template = f'<a href="https://www.twitch.tv/{username}"><div style="background-color: #4b367c; color: white; padding: 4px; padding-top: 6px; text-align: center; font-size: 14pt; max-width: 100%; margin: 15px; margin-top: 0px; margin-bottom: 18px;"><b>Live now on Twitch!</b>Playing - {gamename}</div></a>'
    elif not is_empty and gamename is None:
        template = ''
    else:
        return 1

    try:
        f = open(filename, 'w')
        f.write(template)
        f.close()
    except OSError:
        print('Failed to write file')
        return 1

    return 0


# %%
if len(sys.argv) != 4:
    print('Incorrect number of arguments', file=sys.stderr)
    sys.exit(1)

twitch_user = str(sys.argv[1])
clientId = str(sys.argv[2])
clientSecret = str(sys.argv[3])

access_token = get_access_token()
if access_token is None:
    print('Failed to aquire access token', file=sys.stderr)
    sys.exit(1)

game_id = get_game_id(twitch_user, access_token)
if game_id is not None:
    game_name = get_game_name_from_id(game_id, access_token)
else:
    game_name = None

# %%
if not write_template(template_file, twitch_user, game_name):
    invalidate_database(db)

sys.exit(0)


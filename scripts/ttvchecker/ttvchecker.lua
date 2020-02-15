local http_request = require "http.request"
local http_headers = require "http.headers"
local cjson = require "cjson"

template = "/home/colin/Documents/linuxgamenet/templates/twitch_banner.m"
database = "/home/colin/Documents/linuxgamenet/bittyblog.db"

local function get_game_id (name, key)
    local game_id
    local request
    local headers, stream, body

    local request = http_request.new_from_uri("https://api.twitch.tv/helix/streams?user_login=" .. name)
    request.headers:append("client-id", key)

    headers, stream = assert(request:go())
    body = assert(stream:get_body_as_string())
    if headers:get ":status" ~= "200" then
        return 0
    end

    print(body)

    value = cjson.decode(body)
    if #value.data > 0 then
        game_id = value.data[1].game_id
    else
        game_id = 0
    end

    return game_id
end

local function get_game_name (game_id, key)
    local game_name
    local request
    local headers, stream, body

    local request = http_request.new_from_uri("https://api.twitch.tv/helix/games?id=" .. game_id)
    request.headers:append("client-id", key)

    headers, stream = assert(request:go())
    body = assert(stream:get_body_as_string())
    if headers:get ":status" ~= "200" then
        return ""
    end

    print(body)

    value = cjson.decode(body)
    if #value.data > 0 then
        game_name = value.data[1].name
    else
        return ""
    end

    return game_name
end

local function update_db ()
    local sqlite3 = require "lsqlite3"
    bbdb = sqlite3.open(database)

    sql=[=[
        DELETE FROM last_update;
        INSERT INTO last_update (time) VALUES(CAST(strftime('%s', 'now') AS INT));
    ]=]
    
    bbdb:exec(sql)

    bbdb:close()
end

-- Start of script
-- need 2 args
-- arg[1]: twitch name of person
-- arg[2]: twitch client id key
if #arg < 2 then
    return 1
end

game_id = get_game_id(arg[1], arg[2])
game_name = get_game_name(game_id, arg[2])

local file = io.open(template, 'r')
local fileContent = {}
for line in file:lines() do
    table.insert (fileContent, line)
end
io.close(file)

if string.find(fileContent[1], "online") ~= nil and game_id == 0 then
    fileContent[1] = string.gsub(fileContent[1], "online", "offline") .. "<!--"
    fileContent[#fileContent] = fileContent[#fileContent] .. "-->"

    for index, value in ipairs(fileContent) do
        if string.find(value, " %- Playing: .*$") ~= nil then
            fileContent[index] = string.gsub(fileContent[index], "( %- Playing: [^<]*)(.*)$", "{game}%2")
            update_db()
            break
        end
    end

elseif string.find(fileContent[1], "offline") ~= nil and game_id ~= 0 then
    fileContent[1] = string.gsub(fileContent[1], "offline", "online")
    fileContent[1] = string.gsub(fileContent[1], "<!%-%-$", "")
    fileContent[#fileContent] = string.gsub(fileContent[#fileContent], "%-%->$", "")

    for index, value in ipairs(fileContent) do
        if string.find(value, "{game}") ~= nil then
            if game_name ~= "" then
                fileContent[index] = string.gsub(fileContent[index], "{game}", " - Playing: " .. game_name)
            else
                fileContent[index] = string.gsub(fileContent[index], "{game}", " - Playing: " .. "Chill")
            end
            update_db()
            break
        end
    end

end

file = io.open(template, 'w')
for index, value in ipairs(fileContent) do
        file:write(value..'\n')
end
io.close(file)

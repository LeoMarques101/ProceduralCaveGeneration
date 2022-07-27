--require "Procedural_lib"
local ALAVANCA = {
    [1945] = {usada = 1946},
    [1946] = {usada = 1945},
    [9825] = {usada = 9826},
    [9826] = {usada = 9825},
    [9827] = {usada = 9828},
    [9828] = {usada = 9827},
}

local MonstersSpawns = {}

local Styles={
    ["Rock Mountain"] = {
        Wall = {919},   --wall
        Flor = {4405,4406,4407,4408,4409,4410,4411,4417,4413,4414,4415,4416,4417,4418,4419,4420,4421},   --Flor
        BorderFlor = {4405,4406,4407,4408,4409,4410,4411,4417,4413,4414,4415,4416,4417,4418,4419,4420,4421},
        N = 4471,     --n
        W = 4472,     --w
        S = 4469,     --s
        E = 4468,     --e
        cNW = 4475,      --cnw corner
        cNE = 4474,      --cne
        cSE = 4470,      --cse
        cSW = 4473,      --csw
        dNW = 4476,      --dnw diagonal
        dNE = 4478,      --dne
        dSE = 4479,      --dse
        dSW = 4477,      --dsw
    },
    ["Earth"] = {
        Wall = {101,101,101,101,101,101,5711,5712,5713},   --wall
        Flor = {351,351,351,351,351,352,353,354,355},   --Flor
        BorderFlor = {351,351,351,351,351,352,353,354,355},
        N = 5632,     --n
        W = 5631,     --w
        S = 5638,     --s
        E = 5637,     --e
        cNW = 5635,      --cnw corner
        cNE = 5636,      --cne
        cSE = 5633,      --cse
        cSW = 5634,      --csw
        dNW = 5647,      --dnw diagonal
        dNE = 5651,      --dne
        dSE = 5649,      --dse
        dSW = 5650,      --dsw
    },
    ["Earth (stone border)"] = {
        Wall = {101,101,101,101,101,101,5711,5712,5713},   --wall
        Flor = {351,351,351,351,351,352,353,354,355},   --Flor
        BorderFlor = {351,351,351,351,351,352,353,354,355},
        N = 5640,     --n
        W = 5639,     --w
        S = 5642,     --s
        E = 5641,     --e
        cNW = 5645,      --cnw corner
        cNE = 5646,      --cne
        cSE = 5643,      --cse
        cSW = 5644,      --csw
        dNW = 5648,      --dnw diagonal
        dNE = 5652,      --dne
        dSE = 5653,      --dse
        dSW = 5654,      --dsw
    },
    ["Earth Mountain"] = {
        Wall = {10164},   --wall
        Flor = {106,106,106,106,106,108,109},   --Flor
        BorderFlor = {106,106,106,106,106,108,109},
        N = 7989,     --n
        W = 7988,     --w
        S = 8169,     --s
        E = 8168,     --e
        cNW = 7995,      --cnw corner
        cNE = 7996,      --cne
        cSE = 8371,      --cse
        cSW = 7994,      --csw

        dNW = 8135,      --dnw diagonal
        dNE = 8137,      --dne
        dSE = 8138,      --dse
        dSW = 8136,      --dsw
    },
    ["Darkest Mud (lava)"] = {
        Wall = {598,598,598,598,598,599,600,601},
        Flor = {11505,11506,11507,11508,11509},
        BorderFlor = {598,598,598,598,598,599,600,601},
        N = 11524,
        W = 11523,
        S = 11522,
        E = 11525,

        cNW = 11533,      --corner
        cNE = 11532,
        cSE = 11530,
        cSW = 11531,

        dNW = 11529,      --diagonal
        dNE = 11528,
        dSE = 11526,
        dSW = 11527,
    }

}

local MAPS = {
    [1] = {
        startX = 1500, startY = 300, startZ = 7,
        width = 120, height = 120,
        randonFillPercent = 50,
        roomTheresholdSize = 50,
        wallTheresholdSize = 100,
        playerSpawn ={x=55, y=55, size=10},
        map = {},
        remover_primeira_camada = true,
        style = Styles["Earth"],
        spawnId = 1,
        monsters = {
            {name = "Rotworm", amount = 200, time = 1000},
            {name = "Carrion Worm", amount = 100, time = 10000},
            {name = "Rotworm Queen", amount = 1, time = 60000},
        }
    },
    [2] = {
        startX = 1500, startY = 300, startZ = 7,
        width = 120, height = 120,
        randonFillPercent = 52,
        roomTheresholdSize = 50,
        wallTheresholdSize = 100,
        playerSpawn ={x=55, y=55, size=10},
        map = {},
        remover_primeira_camada = true,
        style = Styles["Earth (stone border)"],
        spawnId = 2,
        monsters = {
            {name = "Dwarf", amount = 200, time = 1000},
            {name = "Dwarf Soldier", amount = 100, time = 10000},
            {name = "Dwarf Guard", amount = 30, time = 20000},
            {name = "Dwarf Geomancer", amount = 10, time = 60000},
        }
    },
    [3] = {
        startX = 1500, startY = 300, startZ = 7,
        width = 120, height = 120,
        randonFillPercent = 55,
        roomTheresholdSize = 20,
        wallTheresholdSize = 50,
        playerSpawn ={x=55, y=55, size=10},
        map = {},
        remover_primeira_camada = true,
        style = Styles["Rock Mountain"],
        spawnId = 3,
        monsters = {
            {name = "Dragon", amount = 100, time = 1000},
            {name = "Dragon Lord", amount = 20, time = 10000},
        }
    },
    [4] = {
        startX = 1500, startY = 300, startZ = 7,
        width = 120, height = 120,
        randonFillPercent = 51,
        roomTheresholdSize = 20,
        wallTheresholdSize = 50,
        playerSpawn ={x=55, y=55, size=10},
        map = {},

        remover_primeira_camada = true,
        style = Styles["Earth Mountain"],
        spawnId = 4,
        monsters = {
            {name = "Hydra", amount = 200, time = 1000},
        }
    },
    [5] = {
        startX = 1500, startY = 300, startZ = 7,
        width = 120, height = 120,
        randonFillPercent = 52,
        roomTheresholdSize = 50,
        wallTheresholdSize = 100,
        playerSpawn ={x=55, y=55, size=10},
        map = {},
        remover_primeira_camada = true,
        style = Styles["Darkest Mud (lava)"],
        spawnId = 5,
        monsters = {
            {name = "Fire Elemental", amount = 100, time = 1000},
            {name = "Demon", amount = 100, time = 1000},
        }
    },
}

local MAPS_fromaid = 2300
local MAPS_toaid = 2310


function ProcessMap(map_select)

    local wallRegions = GetRegions(map_select, 1)

    for index, wallRegion in ipairs(wallRegions) do
        if #wallRegion < map_select.wallTheresholdSize then
            for index, tile in ipairs(wallRegion) do
                map_select.map[tile.tileX][tile.tileY] = 0
            end
        end
    end

    local roomRegions = GetRegions(map_select, 0)
    local survivingRooms = {}

    for index, roomRegion in ipairs(roomRegions) do
        if #roomRegion < map_select.roomTheresholdSize then
            for index, tile in ipairs(roomRegion) do
                map_select.map[tile.tileX][tile.tileY] = 1
            end
        else
            table.insert(survivingRooms,Room.new(roomRegion, map_select.map))
        end
    end



    table.sort(survivingRooms, function (k1, k2) return k1.roomSize > k2.roomSize end )
    survivingRooms[1].isAccessibleFromMainRoom = true
    survivingRooms[1].isMainRoom = true

    --print("allRooms: "..#survivingRooms)
    map_select.map = ConnectClosestRooms(map_select, survivingRooms)
    return map_select.map
end

function ConnectClosestRooms(map_select, allRooms, forceAccessibilityFromMainRoom)
    forceAccessibilityFromMainRoom = forceAccessibilityFromMainRoom or false

    local roomListA = {}
    local roomListB = {}

    if forceAccessibilityFromMainRoom then
        for index, room in ipairs(allRooms) do
            
            if room.isAccessibleFromMainRoom then
                table.insert(roomListA,room)
            else
                table.insert(roomListB,room)
            end

        end
        
    else
        roomListA = allRooms
        roomListB = allRooms
    end

    local bestDistance = 0
    local bestTileA = Coord
    local bestTileB = Coord
    local bestRoomA = Room
    local bestRoomB = Room
    local possibleConnectionFound = false

    for i, roomA in ipairs(roomListA) do
        if not forceAccessibilityFromMainRoom then
            possibleConnectionFound = false
            if #roomA.connectedRooms > 0 then
                goto continueA
            end
        end

        for j, roomB in ipairs(roomListB) do
            if roomA == roomB or table.contains(roomA.connectedRooms,roomB) then --roomA:isConnected(roomB) nao funciona
                goto continueB
            end

            for i, tileA in ipairs(roomA.edgeTiles) do
                for i, tileB in ipairs(roomB.edgeTiles) do
                    local distanceBetweenRooms = (tileA.tileX - tileB.tileX)^2 + (tileA.tileY - tileB.tileY)^2

                    if (distanceBetweenRooms < bestDistance or possibleConnectionFound == false) then
                        bestDistance = distanceBetweenRooms
                        possibleConnectionFound = true
                        bestTileA = tileA
                        bestTileB = tileB
                        bestRoomA = roomA
                        bestRoomB = roomB
                    end
                end
            end
            ::continueB::
        end
        if possibleConnectionFound and not forceAccessibilityFromMainRoom then
            map_select.map = CreatePassage(map_select, bestRoomA, bestRoomB, bestTileA, bestTileB)
        end

        ::continueA::
    end

    if possibleConnectionFound and forceAccessibilityFromMainRoom then
        map_select.map = CreatePassage(map_select, bestRoomA, bestRoomB, bestTileA, bestTileB)
        map_select.map = ConnectClosestRooms(map_select, allRooms, true)
    end

    if not forceAccessibilityFromMainRoom then
        map_select.map = ConnectClosestRooms(map_select, allRooms, true)
    end

    return map_select.map
end

function CreatePassage(map_select, roomA, roomB, tileA, tileB)
    ConnectRooms(roomA,roomB)
    --map_select.map[tileA.tileX][tileA.tileY] = 2
    --map_select.map[tileB.tileX][tileB.tileY] = 2


    local line = GetLine(tileA,tileB)

    for index, c in ipairs(line) do
        --map[c.tileX][c.tileY] = 2
        map_select.map = DrawCircle(map_select, c, 2)
    end

    return map_select.map
end

function DrawCircle(map_select, c, r)
    for x = -r, r, 1 do
        for y = -r, r, 1 do
            if (x*x + y*y <= r*r) then
                local drawX = c.tileX + x
                local drawY = c.tileY + y
                if IsInMapRange(map_select, drawX, drawY) then
                    map_select.map[drawX][drawY] = 0 --alterar para 2 para ver as linhas
                end
            end
        end
    end
    return map_select.map
end

function GetLine(from,to)
    local line = {}
    local x = from.tileX
    local y = from.tileY
    local dx = to.tileX - from.tileX
    local dy = to.tileY - from.tileY

    local inverted = false
    local step = sign(dx)
    local gradientStep = sign(dy)

    local longest = math.abs(dx)
    local shortest = math.abs(dy)

    if longest < shortest then
        inverted = true
        longest = math.abs(dy)
        shortest = math.abs(dx)
        step = sign(dy)
        gradientStep = sign(dx)
    end

    local gradientAccumulation = longest / 2

    for i = 0, longest-1, 1 do
        table.insert(line,Coord.new(x,y))

        if inverted then
            y = y + step
        else
            x = x + step
        end

        gradientAccumulation = gradientAccumulation + shortest

        if gradientAccumulation >= longest then
            if inverted then
                x = x + gradientStep
                
            else
                y = y + gradientStep
            end
            gradientAccumulation = gradientAccumulation - longest
        end

    end
    return line
end

function GetRegions(map_select, tileType)
    local regions = {}
    local mapFlags = {}
    for x = 0, map_select.width, 1 do
        mapFlags[x] = {}
        for y = 0, map_select.height, 1 do
            mapFlags[x][y] = 0
        end
    end

    for x = 0, map_select.width, 1 do
        for y = 0, map_select.height, 1 do
            if mapFlags[x][y] == 0 and map_select.map[x][y] == tileType then
                newRegion = GetRegionTiles(map_select, x, y)
                table.insert(regions,newRegion)
                for index, tile in ipairs(newRegion) do
                    mapFlags[tile.tileX][tile.tileY] = 1
                end
            end
        end
    end
    return regions
end

function GetRegionTiles(map_select, startX, startY)
    local tiles = {}
    local mapFlags = {}
    for x = 0, map_select.width, 1 do
        mapFlags[x] = {}
        for y = 0, map_select.height, 1 do
            mapFlags[x][y] = 0
        end
    end
    local tileType = map_select.map[startX][startY]
    local queue = List.new()
    List.pushright(queue,Coord.new(startX,startY))

    mapFlags[startX][startY] = 1
    local tile = Coord

    while queue.last >= 0 do
        tile = List.popright(queue)
        table.insert(tiles,tile)
        for x = tile.tileX -1, tile.tileX + 1, 1 do
            for y = tile.tileY -1, tile.tileY + 1, 1 do
                if (IsInMapRange(map_select, x, y) and (y == tile.tileY or x == tile.tileX)) then
                    if mapFlags[x][y] == 0 and map_select.map[x][y] == tileType then
                       mapFlags[x][y] = 1
                       List.pushright(queue,Coord.new(x,y))
                    end
                end
            end
        end
    end
    return tiles
end

function IsInMapRange(map_select, x, y)
    return x >= 0 and x <= map_select.width and y >= 0 and y <= map_select.height
end

function GenerateMap(map_select)
    map_select.map = RandomFillMap(map_select)

    for i = 1, 5, 1 do
        map_select.map = SmootMap(map_select)
    end

    -- Cria o local para o player entrar
    for x = 0, map_select.playerSpawn.size, 1 do
        for y = 0, map_select.playerSpawn.size, 1 do
            local realX = x + map_select.playerSpawn.x
            local realY = y + map_select.playerSpawn.y

            map_select.map[realX][realY] = 0
        end
    end

    --remove as salas indesejadas e interliga
    map_select.map = ProcessMap(map_select)

    if map_select.remover_primeira_camada then
        --remover a primeira camada de walls
        map_select.map = RemoverPrimeiraCamadaDeWall(map_select)
    end

    return map_select.map
end

function RemoverPrimeiraCamadaDeWall(map_select)
    local newmap = {}

    for x = 0, map_select.width, 1 do
        newmap[x] = {}
        for y = 0, map_select.height, 1 do
            newmap[x][y] = map_select.map[x][y]
        end
    end

    for x = 0, map_select.width, 1 do
        for y = 0, map_select.height, 1 do

            if map_select.map[x][y] == 0 then
                
                for neib_x = x-1,x+1, 1 do
                    for neib_y = y-1,y+1, 1 do

                        if neib_x > 0 and neib_x < map_select.width and neib_y > 0 and neib_y < map_select.height then
                            if map_select.map[neib_x][neib_y] == 1 and newmap[neib_x][neib_y] ~= 0 then
                                newmap[neib_x][neib_y] = 0
                            end
                        end

                    end
                end

            end

        end
    end
    --printMap(map_select.map, map_select.width, map_select.height)
    return newmap
end

function RandomFillMap(map_select)
    map_select.map = {}
    math.randomseed(os.time())
    for x = 0, map_select.width, 1 do
        map_select.map[x] = {}
        for y = 0, map_select.height, 1 do

            if x == 0 or x == map_select.width-1 or y == 0 or y == map_select.height-1 then
                map_select.map[x][y] =  1
            else
                map_select.map[x][y] = math.random(0,100) < map_select.randonFillPercent and 1 or 0
            end
        end
    end
    return map_select.map
end

function SmootMap(map_select)
    for x = 0, map_select.width, 1 do
        for y = 0, map_select.height, 1 do
            local neighbourWallTiles = GetSurroundingWallCount(map_select, x, y)

            if neighbourWallTiles > 4 then
                map_select.map[x][y] = 1
            elseif neighbourWallTiles < 4  then
                map_select.map[x][y] = 0
            end

        end
    end
    return map_select.map
end

function GetSurroundingWallCount(map_select, gridX,gridY)
    local wallCount = 0
    for neighbourX = gridX-1, gridX+1, 1 do
        for neighbourY = gridY-1, gridY+1, 1 do
            if neighbourX >= 0 and neighbourX < map_select.width and neighbourY >= 0 and neighbourY < map_select.height then
                if neighbourX ~= gridX or  neighbourY ~= gridY then
                    wallCount = wallCount + map_select.map[neighbourX][neighbourY]
                end
            else
                wallCount = wallCount + 1
            end

        end
    end
    return wallCount
end

function printMap(map, width, height)
    for y = 0, width, 1 do
        for x = 0, height, 1 do
            if map[x][y] == 0 then
                io.write(' ')
            elseif map[x][y] == 1 then
                io.write('X')
            else
                io.write(' ')
            end
        end
        io.write('\n')
    end
end

function spawnMap(mapSelect)
    for x = 0, mapSelect.width, 1 do
        for y = 0, mapSelect.height, 1 do

            -- skip player spawn
            if x >= mapSelect.playerSpawn.x and x <= (mapSelect.playerSpawn.x + mapSelect.playerSpawn.size) 
            and y >= mapSelect.playerSpawn.y and y <= (mapSelect.playerSpawn.y + mapSelect.playerSpawn.size) then
                goto skip
            end


            --remove old tiles
            local mapValor = mapSelect.map[x][y]
            local mapLoc = {x = x + mapSelect.startX,y = y + mapSelect.startY,z = mapSelect.startZ}
            local t = Tile(mapLoc)
            t:remove()


            --add cave tiles
            if mapValor == 0 then
                local tiles = BorderizeWalls(mapSelect,x,y)
                if #tiles > 0 then
                    for index, tile in ipairs(tiles) do
                        Game.createItem(tile, 1, mapLoc)
                    end

                    if #mapSelect.style.BorderFlor > 1 then
                        Game.createItem(mapSelect.style.BorderFlor[math.random(#mapSelect.style.BorderFlor)], 1, mapLoc)
                    else
                        Game.createItem(mapSelect.style.BorderFlor[1], 1, mapLoc)
                    end
                else
                    if #mapSelect.style.Flor > 1 then
                        Game.createItem(mapSelect.style.Flor[math.random(#mapSelect.style.Flor)], 1, mapLoc)
                    else
                        Game.createItem(mapSelect.style.Flor[1], 1, mapLoc)
                    end
                end

            else --add wall tiles
                if #mapSelect.style.Wall > 1 then
                    Game.createItem(mapSelect.style.Wall[math.random(#mapSelect.style.Wall)], 1, mapLoc)
                else
                    Game.createItem(mapSelect.style.Wall[1], 1, mapLoc)
                end
            end

            ::skip::
        end
    end
end


function BorderizeWalls(map_select,x,y)
    local tiles = {}
    if map_select.map[x][y] == 0 then
        local n = {}
        local cont = 0
        for neib_y = y-1,y+1, 1 do
            for neib_x = x-1,x+1, 1 do
                if neib_x > 0 and neib_x < map_select.width and neib_y > 0 and neib_y < map_select.height then
                    if map_select.map[neib_x][neib_y] == 1 then
                        n[cont] = true
                    else
                        n[cont] = false
                    end
                else
                    n[cont] = true
                end
                cont = cont + 1
            end
        end

        local neighbour = {}
        neighbour.NW =  n[0]
        neighbour.N =   n[1]
        neighbour.NE =  n[2]
        neighbour.W =   n[3]
        neighbour.E =   n[5]
        neighbour.SW =  n[6]
        neighbour.S =   n[7]
        neighbour.SE =  n[8]
        --[[
        local neighbour = {}
        neighbour.n = map_select.map[x][y-1]
        neighbour.e = map_select.map[x+1][y]
        neighbour.s = map_select.map[x][y+1]
        neighbour.w = map_select.map[x-1][y]
        neighbour.nw = map_select.map[x-1][y-1]
        neighbour.ne = map_select.map[x+1][y-1]
        neighbour.sw = map_select.map[x-1][y+1]
        neighbour.se = map_select.map[x+1][y+1]
        ]]

        --dNW
        if neighbour.N and neighbour.W and not neighbour.E and not neighbour.S then
            table.insert(tiles,map_select.style.dNW)
        end

        --dNE
        if neighbour.N and neighbour.E and not neighbour.W and not neighbour.S then
            table.insert(tiles,map_select.style.dNE)
        end

        --dSW
        if neighbour.S and neighbour.W and not neighbour.N and not neighbour.E then
            table.insert(tiles,map_select.style.dSW)
        end

        --dSE
        if neighbour.S and neighbour.E and not neighbour.N and not neighbour.W then
            table.insert(tiles,map_select.style.dSE)
        end

        -- cNW,cNE,cSW,cSE
        if not neighbour.N and not neighbour.W and not neighbour.E and not neighbour.S then
            if neighbour.NW then
                table.insert(tiles,map_select.style.cNW)
            end
            if neighbour.NE then
                table.insert(tiles,map_select.style.cNE)
            end
            if neighbour.SW then
                table.insert(tiles,map_select.style.cSW)
            end
            if neighbour.SE then
                table.insert(tiles,map_select.style.cSE)
            end
        end
        
        --N
        if neighbour.N and not neighbour.W and not neighbour.E then
            table.insert(tiles,map_select.style.N)
        end
        --E
        if neighbour.E and not neighbour.N and not neighbour.S then
            table.insert(tiles,map_select.style.E)
        end
        --S
        if neighbour.S and not neighbour.W and not neighbour.E then
            table.insert(tiles,map_select.style.S)
        end
        --W
        if neighbour.W and not neighbour.N and not neighbour.S then
            table.insert(tiles,map_select.style.W)
        end


    end

    return tiles
end

function RemoveOlderSpawns(map_select)
    local spawnId
    for x = 0, map_select.width, 1 do
        for y = 0, map_select.height, 1 do
            local mapLoc = {x = x + map_select.startX,y = y + map_select.startY,z = map_select.startZ}
            local t = Tile(mapLoc)
            local creatures = t:getCreatures()
            if creatures then
                for index, creature in ipairs(creatures) do
                    if not creature:isPlayer() then
                        local creatureID = creature:getId()

                        if MonstersSpawns[creatureID] then
                            spawnId = MonstersSpawns[creatureID].spawnId
                            MonstersSpawns[creatureID] = nil
                        end
                        creature:remove()
                    end
                end
            end

        end
    end

    --delete the other respawns if the creature was not found:
    for key, m in pairs(MonstersSpawns) do
        if m.spawnId == spawnId then
            MonstersSpawns[key] = nil
        end
    end

end

function AddNewSpawns(map_select)
    for index, monster in ipairs(map_select.monsters) do
        for i = 1, monster.amount, 1 do

            local m = nil
            while m == nil do
                local mapvalue = 1
                local randX = 0
                local randY = 0
                while mapvalue ~= 0 do
                    randX =math.random(0,map_select.width)
                    randY =math.random(0,map_select.height)
                    mapvalue = map_select.map[randX][randY]
                end
                m = Game.createMonster(monster.name,{x=randX + map_select.startX,y=randY+map_select.startY,z=map_select.startZ})
            end

            if m then
                MonstersSpawns[m:getId()] = {pos=m:getPosition(), spawnId=map_select.spawnId, time=monster.time}
                m:registerEvent("MonsterSpawn")
            end

        end
    end
end

function SpawnMonsterEvent(name,pos,key)
	if MonstersSpawns[key] then
		local monster = Game.createMonster(name, pos)
		if monster then
			monster:registerEvent("MonsterSpawn")
			local spawnId = MonstersSpawns[key].spawnId
            local time = MonstersSpawns[key].time
            MonstersSpawns[key] = nil
            MonstersSpawns[monster:getId()] = {pos=monster:getPosition(), spawnId=spawnId, time=time}
		else
			print("Nao deu para respawnar, tentando em 5 segundos")
			addEvent(SpawnMonsterEvent, 5000, name, pos, key)
		end
	else
		--print("Spawn not found")
	end
    return true
end


local creatureevent = CreatureEvent("MonsterSpawn")
function creatureevent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)

    for key, spawn in pairs(MonstersSpawns) do
        if key == creature:getId() then
            local event = addEvent(SpawnMonsterEvent, spawn.time + math.random(1,3)*1000, creature:getName(), spawn.pos, key)
			return true
        end
    end
	return true

end
creatureevent:register()


local ProceduralMap = Action()
function ProceduralMap.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    item:transform(ALAVANCA[item.itemid].usada)
    local fistloc = player:getPosition()
    local MAP_SELECT = MAPS[item.actionid - MAPS_fromaid]

    MAP_SELECT.map = GenerateMap(MAP_SELECT)
    RemoveOlderSpawns(MAP_SELECT)
    spawnMap(MAP_SELECT)
    AddNewSpawns(MAP_SELECT)


    --update the minimap
    for y = 0, MAP_SELECT.width, 10 do
        for x = 0, MAP_SELECT.height, 10 do
            player:teleportTo({x = x + MAP_SELECT.startX,y = y + MAP_SELECT.startY,z = MAP_SELECT.startZ})
        end
    end
    player:teleportTo(fistloc)
    
    return true
end

for aid = MAPS_fromaid, MAPS_toaid do
    ProceduralMap:aid(aid)
end

ProceduralMap:register()

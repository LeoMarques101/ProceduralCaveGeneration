
List = {}

function List.new ()
    return {first = 0, last = -1}
end

function List.pushleft (list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

function List.pushright (list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function List.popleft (list)
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil        -- to allow garbage collection
    list.first = first + 1
    return value
end

function List.popright (list)
    local last = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last] = nil         -- to allow garbage collection
    list.last = last - 1
    return value
end

Coord = {
    tileX = 0,
    tileY = 0
}
function Coord.new(x,y)
    return {tileX = x, tileY = y}
end


Room = {
    tiles = {},
    edgeTiles = {},
    connectedRooms = {},
    roomSize = 0,
    isAccessibleFromMainRoom = false,
    isMainRoom = false,
}

function Room.newEmpty()
    return {
        tiles = {},
        edgeTiles = {},
        connectedRooms = {},
        roomSize = 0,
        isAccessibleFromMainRoom = false,
        isMainRoom = false
    }
end

function Room.new(roomTiles, map)
    tiles = roomTiles
    roomSize = #tiles
    edgeTiles = {}
    connectedRooms = {}
    
    for index, tile in ipairs(tiles) do
        for x = tile.tileX-1, tile.tileX+1, 1 do
            for y = tile.tileY-1, tile.tileY+1, 1 do
                if x == tile.tileX or y == tile.tileY then
                   if map[x][y] == 1 then
                        table.insert(edgeTiles,tile)
                   end
                end
            end
        end
    end

    return {
        tiles = tiles,
        roomSize = roomSize,
        edgeTiles = edgeTiles,
        connectedRooms = connectedRooms,
        isAccessibleFromMainRoom = false,
        isMainRoom = false
    }
end

function Room:SetAccessibleFromMainRoom()

    if self.isAccessibleFromMainRoom == false then
        self.isAccessibleFromMainRoom = true

        for index, connectedRoom in ipairs(self.connectedRooms) do
            Room.SetAccessibleFromMainRoom(connectedRoom)
            --connectedRoom:SetAccessibleFromMainRoom()
        end

    end
end

function Room.isConnected(otherRoom)
    return table.contains(self.connectedRooms,otherRoom)
end

function ConnectRooms(roomA,roomB)
    if roomA.isAccessibleFromMainRoom then
        Room.SetAccessibleFromMainRoom(roomB)

        --roomA:SetAccessibleFromMainRoom()
    elseif roomB.isAccessibleFromMainRoom then
        Room.SetAccessibleFromMainRoom(roomA)
        --roomB:SetAccessibleFromMainRoom()
    end
    table.insert(roomA.connectedRooms,roomB)
    table.insert(roomB.connectedRooms,roomA)
end

function sign(n)
    return n==0 and 0 or math.abs(n)/n
end
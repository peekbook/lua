local mysql = require("resty.mysql")

-- Database connection manager
Database = {}
Database.__index = Database

function Database:new(config)
    local db = mysql:new()
    db:set_timeout(1000) -- 1 second timeout

    local ok, err, errno, sqlstate = db:connect({
        host = config.host,
        port = config.port,
        database = config.database,
        user = config.user,
        password = config.password,
        charset = "utf8mb4",
        max_packet_size = 1024 * 1024
    })

    if not ok then
        error("Failed to connect to database: " .. err)
    end

    local obj = { db = db }
    setmetatable(obj, self)
    return obj
end

function Database:execute(query, params)
    if params then
        -- Replace `?` placeholders with sanitized values
        for _, param in ipairs(params) do
            local safe_param = self:escape(param)
            query = query:gsub("?", safe_param, 1)
        end
    end

    local res, err, errno, sqlstate = self.db:query(query)
    if not res then
        error("Query execution failed: " .. err)
    end

    return res
end

function Database:escape(value)
    if type(value) == "string" then
        return ngx.quote_sql_str(value) -- Escape strings safely
    end
    return tostring(value)
end

function Database:close()
    local ok, err = self.db:set_keepalive(10000, 50)
    if not ok then
        error("Failed to set keepalive: " .. err)
    end
end

-- Base repository
BaseRepository = {}
BaseRepository.__index = BaseRepository

function BaseRepository:new(database)
    local obj = { database = database }
    setmetatable(obj, self)
    return obj
end

-- UserRepository
UserRepository = {}
UserRepository.__index = UserRepository
setmetatable(UserRepository, BaseRepository)

function UserRepository:new(database)
    local obj = BaseRepository:new(database)
    setmetatable(obj, self)
    return obj
end

function UserRepository:save(entity)
    local metadata = entity.__metadata
    if not metadata or not metadata.table or not metadata.columns then
        error("Entity metadata is not properly defined!")
    end

    local tableName = metadata.table
    local columnNames, values = {}, {}
    for key, columnInfo in pairs(metadata.columns) do
        table.insert(columnNames, columnInfo.column)
        table.insert(values, entity[key])
    end

    local placeholders = string.rep("?", #columnNames, ", "):gsub(", $", "")
    local query = string.format(
        "INSERT INTO %s (%s) VALUES (%s)",
        tableName,
        table.concat(columnNames, ", "),
        placeholders
    )
    self.database:execute(query, values)
    print("Entity saved successfully!")
end

function UserRepository:findById(id)
    local metadata = User.__metadata
    local query = string.format("SELECT * FROM %s WHERE id = ?", metadata.table)
    local results = self.database:execute(query, { id })
    return results[1]
end

function UserRepository:deleteById(id)
    local metadata = User.__metadata
    local query = string.format("DELETE FROM %s WHERE id = ?", metadata.table)
    self.database:execute(query, { id })
    print("Entity deleted successfully!")
end

-- Example usage
local config = {
    host = "127.0.0.1",
    port = 3306,
    user = "root",
    password = "password",
    database = "test_db"
}

local database = Database:new(config)
local userRepo = UserRepository:new(database)

User = {
    __metadata = {
        table = "users",
        columns = {
            id = { column = "id", id = true },
            name = { column = "name" },
            email = { column = "email" }
        }
    }
}

local user = {
    id = 1,
    name = "John Doe",
    email = "john@example.com",
    __metadata = User.__metadata
}

-- Save user
userRepo:save(user)

-- Find user
local foundUser = userRepo:findById(1)
print("Found user: ", foundUser.name)

-- Delete user
userRepo:deleteById(1)

-- Close the database connection
database:close()

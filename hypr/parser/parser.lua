require("scanner")

io.input("../colors.conf")
local file = io.read("*all")

local scanner = Scanner:new(file)

local token = scanner:scan_token()
while token.type ~= TokenType.EOF do
    local token_str = token:__tostring()
    local padding = string.rep(" ", 16 - token_str:len())

    io.write(token_str, padding)

    if token.type == TokenType.NEWLINE then
        io.write("\\n\n")
    else
        io.write("'", token.lexeme, "'\n")
    end

    token = scanner:scan_token()
end

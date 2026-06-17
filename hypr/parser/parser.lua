local scanner = require("scanner")

io.input("~/.config/hypr/colors.conf")
local file = io.read("*all")

scanner.init_scanner(file)

local token = scanner.scan_token()
while token.type ~= TokenType.EOF do
    local token_str = token:__tostring()
    local padding = string.rep(" ", 16 - token_str:len())
    if token.type == TokenType.NEWLINE then
        io.write(token_str, padding, "\\n\n")
    else
        io.write(token_str, padding, token:lexeme(), "\n")
    end
    token = scanner.scan_token()
end
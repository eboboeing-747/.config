TokenType = {
    DOLLAR = {},
    IDENTIFIER = {},
    EQUAL = {},
    VALUE = {},
    NEWLINE = {},
    EOF = {},
    ERROR = {},
}

local scanner = {
    start = 1,
    current = 1,
    line = 0,
    file = nil,
}

local function init_scanner(file)
    scanner.file = file
end

local Token = {}

function Token:new(type)
    local public = {}
        public.type = type
        public.start = scanner.start
        public.length = scanner.current - scanner.start
        public.line = scanner.line

    setmetatable(public, self)
    Token.__index = self
    return public
end

function Token:__tostring()
    if self.type == TokenType.DOLLAR then
        return "DOLLAR"
    elseif self.type == TokenType.IDENTIFIER then
        return "IDENTIFIER"
    elseif self.type == TokenType.EQUAL then
        return "EQUAL"
    elseif self.type == TokenType.VALUE then
        return "VALUE"
    elseif self.type == TokenType.NEWLINE then
        return "NEWLINE"
    elseif self.type == TokenType.EOF then
        return "EOF"
    elseif self.type == TokenType.ERROR then
        return "ERROR"
    else
        return "UNKNOWN_TOKEN"
    end
end

function Token:lexeme()
    return "'" .. scanner.file:sub(self.start, self.start + self.length - 1) .. "'"
end

local function is_at_end()
    return scanner.current == scanner.file:len();
end

local function at(i)
    return scanner.file:sub(i, i)
end

local function advance()
    scanner.current = scanner.current + 1
    return at(scanner.current - 1)
end

local function peek()
    return at(scanner.current)
end

local function skip_whitespace()
    while true do
        local c = peek()

        if c == " " or c == "\t" or c == "\r" then
            advance()
            break
        else
            return
        end
    end
end

local function is_aplha(c)
    return not not c:match("^[%a_]$")
end

local function is_digit(c)
    return not not c:match("^%d$")
end

local function is_special(c)
    return not not c:match("^[#~,/%(%)%.%-]")
end

local function identifier_or_value(type)
    local type = type or TokenType.IDENTIFIER

    while is_aplha(peek()) or is_digit(peek()) or is_special(peek()) do
        local c = advance()

        if is_special(c) then
            type = TokenType.VALUE
        end
    end

    return Token:new(type)
end

local function scan_token()
    skip_whitespace()
    scanner.start = scanner.current

    if is_at_end() then return Token:new(TokenType.EOF) end

    local c = advance()

    if c == "$" then
        return Token:new(TokenType.DOLLAR)
    elseif c == "=" then
        return Token:new(TokenType.EQUAL)
    elseif c == '\n' then
        scanner.line = scanner.line + 1
        return Token:new(TokenType.NEWLINE)
    elseif is_aplha(c) then
        return identifier_or_value()
    elseif is_digit(c) or is_special(c) then
        return identifier_or_value(TokenType.VALUE)
    end

    return Token:new(Token.ERROR)
end

return {
    init_scanner = init_scanner,
    scan_token = scan_token,
}

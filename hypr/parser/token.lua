TokenType = {
    DOLLAR = {},
    IDENTIFIER = {},
    EQUAL = {},
    VALUE = {},
    NEWLINE = {},
    EOF = {},
    ERROR = {},
}

Token = {}

function Token:new(type, lexeme, line)
    local public = {}
        public.type = type
        public.lexeme = lexeme
        public.line = line

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

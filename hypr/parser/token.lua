TokenType = {
    DOLLAR = "DOLLAR",
    IDENTIFIER = "IDENTIFIER",
    EQUAL = "EQUAL",
    LITERAL = "LITERAL",
    NEWLINE = "NEWLINE",
    EOF = "EOF",
    ERROR = "ERROR",
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
    return self.type
end

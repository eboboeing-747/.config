require("token")

local function is_aplha(c)
    return not not c:match("^[%a_]$")
end

local function is_digit(c)
    return not not c:match("^%d$")
end

local function is_special(c)
    return not not c:match("^[#~,/%(%)%.%-]")
end

Scanner = {}

function Scanner:new(file)
    local public = {}
        public.start = 1
        public.current = 1
        public.line = 1
        public.file = file

    setmetatable(public, self)
    Scanner.__index = self
    return public
end

function Scanner:lexeme()
    if self.start > self.file:len() then
        return "\0"
    end

    return self.file:sub(self.start, self.current - 1)
end

function Scanner:is_at_end()
    return self.start > self.file:len()
end

function Scanner:at(i)
    return self.file:sub(i, i)
end

function Scanner:advance()
    self.current = self.current + 1
    return self:at(self.current - 1)
end

function Scanner:peek()
    return self:at(self.current)
end

function Scanner:skip_whitespace()
    while true do
        local c = self:peek()

        if c == " " or c == "\t" or c == "\r" then
            self:advance()
            break
        else
            return
        end
    end
end

function Scanner:identifier_or_literal(type)
    local type = type or TokenType.IDENTIFIER

    while is_aplha(self:peek()) or is_digit(self:peek()) or is_special(self:peek()) do
        local c = self:advance()

        if is_special(c) then
            type = TokenType.LITERAL
        end
    end

    return Token:new(type, self:lexeme(), self.line)
end

function Scanner:scan_token()
    self:skip_whitespace()
    self.start = self.current

    if self:is_at_end() then
        return Token:new(TokenType.EOF, self:lexeme(), self.line)
    end

    local c = self:advance()

    if c == "$" then
        return Token:new(TokenType.DOLLAR, self:lexeme(), self.line)
    elseif c == "=" then
        return Token:new(TokenType.EQUAL, self:lexeme(), self.line)
    elseif c == "\n" then
        self.line = self.line + 1
        return Token:new(TokenType.NEWLINE, self:lexeme(), self.line)
    elseif is_aplha(c) then
        return self:identifier_or_literal()
    elseif is_digit(c) or is_special(c) then
        return self:identifier_or_literal(TokenType.LITERAL)
    end

    return Token:new(TokenType.ERROR, self:lexeme(), self.line)
end

require("token")
require("scanner")
require("values")

Parser = {}

function Parser:new(path)
    io.input(path)
    local file = io.read("*all")

    local public = {}
        public.path = path
        public.values = Values:new()
        public.scanner = Scanner:new(file)
        public.previous = Token:new(TokenType.EOF)
        public.current = Token:new(TokenType.EOF)
        public.panic_mode = false
        public.had_error = false

    setmetatable(public, self)
    Parser.__index = self
    return public
end

function Parser:advance()
    self.previous = self.current

    while true do
        self.current = self.scanner:scan_token()
        if self.current.type ~= TokenType.ERROR then
            break
        end

        self:error("unknown token: '" .. self.current.lexeme .. "'")
    end
end

function Parser:check(type)
    return self.current.type == type
end

function Parser:match(type)
    if not self:check(type) then
        return false
    end

    self:advance()
    return true
end

function Parser:variable()
    self:consume(TokenType.IDENTIFIER, "expected identifier after '$'")
    local name = self.previous.lexeme

    if not self.values.data[name] then
        self:error("undeclared identifier '" .. name .. "'")
        return
    end

    self.values:push(self.values.data[name])
end

function Parser:expression()
    while not self:check(TokenType.NEWLINE) and not self:check(TokenType.EOF) do
        if self:match(TokenType.LITERAL) then
            self.values:push(self.previous.lexeme)
        elseif self:match(TokenType.DOLLAR) then
            self:variable()
        else
            self:error("expected a literal or a variable")
            return
        end
    end
end

function Parser:declaration()
    self:consume(TokenType.IDENTIFIER, "expected identifier after '$'")

    local name = self.previous.lexeme
    self.values:next(name)
    self:consume(TokenType.EQUAL, "expected '=' after identifier")

    self:expression()
    self.values:seal()

    if self:match(TokenType.NEWLINE) or self:match(TokenType.EOF) then
        return
    end

    self:error("unterminated declaration")
end

function Parser:consume(type, message)
    if self.current.type == type then
        self:advance()
        return
    end

    self:error(message)
end

function Parser:error(...)
    if self.panic_mode then return end
    self.had_error = true
    self.panic_mode = true
    io.write("[parse error] at " .. self.path .. " near line " .. self.current.line .. ": ", ..., "\n")
end

function Parser:syncronize()
    self.panic_mode = false

    while self.current.type ~= TokenType.EOF do
        if self.previous.type == TokenType.NEWLINE then
            return
        end

        self:advance()
    end
end

function Parser:parse()
    self:advance()

    while not self:match(TokenType.EOF) do
        if self:match(TokenType.DOLLAR) then
            self:declaration()
        elseif self:match(TokenType.NEWLINE) then
            goto continue
        else
            self:error("declaration starts with a '$'")
        end

        if self.panic_mode then
            self:syncronize()
        end
        ::continue::
    end

    if self.had_error then
        return nil
    end

    return self.values.data
end


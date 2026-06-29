Values = {}

function Values:new()
    local public = {}
        public.current = nil
        public.buffer = nil
        public.data = {}

    setmetatable(public, self)
    Values.__index = self
    return public
end

function Values:next(name)
    if self.data[name] then
        return false
    end

    self.current = name
    self.buffer = {}
    return true
end

function Values:push(element)
    if not self.current then
        return false
    end

    self.buffer[#self.buffer + 1] = element
    return true
end

function Values:gradient()
    return {
        colors = { self.buffer[1], self.buffer[2] },
        angle = tonumber(self.buffer[3]:match("^%d+"))
    }
end

function Values:seal()
    if not self.buffer then return false end

    if #self.buffer == 1 then
        self.data[self.current] = self.buffer[1]
    elseif #self.buffer == 3 then
        self.data[self.current] = self:gradient()
    else
        return false
    end

    self.current = nil
    self.buffer = nil
    return true
end

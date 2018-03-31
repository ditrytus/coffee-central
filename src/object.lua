Object = {}

function Object:new(obj)
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Object:draw()
  if self ~= nil then
    if self._draw ~= nil then
      self._draw(self)
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        self.children[i]:draw()
      end
    end
  end
end

function Object:init()
  if self ~= nil then
    if self._init ~= nil then
      self._init(self)
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        self.children[i]:init()
      end
    end
  end
end

function Object:update()
  if self ~= nil then
    if self._update ~= nil then
      self._update(self)
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        self.children[i]:update()
      end
    end
  end
end

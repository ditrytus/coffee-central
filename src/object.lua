Object = {}

function Object:new(obj)
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Object:draw()
  if self ~= nil then
    if self.draw ~= nil then
      self.draw()
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        local child = self.children[i]
        child:draw(child)
      end
    end
  end
end

function Object:init()
  if self ~= nil then
    if self.init ~= nil then
      self.init()
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        local child = self.children[i]
        child:init(child);
      end
    end
  end
end

function Object:update()
  if self ~= nil then
    if self.update ~= nil then
      self.update()
    end
    if self.children ~= nil then
      for i = 1, #self.children do
        local child = self.children[i]
        child:update(child)
      end
    end
  end
end

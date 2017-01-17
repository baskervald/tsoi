local char_skills = {
  isaac = require('lua.tree.isaac'),
  maggy = require('lua.tree.maggy'),
  cain = require('lua.tree.cain'),
  judas = require('lua.tree.judas'),
  bluebaby = require('lua.tree.bluebaby'),
  eve = require('lua.tree.eve'),
  samson = require('lua.tree.samson'),
  azazel = require('lua.tree.azazel'),
  lazarus = require('lua.tree.lazarus'),
  lost = require('lua.tree.lost'),
  lilith = require('lua.tree.lilith'),
  keeper = require('lua.tree.keeper'),
  apollyon = require('lua.tree.apollyon'),
}

local Tree = {}

function Tree:new(character, seed)
  local ret = {
    __index = Tree
  }
  if char_skills[character] ~= nil then
    ret.skills = char_skills[character]
  else
    ret.skills = eden_skills()
  end
  setmetatable(ret, self)
  self:plant_seed(seed)
  return ret
end

function Tree:plant_seed(seed)
  math.randomseed(seed)
end

function eden_skills()
  ret = {}
  for char,table in pairs(char_skills) do
    for k, v in pairs(table) do
      ret[k] = v
    end
  end
  return ret
end

return Tree

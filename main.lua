local TSoI = RegisterMod("TheSpeccingofIsaac", 1)
local spacebar = Isaac.GetItemIdByName("Spacebar")

TSoI.tree_open = false
TSoI.tree = nil
TSoI.rng = RNG()

function TSoI:spacebar()
  local pos = Game():GetRoom():GetTopLeftPos()
  Isaac.DebugString("X" .. pos.X .. " Y" .. pos.Y)
  pos = Game():GetRoom():GetBottomRightPos()
  Isaac.DebugString("X" .. pos.X .. " Y" .. pos.Y)
  Isaac.DebugString(self.rng:GetSeed())
  Isaac.DebugString(self.rng:RandomInt(2))
  Isaac.DebugString(self.rng:RandomInt(2))
  Isaac.DebugString(self.rng:RandomInt(2))
  self.rng = RNG()
  -- if self.tree_open then
  --   self.tree:send_confirm()
  -- else
  --   self:handle_action_use()
  -- end
end

TSoI:AddCallback( ModCallbacks.MC_USE_ITEM, TSoI.spacebar, spacebar )

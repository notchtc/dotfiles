-- mod-version:3
local core = require "core"
local command = require "core.command"


local function eval(str)
  local fn, err = load("return " .. str)
  if not fn then fn, err = load(str) end
  assert(fn, err)
  return tostring(fn())
end


command.add("core.docview", {
  ["eval:insert"] = function(dv)
    core.command_view:enter("Evaluate And Insert Result", {
      submit = function(cmd)
        dv.doc:text_input(eval(cmd))
      end
    })
  end,

  ["eval:replace"] = function(dv)
    core.command_view:enter("Evaluate And Replace With Result", {
      submit = function(cmd)
        dv.doc:replace(function(str)
          return eval(cmd)
        end)
      end
    })
  end,
})

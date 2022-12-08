-- Original Author: Ole Jørgen Brønner (olejorgenb@yahoo.no)
-- Requirement: xclip
-- Installation:
-- 'mkdir -p ~/.config/mpv/scripts && cp -i copy-permalink.lua ~/.config/mpv/scripts'

-- I only modified this to copy ONLY the link

function copyPermalink()
  local uri = mp.get_property("path")
  local bookmark = string.format("%s", uri)
  local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(bookmark)
  pipe:close()
  mp.osd_message("Link copied to clipboard")
end

-- mp.register_script_message("copy-permalink", copyPermalink)
mp.add_key_binding("ctrl+SPACE", "copy-permalink", copyPermalink)

function set_osd_title()
    local name = mp.get_property_osd("media-title")
    local chapter = ""

    if mp.get_property_osd("chapter") ~= "" then
        chapter = " • " .. mp.get_property_osd("chapter")
    end

    mp.set_property("force-media-title", name .. chapter )
end

mp.observe_property("chapter", "string", set_osd_title)

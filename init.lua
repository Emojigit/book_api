local function get_book(title,writer,text)
	if not text then
		return false
	end
	if not(minetest.get_modpath("default")) then
		return false, "No mods can make books"
	end
	local item = ItemStack("default:book_written")
	local meta = item:get_meta()
	local data = {}
	data.owner = writer or "Universe itself" -- Minecraft 20w14infinite
	local title = title or "Unknown book generate by book_api"
	data.title = title
	data.description = "\""..title.."\" by "..data.owner
	data.text = dump(text)
	data.text = data.text:gsub("\r\n", "\n"):gsub("\r", "\n")
	data.page = 1
	data.page_max = math.ceil((#data.text:gsub("[^\n]", "") + 1) / lpp)
	item:get_meta():from_table({ fields = data })
	return item
end

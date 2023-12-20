local M = {}

local function get_middle_path(path)
	if path:find("gitlab") then
		return "/-/blob/main/"
	end

	if path:find("github") then
		return "/tree/main/"
	end

	return "unknown"
end

-- Function to get the remote URL of the current file
local function get_remote_url_of_current_file()
	-- Get the remote URL of the Git repository
	local handle = io.popen("git config --get remote.origin.url")

	if handle == nil then
		return ""
	end

	local remote_url = handle:read("*a")
	handle:close()

	-- Remove the ".git" suffix from the URL
	local remote_url_without_dot_git = remote_url:gsub("%.git", "")

	local relative_path = vim.fn.expand("%")
	local middle_path = get_middle_path(remote_url_without_dot_git)
	local file_path_relative_to_git_root = remote_url_without_dot_git .. middle_path .. relative_path

	return file_path_relative_to_git_root:gsub("\n", "")
end

-- Function to copy a string to the clipboard
local function copy_to_clipboard(text)
	-- Check if the text is a string
	if type(text) ~= "string" then
		error("Text must be a string")
	end

	-- Copy the text to the clipboard
	vim.fn.setreg("+", text)
end

function M.copy_url()
	local url = get_remote_url_of_current_file()
	copy_to_clipboard(url)
end

return M

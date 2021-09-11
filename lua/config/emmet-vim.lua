local augroup = require("nvim-lua-autocmd").augroup

-- Enable just for html/css
vim.g.user_emmet_install_global = 0
augroup("emmet", function(a)
	a:autocmd("FileType", function(c)
		c:list({ "liquid", "html", "css", "vue" })
		c:exe("EmmetInstall")
	end)
end)

-- remap leader key
vim.g.user_emmet_leader_key = "<C-m>"

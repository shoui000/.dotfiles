local M = {}

local template = [[
---
tags:
	- {{cursor}}
created: {{date}}
---

# {{title}}

]]

function M.nota()
	vim.ui.input({
		prompt = "Nome da nota: ",
		default = "",
	}, function(nome)
		if not nome or nome == "" then
			return
		end

		local anotacoes = vim.env.ANOTACOES

		if not anotacoes then
			vim.notify("ANOTACOES não está definida", vim.log.levels.ERROR)
			return
		end

		local data = os.date("%Y-%m-%d")
		local inbox = vim.fs.joinpath(anotacoes, "inbox")
		local arquivo = vim.fs.joinpath(inbox, data .. "-" .. nome .. ".md")

		local novo = not vim.uv.fs_stat(arquivo)

		-- Primeiro abre a nova tab
		vim.cmd.tabnew(vim.fn.fnameescape(arquivo))
		vim.cmd.tcd(vim.fn.fnameescape(anotacoes))

		-- Não sobrescreve notas existentes
		if not novo then
			return
		end

		-- Preenche o template
		local t = template
		:gsub("{{title}}", function() return nome end)
		:gsub("{{date}}", function() return data end)

		local linhas = vim.split(t, "\n")
		local cursor_linha = nil

		for i, linha in ipairs(linhas) do
			if linha:find("{{cursor}}", 1, true) then
				linhas[i] = linha:gsub("{{cursor}}", "")
				cursor_linha = i
				break
			end
		end

		vim.api.nvim_buf_set_lines(0, 0, -1, false, linhas)

		if cursor_linha then
			vim.api.nvim_win_set_cursor(0, { cursor_linha, 0 })
			vim.cmd("startinsert!")
		end
	end)
end

function M.setup()
	vim.api.nvim_create_user_command("Nota", M.nota, {})

	vim.keymap.set("n", "<leader>nw", M.nota)

	vim.keymap.set("n", "<leader>nn", function()
		local anotacoes = vim.env.ANOTACOES

		if not anotacoes then
			vim.notify("ANOTACOES não está definida", vim.log.levels.ERROR)
			return
		end
		vim.cmd.tabnew(anotacoes)
		vim.cmd.tcd(vim.fn.fnameescape(anotacoes))
	end)

	vim.keymap.set("n", "<leader>nrg", function()
		local anotacoes = vim.env.ANOTACOES

		if not anotacoes then
			vim.notify("ANOTACOES não está definida", vim.log.levels.ERROR)
			return
		end

		vim.cmd.tabnew(anotacoes)
		vim.cmd.tcd(vim.fn.fnameescape(anotacoes))

		local builtin = require("telescope.builtin")

		builtin.live_grep({
			cwd = anotacoes,
			glob_pattern = "*.md",
		})
	end, { desc = "Pesquisar dentre as notas" })
end

return M

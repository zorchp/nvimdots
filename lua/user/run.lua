local function CodeRunner()
	--[===[========================== Global ===========================]===]
	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		callback = function()
			vim.fn.execute("silent! write")
			-- vim.notify("Autosaved!", vim.log.levels.INFO, {})
		end,
	})

	-- for suppress warning when use latex
	vim.g.skip_ts_context_commentstring_module = true

	-- for generate doc with neogen
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>ng",
		":lua require('neogen').generate()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"i",
		"<Leader>ng",
		":lua require('neogen').generate()<CR>",
		{ noremap = true, silent = true }
	)

	vim.api.nvim_set_keymap(
		"n",
		"<Leader>nc",
		":lua require('neogen').generate({ type = 'class' })<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"i",
		"<Leader>nc",
		":lua require('neogen').generate({ type = 'class' })<CR>",
		{ noremap = true, silent = true }
	)

	--[===[========================== Static ===========================]===]
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "c",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te gcc-13 -Wshadow -Wall -std=c11 -o %:p:r.out %:p  && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				-- "<ESC>:w<CR>:split<CR>:te clang -Wshadow -Wall -std=c11 -o %:p:r.out %:p && time %:p:r.out<CR>",
				"<ESC>:w<CR>:split<CR>:te clang -Wshadow -Wall -std=c11 -o %:p:r.out %:p -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te gcc-13 -Wshadow -Wall -std=c11 -o %:p:r.out %:p && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				-- "<ESC>:w<CR>:split<CR>:te clang -Wshadow -Wall -std=c11 -o %:p:r.out %:p && time %:p:r.out<CR>",
				"<ESC>:w<CR>:split<CR>:te clang -Wshadow -Wall -std=c11 -o %:p:r.out %:p -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cpp",
		callback = function()
			-- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te g++-13 -Wl,-ld_classic -std=c++2a -Wshadow -Wall -o %:p:r.out %:p  && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te clang++ -std=c++2a -Wshadow -Wall -o %:p:r.out %:p -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -frelaxed-template-template-args && time %:p:r.out<CR>",
				-- "<ESC>:w<CR>:split<CR>:te clang++ -std=c++2a -Wshadow -Wall -o %:p:r.out %:p && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te g++-13 -Wl,-ld_classic -std=c++2a -Wshadow -Wall -o %:p:r.out %:p  && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				-- "<ESC>:w<CR>:split<CR>:te clang++ -std=c++2a -Wshadow -Wall -o %:p:r.out %:p && time %:p:r.out<CR>",
				"<ESC>:w<CR>:split<CR>:te clang++ -std=c++2a -Wshadow -Wall -o %:p:r.out %:p -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -frelaxed-template-template-args && time %:p:r.out<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "java",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te javac %:p:. && cd %:p:h && java %:t:r<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te javac %:p:. && cd %:p:h && java %:t:r<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te java %:p<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te java %:p<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				":w<CR>:split<CR>:te cargo run <CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te cargo run <CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				":w<CR>:split<CR>:te rustc %:p -o %:p:r.out && time %:p:r.out <CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te rustc %:p -o %:p:r.out && time %:p:r.out <CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	--[===[===================== Script ====================]===]
	--
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				":w<CR>:split<CR>:te time python3 %:p <CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te time python3 %:p <CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "lua",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te lua %<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				":w<CR>:split<CR>:te lua %<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "make",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te make <CR>i",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te make clean<CR>i",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te make <CR>i",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F8>",
				"<ESC>:w<CR>:split<CR>:te make clean<CR>i",
				{ silent = true, noremap = true }
			)
		end,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cmake",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te cmake .<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "shell",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"i",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te bash %<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<F7>",
				"<ESC>:w<CR>:split<CR>:te bash %<CR>",
				{ silent = true, noremap = true }
			)
		end,
	})

	--[===[==================== TypeWritting ===================]===]

	-- use vimtex instead
	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	pattern = "tex",
	-- 	callback = function()
	-- 		vim.api.nvim_buf_set_keymap(
	-- 			0,
	-- 			"i",
	-- 			"<F8>",
	-- 			"<ESC>:w<CR>:split<CR>:te latexmk %<CR>",
	-- 			{ silent = true, noremap = true }
	-- 		)
	-- 		vim.api.nvim_buf_set_keymap(
	-- 			0,
	-- 			"n",
	-- 			"<F8>",
	-- 			"<ESC>:w<CR>:split<CR>:te latexmk %<CR>",
	-- 			{ silent = true, noremap = true }
	-- 		)
	-- 	end,
	-- })
end

CodeRunner()

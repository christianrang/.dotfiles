vim.keymap.set("n", "<leader>nd", function () DailyNotes() end)

function DailyNotes()
    local filepath = "~/notes/daily/" .. os.date("%Y/%m/%d") .. ".md"
    print(filepath)

    local function is_buffer_exists(options)
        local buffer_name = options.buffer_name

        for buffer = 1, vim.fn.bufnr('$') do
            if buffer_name == vim.fn.bufname(buffer) then
                return true
            end
        end

        return false
    end

    local exists = is_buffer_exists({buffer_name = filepath})

    if exists then
        vim.cmd("bw " .. filepath)
    else
        vim.cmd("e " .. filepath)
    end
end

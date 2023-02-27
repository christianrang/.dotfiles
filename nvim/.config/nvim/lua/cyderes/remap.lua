vim.keymap.set("n", "<leader>fc", function () ChronicleConfig() end)

function ChronicleConfig()
    local configuration = os.getenv("FORWARDERCONFIGDIR") .. "configuration.yaml"

    local function is_buffer_exists(options)
        local buffer_name = options.buffer_name

        for buffer = 1, vim.fn.bufnr('$') do
            if buffer_name == vim.fn.bufname(buffer) then
                return true
            end
        end

        return false
    end

    local exists = is_buffer_exists({buffer_name = configuration})

    if exists then
        vim.cmd("bw " .. configuration)
    else
        vim.cmd("e " .. configuration)
    end
end

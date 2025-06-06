return {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {
        open_in_place = true  -- Open the file in place instead of creating a new buffer
    },
    keys = {
        { "<leader>fr", ":GrugFar<CR>", desc = "Find and Replace" }
    },
}


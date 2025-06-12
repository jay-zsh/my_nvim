return {
  {
    "mfussenegger/nvim-dap", -- 主调试框架
    event = "VeryLazy";
    dependencies = {
      "rcarriga/nvim-dap-ui",             -- UI 面板：变量、堆栈、断点等
      "theHamsta/nvim-dap-virtual-text",  -- 虚拟文本：变量值直接显示在代码旁边
      "jay-babu/mason-nvim-dap.nvim",     -- 与 Mason 集成，用于自动安装调试器
      "mfussenegger/nvim-dap-python",     -- Python 专用调试插件（封装 debugpy）
      "nvim-neotest/nvim-nio",            -- ✅ nvim-dap-ui 所需依赖，必须加
    },

    config = function()
      -- 加载调试相关模块
      local dap = require("dap")
      local dapui = require("dapui")

      -- 设置 mason-nvim-dap，自动安装 debugpy 和 cppdbg 调试器
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "cppdbg" }, -- 保证安装 Python 和 C++ 调试器
        automatic_installation = true,
      })

      -- 初始化 UI 和虚拟文本
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- 设置事件监听：启动调试时自动打开 UI，退出时关闭
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- 设置 Python 调试器路径（通过 mason 安装的 debugpy）
      require("dap-python").setup(
        vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      )

      -- 设置 C/C++ 调试器（通过 mason 安装的 OpenDebugAD7）
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }

      -- C/C++ 调试配置（launch 模式）
      dap.configurations.cpp = {
        {
          name = "Launch C++ file",    -- 配置名称
          type = "cppdbg",             -- 使用的 adapter
          request = "launch",          -- 启动调试
          program = function()
            -- 让用户输入可执行文件路径（自动补当前目录）
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",  -- 工作目录为当前项目
          stopAtEntry = true,          -- 启动时暂停在入口
          setupCommands = {
            {
              description = "Enable pretty-printing for gdb",
              text = "-enable-pretty-printing",
              ignoreFailures = false,
            },
          },
        },
      }
      dap.configurations.c = dap.configurations.cpp -- C 语言复用 C++ 配置

-- 常用调试快捷键
vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "开始/继续调试" })
vim.keymap.set('n', '<Esc>', function() dapui.close() end, { desc = "关闭调试 UI" })
      vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "跳过（step over）" })
      vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "进入函数（step into）" })
      vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "跳出函数（step out）" })
      vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "设置断点" })
      vim.keymap.set('n', '<Leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = "设置条件断点" })
    end,
  },
}

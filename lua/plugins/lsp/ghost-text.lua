return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = false,
    floating_window = true,
    floating_window_above_cur_line = true,
    hint_enable = false,
    handler_opts = {
      border = "rounded"
    },
    always_trigger = true,
    auto_close_after = nil,
    close_timeout = 4000,
  },
}

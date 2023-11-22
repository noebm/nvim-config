return {
  "hashivim/vim-terraform",
  ft = "terraform",
  config = function()
    vim.g.terraform_fmt_on_save = 1
  end
  -- *g:terraform_align*
  --     Allow vim-terraform to align settings automatically with Tabularize.
  --     Default: 0
  --
  -- *g:terraform_binary_path*
  --     Allow vim-terraform to use a custom path for the terraform binary.
  --     Default: terraform
  --
  -- *g:terraform_fmt_on_save*
  --     Allow vim-terraform to automatically format *.tf and *.tfvars files with
  --     terraform fmt. You can also do this manually with the `:TerraformFmt` command.
  --     Default: 0
  --
  -- *g:terraform_fold_sections*
  --     Allow vim-terraform to automatically fold (hide until unfolded) sections of
  --     terraform code.
  --     Default: 0

  -- config = function()
  --   require("vim-terraform")
  --   vim.g.terraform_align = 1
  --   vim.g.terraform_fmt_on_save = 1
  -- end
}

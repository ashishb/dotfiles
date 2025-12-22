# Dotfiles [![](https://img.shields.io/badge/Quality-A%2B-brightgreen.svg)](https://img.shields.io/badge/Quality-A%2B-brightgreen.svg)

[![Lint Markdown](https://github.com/ashishb/dotfiles/actions/workflows/lint-markdown.yaml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/lint-markdown.yaml)
[![Lint YAML](https://github.com/ashishb/dotfiles/actions/workflows/lint-yaml.yaml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/lint-yaml.yaml)
[![Lint GitHub Actions](https://github.com/ashishb/dotfiles/actions/workflows/lint-github-actions.yaml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/lint-github-actions.yaml)

[![Test Setup Mac OS](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_3.yml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_3.yml)
[![Test setup Mac machine](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_2.yml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_2.yml)
[![Test Setup dotfiles on Mac OS](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_1.yml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_1.yml)
[![Test Setup Vim on Mac OS](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_4.yml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/test_macos_4.yml)
[![Test Ubuntu](https://github.com/ashishb/dotfiles/actions/workflows/test_ubuntu.yml/badge.svg)](https://github.com/ashishb/dotfiles/actions/workflows/test_ubuntu.yml)

1. `setup_dotfiles.sh` - Automate the dotfiles setup with this one (Warning: the
 script does not always work)
1. `setup/setup_cryptocurrencies.sh` - Cryptocurrencies development related packages ([ethereum](https://www.ethereum.org/), [solidity](https://solidity.readthedocs.io/en/v0.5.11/), [truffle](https://www.trufflesuite.com/) etc.)
1. `_bashrc` - bashrc file (it primarily sources files in bashrc includes)
1. `_gitconfig` - git config file
1. `_macos` - macOS config file (one time setup file based on Mathias's file)
1. `_screenrc` - several productivity improvements to GNU screen
1. `scripts` - some random scripts
1. `_vimrc` - vim config file
1. `_vim` - vim config dir, it contains several vim related stuff
1. `setup` - contains one time setup scripts for Mac, GNU/Linux and Nexus 5.
1. `bashrc_includes` - contains several bash improvements (git friendly prompt, adb auto completion, p4 auto completion, git auto completion, android reverse engineering aliases etc.)

## Usage

### For setting up Mac OS

```bash
git clone https://github.com/ashishb/dotfiles && \
cd dotfiles && \
git submodule update --init && \
bash setup_dotfiles.sh && \
bash setup/setup_new_mac_machine.sh && \
bash setup/_macos && \
vim +BundleInstall +qall
```

### For setting up GNU/Linux

```bash
git clone https://github.com/ashishb/dotfiles && \
cd dotfiles && \
git submodule update --init && \
bash setup_dotfiles.sh && \
bash setup/setup_new_ubuntu_machine.sh && \
vim +BundleInstall +qall
```

Note: My GNU/Linux setup scripts are stale since I have not used GNU/Linux in a while.

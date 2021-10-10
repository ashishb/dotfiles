# Dotfiles [![](https://img.shields.io/badge/Quality-A%2B-brightgreen.svg)](https://img.shields.io/badge/Quality-A%2B-brightgreen.svg)

[![Test Setup dotfiles](https://github.com/ashishb/dotfiles/workflows/test_macos_1%20-%20Test%20Setup%20dotfiles/badge.svg)](https://github.com/ashishb/dotfiles/actions)
[![Test setup Mac machine](https://github.com/ashishb/dotfiles/workflows/test_macos_2%20-%20Test%20setup%20Mac%20machine/badge.svg)](https://github.com/ashishb/dotfiles/actions)
[![Test Setup Mac OS](https://github.com/ashishb/dotfiles/workflows/test_macos_3%20-%20Test%20Setup%20Mac%20OS/badge.svg)](https://github.com/ashishb/dotfiles/actions)
[![Test Setup Vim on Mac OS](https://github.com/ashishb/dotfiles/workflows/test_macos_4%20-%20Test%20Setup%20Vim%20on%20Mac%20OS/badge.svg)](https://github.com/ashishb/dotfiles/actions)

1. `setup_dotfiles.sh` - Automate the dotfiles setup with this one (Warning: the
 script does not always work)

2. `setup/setup_cryptocurrencies.sh` - Cryptocurrencies development related packages ([ethereum](https://www.ethereum.org/), [solidity](https://solidity.readthedocs.io/en/v0.5.11/), [truffle](https://www.trufflesuite.com/) etc.)

2. `_bashrc` - bashrc file (it primarily sources files in bashrc includes)

3. `_gitconfig` - git config file

4. `_macos` - macOS config file (one time setup file based on Mathias's file)

5. `_screenrc` - several productivity improvements to GNU screen

6. `scripts` - some random scripts

8. `_vimrc` - vim config file

9. `_vim` - vim config dir, it contains several vim related stuff

10. `setup` - contains one time setup scripts for Mac, GNU/Linux and Nexus 5.

11. `bashrc_includes` - contains several bash improvements (git friendly prompt, adb auto completion, p4 auto completion, git auto completion, android reverse engineering aliases etc.)

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

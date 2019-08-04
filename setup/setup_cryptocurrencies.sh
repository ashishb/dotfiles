#!/usr/bin/env bash
set -euo pipefail

# Google's Go Language
brew install golang
# Parity (Ethereum client) is written in this
brew install cmake rust
# Solidity compiler
brew tap ethereum/ethereum
brew install solidity
# Truffle for testing and deploying Solidity contracts
npm install -g truffle
# Web3 for Ethereum
npm install -g web3
# Solidity linter
npm install -g solhint
# Use Type script in lieu of Javascript for code maintainability
npm install -g typescript
npm install -g tslist  # Type script linter

# brew install kubernetes-cli
# brew install kubernetes-helm


# Good places to learn
# https://medium.com/coinmonks/an-analysis-of-a-couple-ethereum-honeypot-contracts-5c07c95b0a8d
# https://chainshot.com
# https://cryptozombies.io
# https://capturetheether.com/
# https://github.com/OpenZeppelin/ethernaut
# https://qed-it.com/2017/07/11/challenge-one-the-functionality-of-zk-snark - ZK Snarks

# Debugger
# https://medium.com/tenderly/how-to-debug-solidity-smart-contracts-with-tenderly-and-truffle-da995cfe098f

# Pakala symbolic executor
# https://www.palkeo.com/en/projets/ethereum/pakala.html

# Attack tool
# https://github.com/b-mueller/scrooge-mcetherface

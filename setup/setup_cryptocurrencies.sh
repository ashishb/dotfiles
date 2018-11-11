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

# brew install kubernetes-cli
# brew install kubernetes-helm


// SPDX-License-Identifier: GPL-3.0

// This is a comment indicating the license of the contract's code. 
// The Software Package Data Exchange (SPDX) is a standard for documenting information about software licenses in a standardized format. 
// GPL-3.0 refers to the GNU General Public License version 3, a widely-used free software license.

pragma solidity >=0.4.16 <0.9.0;
// The `pragma` keyword is used to enable certain compiler features or checks. 
// Here it specifies the compiler version to be used for compiling this smart contract. 
// This line says that the contract should be compiled with a Solidity compiler version greater than or equal to 0.4.16 but less than 0.9.0.

contract SimpleStorage {
    // This line declares a new contract named `SimpleStorage`. 
    // A contract in Solidity is similar to a class in object-oriented languages. 
    // Each contract can contain state variables, functions, function modifiers, events, struct types and enum types.

    uint storedData;
    // This line declares a state variable `storedData` of type `uint`. 
    // `uint` stands for "unsigned integer", a type of integer that cannot be negative. 
    // In Solidity, `uint` is an alias for `uint256`, a 256-bit unsigned integer. 
    // State variables are permanently stored in contract storage, 
    // which means they're written to the Ethereum blockchain.

    function set(uint x) public {
        // This is a `public` function named `set` that takes one argument, an unsigned integer `x`. 
        // Functions in Solidity can be `public`, `private`, `internal` or `external`. 
        // Public functions can be called both internally and externally, and they are part of the contract's ABI. 
        // This function updates the state variable `storedData` with the value of `x`.
        storedData = x;
    }

    function get() public view returns (uint) {
        // This is a `public` function named `get` that does not take any arguments and returns an unsigned integer. 
        // The `view` keyword indicates that this function will not modify the state of the contract, 
        // i.e., it will not change any state variables, emit any events, or create other contracts. 
        // This function returns the current value of `storedData`.
        return storedData;
    }
}

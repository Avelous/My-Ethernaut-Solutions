// Goal Create a contract that returns 42

Runtime Code
6042    // v: push1 0x42 (value is 0x42)
6080    // p: push1 0x80 (memory slot is 0x80)
52      // mstore

6020    // s: push1 0x20 (value is 32 bytes in size)
6080    // p: push1 0x80 (value was stored in slot 0x80)
f3      // return

Initialization Code
600a    // s: push1 0x0a (10 bytes)
60??    // f: push1 0x?? (current position of runtime opcodes)
6000    // t: push1 0x00 (destination memory index 0)
39      // CODECOPY

600a    // s: push1 0x0a (runtime opcode length)
6000    // p: push1 0x00 (access memory index 0)
f3      // return to EVM

?? => 0C because initializatin code takes up 12 bytes. Runtimes starts from 12

0x600a600c600039600a6000f3604260805260206080f3

> const account = "your address here";
> const bytecode = "0x600a600c600039600a6000f3604260805260206080f3";
//sendtransaction to 0 address => contract creation
> await web3.eth.sendTransaction({ from: account, data: bytecode };
await contract.setSolver("contract address");
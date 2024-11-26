# Hardware Description Languages for FPGA Design

As part of the **Hardware Description Languages for FPGA Design** course at the University of Colorado Boulder, the following design IPs were implemented in VHDL:

## Implemented Design IPs

### 1. 1-bit Adder
- **Description:**
  - A basic building block for arithmetic operations.
  - Performs the addition of two 1-bit binary numbers with carry.

### 2. 2-bit Comparator
- **Description:**
  - Compares two 2-bit numbers and outputs the result as:
    - Greater than (`>`)
    - Less than (`<`)
    - Equal to (`=`)

### 3. 74LS163 Binary Counter
- **Description:**
  - A digital counter module based on the 74LS163 IC.
  - Includes features such as synchronous counting and preset inputs.

### 4. Arithmetic Logic Unit (ALU)
- **Description:**
  - Performs arithmetic and logical operations on two input operands.
  - Supports operations such as addition, subtraction, AND, OR, etc.

### 5. FIFO (First-In-First-Out)
- **Description:**
  - A memory module designed for data storage and retrieval in the order of arrival.
  - Ensures orderly data processing.

### 6. Finite State Machine (FSM)
- **Description:**
  - A sequential logic circuit that transitions between states based on inputs.
  - Useful for implementing control logic.

### 7. Majority Vote Circuit
- **Description:**
  - Determines the majority value (0 or 1) of multiple input bits.
  - Useful in decision-making circuits.

### 8. Single-Port RAM
- **Description:**
  - A simple memory module with a single port for read and write operations.
  - Typically used for data buffering and temporary storage.

---

These design IPs serve as foundational components for more complex FPGA-based systems and were implemented to demonstrate a variety of digital design techniques and best practices in VHDL.

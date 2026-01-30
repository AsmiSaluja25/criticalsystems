# Criticalsystems

# SPARK Ada Coursework – Formally Verified Programs

This repository contains a set of **formally verified Ada/SPARK programs** developed as part of a Computer Science coursework.  
The focus of this project is **correctness, safety, and formal verification**, rather than complex user interfaces or performance optimisation.

The coursework is divided into three main components:

1. Date computation for a non-leap year  
2. Greatest Common Divisor using the Euclidean Algorithm  
3. A simplified safety-critical system  

All programs compile with **SPARK Ada**, pass **data and information flow analysis**, and (where required) **discharge all proof obligations** using SPARK’s automated provers.

---

## Technologies & Tools

- Ada / SPARK Ada  
- GNAT Studio  
- SPARK Examiner & Prover  
- `as_library` for safe console input/output  

Formal verification techniques used include:
- Pre-conditions and post-conditions  
- Loop invariants  
- `depends` clauses  
- Assertion pragmas to assist automated proof  

---

## Question 1 – Date Computation (Non-Leap Year)

### Overview
This component implements a date abstraction for a **non-leap year** and computes the **day of the year** from a given month and day.

The emphasis is on strong typing, safe array usage, and formal verification.

### Key Features
- Enumeration type `Months` (January to December)  
- Hard-coded array of cumulative days before each month  
- Function and procedure computing the day of the year  
- Conversion between month enumerations and strings  
- Validation of user input  
- Record type `Date` encapsulating month and day  
- Strict subtypes for:
  - Days in a month (1 .. 31)  
  - Days in a year (1 .. 365)  
  - Days before a month (0 .. 334)  

### Verification Highlights
- Pre- and post-conditions specifying correct behaviour  
- No range check warnings  
- Verified data and information flow  
- Passes **Examine All** and **Prove All** without warnings  

---

## Question 2 – Euclidean Algorithm (Greatest Common Divisor)

### Overview
This section implements the **Euclidean Algorithm using modulo**, not subtraction, and partially verifies its correctness.

The verification goal is to prove that the resulting GCD **divides both input values**.

### Key Features
- Procedure-based GCD computation  
- Iterative algorithm using `mod` and `div`  
- Console-based main loop with user interaction  
- Extended version tracking coefficients:
  - `a = g * ga`  
  - `b = g * gb`  

### Formal Verification
- Loop invariant:
a = r * ra + s * sa
b = r * rb + s * sb

- Preservation of invariants across loop iterations  
- Proven post-condition that the GCD divides both inputs  
- Assertion pragmas used to guide automated provers  

---

## Safety-Critical System Example

### Overview
This component demonstrates a **simplified safety-critical control system** using console input and output.

The goal is to show how **formal verification techniques** can be applied to safety-critical software using reasonable assumptions and simple behaviour.

### System Characteristics
- Accepts sensor-like inputs (e.g. temperature, pressure)  
- Checks safety constraints  
- Determines and outputs a safe system action  
- Runs continuously in a controlled loop  

### Verification Focus
- Clear safety assumptions  
- Defensive programming  
- Meaningful pre- and post-conditions  
- Verified decision logic  
- Fully verified data and information flow  

---

## Project Structure (Example)


(Exact structure may vary slightly depending on implementation.)

---

## How to Build and Run

1. Open the project in **GNAT Studio**
2. Select the appropriate `.gpr` file
3. Build using the SPARK Ada compiler
4. Run **Examine All** to check data and information flow
5. Run **Prove All** to discharge verification conditions
6. Execute `main.adb` for console interaction

---

## Learning Outcomes

This coursework demonstrates:

- Effective use of Ada’s strong type system  
- Application of SPARK contracts and loop invariants  
- Practical formal verification techniques  
- Design principles for safety-critical software  
- Structuring programs for provability and correctness  

---

## Notes

- Overflow checks are intentionally ignored where permitted  
- User input robustness is not the primary focus  
- Emphasis is placed on correctness and verification  


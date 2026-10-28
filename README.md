# ProgramsAsDataAssignments

## Overview

Ex 1.1 and 1.2 are in the Intro2.fs file in the Intro folder.
Ex 1.4 is located in the Expr.cs in Exercise1_4_CSharp folder and was written in C#.
Ex 2.1, 2.2, and 2.3 are in the Intcomp1.fs file in hte Intcomp folder.

## Note

To make the code easily distinguishable, every line or section that was written or modified by us was
annotated with "Written by us" comments (or similar, e.g. TODO notes).


## Exercise 1.1 - in Intro2.fs

i) We extended the expr type with a new If(expr, expr, expr) constructor, and extended eval 
to handle three additional operators: "max", "min", and "==" that return 1 for true, and 0 for false).
ii) Added example expressions e4 to e7 using the new operators that are evaluated using eval/eval'.
iii) Added eval' that evaluates both arguments of a Prim (i1, i2) before branching on teh operator
string.
iv) Extended eval to handle the new If(e1, e2, e3) case which evaluates e1, and e2 if the result is
greater than 0, otherwise evaluates e3.


## Exercise 1.2 - in Intro2.fs

i) Declared aexpr without let-bindings, with constructors CstrI, Var, Add, Sub, and Mul.
ii) Added example expressions e8 to e10 that represent v - (w + z), 2 * (v- (w + z)), and 
x + y + z + v.
iii) Implemented fmt: aexpr -> string to format aexpr values as strings. The binary operations 
are wrapped in parentheses.
iv) Implemented simplify: aexpr -> aexpr, that simplifies both sides of the binary operation 
before it checks whether either of teh sides can be eliminated or folded (like adding zero, 
multiplying by one, etc.).
v) Implemented differentiate: aexpr -> string _> aexpr, which does differentiation by computing
the symbolic dervative of an arithmetic exoression.

## Exercise 1.4 - in Expr.cs and Program.cs

There was an option in the exercise between choosing Java and C#. For this exercise, 
we are using C#.
i) We built the classes that followed the aexpr type: an abstract Expr base class, CstI and Var
as leaf classes, and an abstract Binop class with three subclasses: Add, Sub, and Mul.
ii) Added three more example expressions to the Program.cs file.
iii) Added Eval(List<(string, int)> env) in the needed classes/subclasses (mirroring the
(string* int) list environment in F#). The Binop implementation is built on the abstract
Combine(int, int) method.
iv) Added Simplify() to Add, Sub, and Mul, implementing the same identity/zero rules and 
constant folding as the simplify in the 1.2 iv. CstI and Var simplify to themselves.


## Exercise 2.1 - in Intcomp1.fs

We extended the expr type so taht Let takes a list of string * expr instead of 
just one, which allows multiple let-bindings that are sequential
in one let expression. Also, revised Let in eval with a evalEnv helper that folds over a list of
bindings and evaluates each right-hand side within the environment built up by all of the 
previous bindings in the same let, and then evaluates the body in the final environment.


## Exercise 2.2

Revised Let in the freevars with aux helper that accumulates the name bound while walking the 
bindings. For each right-hand side of the bidnings, only the variables that are bound by the
earlier bindings in the same let are excluded, not the variable that is currently being 
bound, and also not the later bindings.


## Exercise 2.3

Revised Ler in the tcomp with comp helper that folds over the bindings, produces TLet 
expressions, and extends the compile time environment cenv with each of the bound
variable name as it goes. We did not make any chnages to texpr or teval.


------------------------------------------------------------------------------------------------


## Exercise 2.4 - in Intcomp1.fs

We built the following: sinstrToInt that translates a list of byte-code instructions
into a list of integers. sinstrToInt is called inside assemble for each instruction and
assemble takes all instructions and creates a int list containing all instructions.


##Exercise 2.5 - in Intcomp1.fs
We did not do any changes at this exercise since the code was already given to us. The
only required action was to compile Machine.java and run:     
% javac Machine.java

% java Machine is1.txt.

## Exercise 3.2

We wrote the following regular expression solution: (b|ab)*a?

and created the following NFA and DFA:

![NFA diagram](Images/NFA.png)

![DFA diagram](Images/DFA.png)

## Exercise 3.3

We wrote the rightmost derivation of: let z = (17) in z + 2 * 3 end EOF

Main ⇒ Expr EOF                                                                      A
     ⇒ LET NAME EQ Expr IN Expr END EOF                                              F
     ⇒ LET NAME EQ Expr IN Expr PLUS Expr END EOF                                    H
     ⇒ LET NAME EQ Expr IN Expr PLUS Expr TIMES Expr END EOF                         G
     ⇒ LET NAME EQ Expr IN Expr PLUS Expr TIMES CSTINT END EOF                       C
     ⇒ LET NAME EQ Expr IN Expr PLUS CSTINT TIMES CSTINT END EOF                     C
     ⇒ LET NAME EQ Expr IN NAME PLUS CSTINT TIMES CSTINT END EOF                     B
     ⇒ LET NAME EQ LPAR Expr RPAR IN NAME PLUS CSTINT TIMES CSTINT END EOF           E
     ⇒ LET NAME EQ LPAR CSTINT RPAR IN NAME PLUS CSTINT TIMES CSTINT END EOF         C



## Exercise 3.4

We drew the derivation from Exercise 3.3 as a tree.

![DFA diagram](Images/DerivationTree.png)


------------------------------------------------------------------------------------------------


## Running the Expr Parser (Exercise 3.5)

### Prerequisites
- .NET 9 SDK installed

### 1. Build (generates the lexer and parser from ExprLex.fsl / ExprPar.fsy)
```bash
cd Expr
dotnet build parse.fsproj
```

### 2. Start an interactive F# session
```bash
dotnet fsi
```

### 3. Reference the FsLexYacc runtime (provides the Lexing/Parsing namespaces)
```fsharp
#r "nuget: FsLexYacc.Runtime, 11.3.0";;
```

### 4. Load the project files, in dependency order
```fsharp
#load "Absyn.fs";;
#load "Expr.fs";;
#load "ExprPar.fs;;
#load "ExprLex.fs";;
#load "Parse.fs";;
```

### 5. Open the parser module and test
```fsharp
open Parse;;
fromString "1+2*3";;
fromString "let z = 17 in z + 2*3 end";;
```

## Exercise 3.6

You can find the implementation for this inside Expr/Parse.fs see function compString.

## Exercise 3.7

For this we changed the following files 
1. Expr/ExprLex.fsl
2. Expr/ExprPar.fsy
3. Expr/Absyn.fs
4. Expr/Expr.fs


## Exercise 4.1
We followed the instructions to make sure that all of the code works one thing to note is that we use dotnet 9 
and not dotnet 10 so if you need to follow the same instructions make sure to replace 10.0 with 9.0 

## Exercise 4.2
Find our implementation of these expressions inside of the Fun/Fun.fs file we have annotated the code 
with a comment so that you can see what we wrote.

## Exercise 4.3
Changes are in Fun/Absyn.fs (Letfun now takes a string list of parameters, Call now takes 
an expr list of arguments) and Fun/Fun.fs (Closure carries a string list, and the Call case 
zips parameters with evaluated arguments using List.zip). We also had to apply the same 
changes to Fun/HigherFun.fs and Fun/TypeInference.fs since they share the same Absyn.expr 
type and would otherwise not type-check.

## Exercise 4.4
Changes are in Fun/FunPar.fsy: added a Names1 nonterminal for parsing one or more parameter 
names, used in the Letfun production, and rewrote AppExpr so that a chain of applications 
(f a b c) builds a single Call with a list of arguments instead of nested Calls.


------------------------------------------------------------------------------------------------


## Exercise 4.5
For this exercise we made changes to the following files:
Fun_multiple_arguments/FunPar.fsy and Fun_multiple_arguments/FunLex.fsi

## Exercise 5.7
Find the changes made for this exercise in the following file: TypedFun/TypedFun.fs
We have annotated code that we wrote, extended and/or updated.

## Exercise 6.1
Cd into /Fun and run the commands in the README.md.

Result of the third one explanation:
We excepted an error when parsing.
What happens is that there is no whitespace in "inletsx=77inaddtwo" seperating tokens, so it
just takes everything as variable names: in, let, x, in, addtwo.
This means we wont have a token stream that match any grammar production with error:
Correct micro-ML requires whitespace between keywords/identifiers, e.g. "in let x = 77 in addtwo 5".

Result of the last explantation:
add expects 2 arguments.
but if add is not given 2 arguments, it will then return another function, that expects
the last argument (y) and this behavior produces/returns a new closure. 
Thus allowing for currying in our MicroML.

## Exercise 6.2 & Exercise 6.3
Find the changes made for this exercise in the following files: Fun/Absyn.fs, Fun/FunLex.fsl, 
Fun/FunPar.fsy, Fun/HigherFun.fs

------------------------------------------------------------------------------------------------

## Exercise 7.4
Find the implementation for this inside the Absyn.fs file and the Interp.fs file specifically 
The eval function.

## Exercise 7.5
Find the changes made to the lexer and parser inside the CLex.fsl and CPar.fsy files

## Exercise 8.1 (i) - in MicroC
We built the compiler as it was described in the MicroC READEM. It was compiled with CEx/ex11.c
with compileToFile and ran it with "java Machine CEx/ex11.out 8". It printed all fo the 92
solutions to the 8 queens problem.

## Exercise 8.3 - in MicroC/Comp.fs
We added PreInc and PreDec cases to the cExpr. They both compile to the address code
from the cAccess and then followed by DUP, LDI, CSTI 1, ADD for PreInc and SUB for PreDec, 
and STI, the address is then compiled once instead of twice like it would with e = e + 1.
It was tehn tested with preinc.c and n = 5, and it printed "6 4".

## Exercise 8.4 - in MicroC
Regarding ex08.c compared to prog1
The loop in ex08.c executes 17 instructions per iteration, while prog1 only executes 4.
Prog1 also keeps the counter on the stack compared to ex08.c which stores "i" in memory and recomputes its address 3 times per iteration.

Regarding ex13.c
The while loop has its test at the bottom, so it only needs one conditional jump per iteration. The if-statement with && and || is compiled into code
that pushes either 0 or 1 which the if then tests again. This causes exstra labels and jumps created, for example at L7 the code pushes 0 just so the
if-statement can immediatly test it and then just jumps to L4, when it could have went to L4 in the first place.


------------------------------------------------------------------------------------------------

## Exercise 8.5
Conditional expressions are added in Absyn.fs (Cond), CLex.lex (QMARK and COLON tokens), CPar.fsy (the Expr QMARK Expr COLON Expr rule), 
the cExpr function in Comp.fs and Contcomp.fs, and the eval function in Interp.fs.

## Exercise 8.6
Switch statements are added in Absyn.fs (Switch), CLex.lex (SWITCH and CASE keywords), CPar.fsy (the SWITCH rule in StmtM and the Cases rule), 
the cStmt function in Comp.fs and Contcomp.fs, and the exec function in Interp.fs.
It was tested with CEx/condAndSwitch.c and month = 2, and it printed "29 0".

## Exercise 9.1
See the files Selsort.il and Selsort.jvmbytecode for the explanations.

## Exercise 9.3
When running the program for the first time with "java -Xmx100m QueueWithMistake", we were getting this error, which meant that it was 
running out of memory:
Exception: java.lang.OutOfMemoryError thrown from the UncaughtExceptionHandler in thread "Thread-0"
Exception in thread "main" java.lang.OutOfMemoryError: Java heap space
at QueueWithMistake.runThreads(QueueWithMistake.java:58)
at QueueWithMistake.main(QueueWithMistake.java:28)

The problem was that dummy was a field in SentinelLockQueue, its node pointed to the first node that was added to the queue, which pointed 
to the enxt one, etc., so every node which was created was never freed from the garbage collector.
We changed dummy to be a local variable in a new constructor instead of a field, so only the head and tail would point into the queue.
We ran the same command afterwards and got:
SentinelLockQueue          1       1.22 199999994
SentinelLockQueue          2      18.73 199999994
SentinelLockQueue          3      38.78 199999994

The program after ran without running out of memory. (We stopped it after 3 lines becuase otherwise it would run very long.)


------------------------------------------------------------------------------------------------

## Exercise 10.1

(i) 
- ADD: The two operands are stored as tagged integers so the VM knows if they are small therefor it starts by untagging with Untag(v) = v>>1, then it adds them together and retags them with Tag(x) = (x<<1)|1. The result is stored at s[sp-1] and sp is tdecremented. Net effect: pop two values and push their sum.

- CSTI i: The operand i is read from the program array (p[pc++]), where it is stored untagged. The machine tags it and pushes it: s[sp+1] = Tag(p[pc++]); sp++. The pushed value is a tagged integer, so the GC will never follow it.

- NIL: The machine pushes NILVALUE. Even though both represent a form of "zero," the VM distinguishes them using their low bits: NIL pushes raw word 0 (low bit 0, signaling a null memory reference), whereas CSTI 0 pushes 1 (low bit 1, signaling a tagged integer). Because they have different raw bit patterns, an equality check sees them as distinct, and the Garbage Collector treats them differently—automatically skipping tagged integers while explicitly checking for null references. This is why local variables are initialized with NIL rather than integer zero.

- IFZERO: The machine pops v. If IsInt(v), it tests Untag(v) == 0. Otherwise v is a reference, and it tests v == 0, that is, whether it is nil. If the test succeeds, pc is set to the jump target p[pc]. Otherwise it skips the operand with pc+1. So 0, false and nil all count as “zero”.

- CONS. The machine calls allocate(CONSTAG, 2, s, sp), which returns a block with a header and two payload words. This call may trigger a garbage collection. It then stores s[sp-1] (the car) in p[1] and s[sp] (the cdr) in p[2], writes the pointer to the new block into s[sp-1], and decrements sp. The two operands stay on the stack until the block is filled in, so they are still roots if allocate runs a GC.

- CAR. The machine reads the reference on top of the stack. If it is 0 (nil), it prints “Cannot take car of null” and stops. Otherwise it replaces the stack top with the first payload word, p[1]. CDR does the same with p[2].

- SETCAR. The machine pops the new value v (s[sp--]). The cons reference is now on top. It overwrites the car field, p[1] = v. There is no null check. The cons reference stays on the stack as the result, not the stored value.

(ii) 

(iii)

(iv)
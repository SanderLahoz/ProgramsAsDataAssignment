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


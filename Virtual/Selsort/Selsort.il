  .method public hidebysig static default void SelectionSort(int32[] arr) cil managed
  {
    // Method begins at Relative Virtual Address (RVA) 0x20B4
    // Code size 57 (0x39)
    .maxstack 4
    .locals init(int32 V_0, int32 V_1, int32 V_2, int32 V_3)

    // Local variable mapping (the CIL has no names, only numbered locals):
    //   arg 0 (ldarg.0) = arr    (the int[] parameter)
    //   local 0 (V_0)   = i      (outer loop counter)
    //   local 1 (V_1)   = least  (index of smallest element found so far)
    //   local 2 (V_2)   = j      (inner loop counter)
    //   local 3 (V_3)   = tmp    (temporary used for the swap)

    // ---- int i = 0; ----
    IL_0000: ldc.i4.0                // push constant 0
    IL_0001: stloc.0                 // i = 0 (pop into local 0)
    IL_0002: br.s     IL_0032        // jump to the outer loop test (loop condition is at the bottom)

    // ---- outer loop body: int least = i; ----
    IL_0004: ldloc.0                 // push i
    IL_0005: stloc.1                 // least = i

    // ---- int j = i+1; ----
    IL_0006: ldloc.0                 // push i
    IL_0007: ldc.i4.1                // push 1
    IL_0008: add                     // i + 1
    IL_0009: stloc.2                 // j = i + 1
    IL_000a: br.s     IL_001a        // jump to the inner loop test

    // ---- inner loop body: if (arr[j] < arr[least]) least = j; ----
    IL_000c: ldarg.0                 // push arr
    IL_000d: ldloc.2                 // push j
    IL_000e: ldelem.i4               // pop index and array, push arr[j]
    IL_000f: ldarg.0                 // push arr
    IL_0010: ldloc.1                 // push least
    IL_0011: ldelem.i4               // push arr[least]
    IL_0012: bge.s    IL_0016        // if arr[j] >= arr[least] skip the assignment (negated test of <)
    IL_0014: ldloc.2                 // push j
    IL_0015: stloc.1                 // least = j

    // ---- j++ (the update part of the inner for loop) ----
    IL_0016: ldloc.2                 // push j
    IL_0017: ldc.i4.1                // push 1
    IL_0018: add                     // j + 1
    IL_0019: stloc.2                 // j = j + 1

    // ---- inner loop test: j < arr.Length ----
    IL_001a: ldloc.2                 // push j
    IL_001b: ldarg.0                 // push arr
    IL_001c: ldlen                   // push arr.Length (as native unsigned int)
    IL_001d: conv.i4                 // convert the length to int32
    IL_001e: blt.s    IL_000c        // if j < arr.Length, go round the inner loop again

    // ---- int tmp = arr[i]; ----
    IL_0020: ldarg.0                 // push arr
    IL_0021: ldloc.0                 // push i
    IL_0022: ldelem.i4               // push arr[i]
    IL_0023: stloc.3                 // tmp = arr[i]

    // ---- arr[i] = arr[least]; ----
    IL_0024: ldarg.0                 // push arr         (array operand of the store)
    IL_0025: ldloc.0                 // push i           (index operand of the store)
    IL_0026: ldarg.0                 // push arr
    IL_0027: ldloc.1                 // push least
    IL_0028: ldelem.i4               // push arr[least]  (value operand of the store)
    IL_0029: stelem.i4               // arr[i] = arr[least]

    // ---- arr[least] = tmp; ----
    IL_002a: ldarg.0                 // push arr
    IL_002b: ldloc.1                 // push least
    IL_002c: ldloc.3                 // push tmp
    IL_002d: stelem.i4               // arr[least] = tmp

    // ---- i++ (the update part of the outer for loop) ----
    IL_002e: ldloc.0                 // push i
    IL_002f: ldc.i4.1                // push 1
    IL_0030: add                     // i + 1
    IL_0031: stloc.0                 // i = i + 1

    // ---- outer loop test: i < arr.Length ----
    IL_0032: ldloc.0                 // push i
    IL_0033: ldarg.0                 // push arr
    IL_0034: ldlen                   // push arr.Length
    IL_0035: conv.i4                 // convert to int32
    IL_0036: blt.s    IL_0004        // if i < arr.Length, go round the outer loop again
    IL_0038: ret                     // return (void), the evaluation stack is empty
  } // End of method System.Void Selsort::SelectionSort(System.Int32[])

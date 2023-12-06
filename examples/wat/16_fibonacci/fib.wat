(module
 (func $sum (export "sum") (param $a i32) (param $b i32)
 (result i32)
 local.get $a
 local.get $b
 i32.add
 )

  (func $fib (export "fib") (param $n i32)
  (result i32)
  local.get $n
  i32.const 3
  i32.ge_s
  (if
    (then
        local.get $n
        i32.const 1
        i32.sub
        call $fib
        local.get $n
        i32.const 2
        i32.sub
        call $fib
        i32.add
        return
    )
    (else
       i32.const 1
       i32.const 0
       i32.add
       return
    )
  )
   i32.const 0
   return
  )
)
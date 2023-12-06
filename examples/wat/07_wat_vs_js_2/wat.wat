(module(func $findMax (param $array i32) (param $length i32) (result i32)
  (local $n i32)
  (local $i i32)
  (local $max i32)
  (local $0 i32)
  (local.set $n (local.get $length))
  (local.set $i (i32.const 0))
  (local.set $max (i32.load (local.get $array) (i32.const 0) (i32.const 2)))
  (loop $loop(block $end
    (if (i32.ge_u (local.get $i) (i32.sub (local.get $n) (i32.const 1)))
      (then (br $end))
    )
    (local.set $i (i32.add (local.get $i) (i32.const 1)))
    (if (i32.gt_u (i32.load (local.get $array) (local.get $i) (i32.const 2)) (local.get $max))
      (local.set $max (i32.load (local.get $array) (local.get $i) (i32.const 2)))
    )
    (br $loop)
  ))
  (local.get $max)
)
)
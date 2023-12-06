(module
 (global $cnvs_size (import "env" "cnvs_size") i32)
 (global $bg_color (import "env" "bg_color") i32)
 (global $object_radius (import "env" "object_radius") i32)
 (global $objects_base (import "env" "objects_base") i32)
 (global $object_count (import "env" "object_count") i32)
 (global $x_offset (import "env" "x_offset") i32) 
 (global $y_offset (import "env" "y_offset") i32) 
 (global $vx_offset (import "env" "vx_offset") i32)
 (global $vy_offset (import "env" "vy_offset") i32)
 (global $color_offset (import "env" "color_offset") i32)
 (global $start_bg_mem (import "env" "start_bg_mem") i32)

 (import "env" "buffer" (memory 33))
 (import "env" "log" (func $log (param i32 i32)))




 (func $clear_canvas

    i32.const 0
    global.get $start_bg_mem
    global.get $objects_base
    memory.copy
 )

 

 

(func $set_pixel
 (param $x i32) 
 (param $y i32) 
 (param $c i32) 
 (i32.ge_u (local.get $x) (global.get $cnvs_size))
 if 
 return
 end
 (i32.ge_u (local.get $y) (global.get $cnvs_size))
 if 
 return
 end
 local.get $y
 global.get $cnvs_size
 i32.mul
 local.get $x
 i32.add 
 i32.const 4
 i32.mul 
 local.get $c 
 i32.store
)

(func $draw_object
(param $x i32)
(param $y i32)
(param $r i32)
(param $c i32)
 
  (call $set_pixel (local.get $x) (local.get $y) (local.get $c))
  local.get $x
  i32.const 1
  i32.add
  local.get $y
  local.get $c
  call $set_pixel
  local.get $x
  i32.const 2
  i32.add
  local.get $y
  local.get $c
  call $set_pixel

  local.get $x
  local.get $y
  i32.const 1
  i32.add
  local.get $c
  call $set_pixel
  local.get $x
  i32.const 1
  i32.add
  local.get $y
  i32.const 1
  i32.add
  local.get $c
  call $set_pixel
    local.get $x
  i32.const 2
  i32.add
  local.get $y
  i32.const 1
  i32.add
  local.get $c
  call $set_pixel

      local.get $x
  i32.const 2
  i32.add
  local.get $y
  i32.const 2
  i32.add
  local.get $c
  call $set_pixel
      local.get $x
  local.get $y
  i32.const 2
  i32.add
  local.get $c
  call $set_pixel
      local.get $x
  i32.const 1
  i32.add
  local.get $y
  i32.const 2
  i32.add
  local.get $c
  call $set_pixel

)

(func $get_obj_attr
 (param $obj_number i32)
 (param $attr_offset i32)
 (result i32)
 local.get $obj_number
 i32.const 20
 i32.mul
 global.get $objects_base
 i32.add 
 local.get $attr_offset
 i32.add 
 i32.load
)

(func $set_obj_attr
 (param $obj_number i32)
 (param $attr_offset i32)
 (param $value i32)
 local.get $obj_number
 i32.const 20
 i32.mul 
 global.get $objects_base 
 i32.add 
 local.get $attr_offset 
 i32.add 
 local.get $value
 i32.store
)

(func $move_objects
  (local $i i32)
  (local $xi i32)
  (local $yi i32)
  (local $vxi i32)
  (local $vyi i32)
  (loop $move_objects
   (call $get_obj_attr (local.get $i) (global.get $x_offset))
   local.set $xi
   (call $get_obj_attr (local.get $i) (global.get $y_offset))
   local.set $yi
   (call $get_obj_attr (local.get $i) (global.get $vx_offset))
   local.set $vxi
   (call $get_obj_attr (local.get $i) (global.get $vy_offset))
   local.set $vyi
   (i32.add (local.get $vxi) (local.get $xi))
   i32.const 0x1ff ;; 511 in decimal
   i32.and ;; clear high-order 23 bits
   local.set $xi
 ;; add velocity to y and force it to stay in the canvas bounds
 (i32.add (local.get $vyi) (local.get $yi))

 i32.const 0x1ff ;; 511 in decimal
 i32.and ;; clear high-order 23 bits
 local.set $yi
 ;; set the x attribute in linear memory
 (call $set_obj_attr
 (local.get $i)
 (global.get $x_offset)
 (local.get $xi)
 )
 ;; set the y attribute in linear memory
 (call $set_obj_attr
 (local.get $i)
 (global.get $y_offset)
 (local.get $yi)
 )
 local.get $i
 i32.const 1
 i32.add
 local.tee $i 
 global.get $object_count
 i32.lt_u 
 if
 br $move_objects
 end
)
)

(func $draw_objects
  (local $i i32)
  (local $xi i32)
  (local $yi i32)
  (local $ci i32)
  (loop $draw 
   (call $get_obj_attr (local.get $i) (global.get $x_offset))
   local.set $xi
   (call $get_obj_attr (local.get $i) (global.get $y_offset))
   local.set $yi
   (call $get_obj_attr (local.get $i) (global.get $color_offset))
   local.set $ci
   (call $draw_object (local.get $xi) (local.get $yi) (global.get $object_radius) (local.get $ci))
   local.get $i
   i32.const 1
   i32.add
   local.tee $i 
   global.get $object_count
   i32.lt_u 
   if
     br $draw
   end
 )
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

(func $find_collisions
 (local $i i32) 
 (local $j i32)
 (local $x1 i32) 
 (local $x2 i32) 
 (local $y1 i32)
 (local $y2 i32)
 (local $dx i32)
 (local $dy i32)
 (local $d i32)
 (local $nx i32)
 (local $ny i32)
 (local $s i32)
 (local $new_value i32)
 (local $new_v i32)
 (local $k i32)
 (local $vx1 i32)
 (local $vy1 i32)
 (local $vx2 i32)
 (local $vy2 i32)
 (local $almost_d i32)

  (loop $outer_loop
;;   (call $fib (i32.const 15))
;;   local.set $almost_d
   i32.const 0
   local.set $j
   (call $get_obj_attr (local.get $i) (global.get $x_offset))
   local.set $x1
   (call $get_obj_attr (local.get $i) (global.get $y_offset))
   local.set $y1
   
   



   
   (loop $inner_loop (block $inner_break
   local.get $i
   local.get $j
   i32.eq
   if
   local.get $j
   i32.const 1
   i32.add
   local.set $j
   end
   local.get $j
   global.get $object_count
   i32.ge_u
   if 
   br $inner_break
   end
   (call $get_obj_attr (local.get $j)(global.get $x_offset))
   local.set $x2
   (call $get_obj_attr (local.get $j)(global.get $y_offset))
   local.set $y2
  
   global.get $object_radius
   global.get $object_radius
   i32.add
  ;;  f32.convert_i32_s
   local.get $x2
   local.get $x1
   i32.sub
   local.tee $dx
   local.get $dx
   i32.mul
   local.get $y2
   local.get $y1
   i32.sub
   local.tee $dy
   local.get $dy
   i32.mul
   i32.add
   f32.convert_i32_s
   f32.sqrt
   f32.nearest
   i32.trunc_f32_s
   local.tee $d
   i32.const 0
   i32.eq
   if 
     i32.const 1
     local.set $d
   end
   local.get $d
   i32.gt_s
   ;; solve collision
   if 


  
  ;;  funguje zjednodusene
      (call $get_obj_attr (local.get $i) (global.get $vx_offset))
      i32.const -1
      i32.mul
      local.set $vx1
      (call $set_obj_attr (local.get $i) (global.get $vx_offset) (local.get $vx1))
      (call $get_obj_attr (local.get $i) (global.get $vy_offset))
      i32.const -1
      i32.mul
      local.set $vy1
      (call $set_obj_attr (local.get $i) (global.get $vy_offset) (local.get $vy1))
      (call $get_obj_attr (local.get $j) (global.get $vx_offset))
      i32.const -1
      i32.mul
      local.set $vx2
      (call $set_obj_attr (local.get $j) (global.get $vx_offset) (local.get $vx2))
      (call $get_obj_attr (local.get $j) (global.get $vy_offset))
      i32.const -1
      i32.mul
      local.set $vy2
      (call $set_obj_attr (local.get $j) (global.get $vy_offset) (local.get $vy2))
      (i32.add (local.get $vx1) (local.get $x1))
      i32.const 0x1ff 
      i32.and 
      local.set $x1
      (i32.add (local.get $vy1) (local.get $y1))
      i32.const 0x1ff
      i32.and 
      local.set $y1
     (call $set_obj_attr (local.get $i) (global.get $x_offset) (local.get $x1))
     (call $set_obj_attr (local.get $i) (global.get $y_offset) (local.get $y1))
    (i32.add (local.get $vx2) (local.get $x2))
      i32.const 0x1ff 
      i32.and 
      local.set $x2
      (i32.add (local.get $vy2) (local.get $y2))
      i32.const 0x1ff 
      i32.and 
      local.set $y2
     (call $set_obj_attr (local.get $j) (global.get $x_offset) (local.get $x2))
     (call $set_obj_attr (local.get $j) (global.get $y_offset) (local.get $y2))

   end
   local.get $j
   i32.const 1
   i32.add
   local.set $j
   br $inner_loop
))
   local.get $i
   i32.const 1
   i32.add
   local.tee $i ;; increment $i
   global.get $object_count
   i32.lt_u
   if ;; if $i < $obj_cnt jump to top of the outer loop
   br $outer_loop
   end
  )

)

 (func $main (export "main")
  (call $clear_canvas)
  (call $move_objects)
 (call $find_collisions)
  (call $draw_objects)
)
)

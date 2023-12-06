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
 (global $x_base (import "env" "x_base") i32)
  (global $y_base (import "env" "y_base") i32)
  (global $vx_base (import "env" "vx_base") i32)
  (global $vy_base (import "env" "vy_base") i32)
(global $obj_color (import "env" "obj_color") i32)
(global $bg_address_copy (import "env" "bg_address_copy") i32)
(global $ball_color_address_copy (import "env" "ball_color_address_copy") i32)

 (import "env" "buffer" (memory 33))
  (import "env" "log" (func $log (param i32 i32 i32 i32)))

 (func $clear_canvas
  global.get $start_bg_mem
   global.get $bg_address_copy
   global.get $objects_base
   memory.copy
;;    global.get $start_bg_mem
;;    global.get $bg_color
;;    global.get $objects_base
;;    memory.fill
 )

(func $move_objects_2
    (local $i i32)
    (local $vecX v128)
    (local $vecY v128)
    (local $vecVX v128)
    (local $vecVY v128)
    (local $xi_offset i32)
    (local $vxi_offset i32)
    (local $yi_offset i32)
    (local $vyi_offset i32)
    (loop $move_loop
;;    x = x + vx; 4 naraz
        global.get $x_base
        local.get $i
        i32.add
        local.tee $xi_offset
        local.get $xi_offset
        v128.load
        global.get $vx_base
        local.get $i
        i32.add
        local.tee $vxi_offset
        v128.load
        i32x4.add
        i32.const 511
        i32x4.splat
        v128.and
        v128.store

        global.get $y_base
        local.get $i
        i32.add
        local.tee $yi_offset
        local.get $yi_offset
        v128.load
        global.get $vy_base
        local.get $i
        i32.add
        local.tee $vyi_offset
        v128.load
        i32x4.add
        i32.const 511
        i32x4.splat
        v128.and
        v128.store


        local.get $i
;;        4 numbers in vector * 4 bytes
        i32.const 16
        i32.add
        local.tee $i
        i32.const 16
        i32.add
        global.get $object_count
        i32.const 4
        i32.mul
        i32.le_u
        if
        br $move_loop
        end
    )
)




(func $draw_object_2
    (param $address i32)
    (local $tl i32)
    (local $ml i32)
    (local $bl i32)
    (local $br i32)
    local.get $address
    global.get $cnvs_size
    i32.add
    i32.const 1
    i32.add
    local.tee $br
    global.get $objects_base
    i32.ge_u
    if
        return
    end

    local.get $address
    global.get $cnvs_size
    i32.sub
    i32.const 1
    i32.sub
    local.tee $tl
    i32.const 0
    i32.le_u
    if
        return
    end


    local.get $address
    global.get $obj_color
    i32.const 12
    memory.fill

    local.get $address
    global.get $cnvs_size
    i32.add
    global.get $obj_color
    i32.const 12
    memory.fill

    local.get $address
    global.get $cnvs_size
    i32.add
    global.get $cnvs_size
    i32.add
    global.get $obj_color
    i32.const 12
    memory.fill


;;    local.get $tl
;;    global.get $cnvs_size
;;    i32.add
;;    local.tee $ml
;;    global.get $obj_color
;;    i32.const 3
;;    memory.fill
;;
;;    local.get $ml
;;    global.get $cnvs_size
;;    i32.add
;;    global.get $obj_color
;;    i32.const 3
;;    memory.fill


)


(func $draw_object_3
    (param $address i32)
    (local $color i32)
    global.get $ball_color_address_copy
    i32.load
    local.set $color



    local.get $address
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 4
    i32.sub
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 4
    i32.add
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2048
    i32.add
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2044
    i32.add
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2052
    i32.add
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2048
    i32.sub
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2044
    i32.sub
    i32.const 1048575
    i32.and
    local.get $color
    i32.store

    local.get $address
    i32.const 2052
    i32.sub
    i32.const 1048575
    i32.and
    local.get $color
    i32.store
)



(func $draw_objects_2
    (local $i i32)
    (local $vecX v128)
    (local $vecY v128)
    (local $vecAddress v128)
    (local $address i32)
    (loop $draw_loop

        ;; (x + y*cnv_size)*4
        i32.const 4
        i32x4.splat
        global.get $x_base
        local.get $i
        i32.add
        v128.load
        global.get $y_base
        local.get $i
        i32.add
        v128.load
        global.get $cnvs_size
        i32x4.splat
        i32x4.mul
        i32x4.add
        i32x4.mul



        local.set $vecAddress

        local.get $vecAddress
        i32x4.extract_lane 0
        call $draw_object_3

        local.get $vecAddress
        i32x4.extract_lane 1
        call $draw_object_3

        local.get $vecAddress
        i32x4.extract_lane 2
        call $draw_object_3

        local.get $vecAddress
        i32x4.extract_lane 3
        call $draw_object_3


        local.get $i
        i32.const 16
        i32.add
        local.tee $i
        i32.const 16
        i32.add
        global.get $object_count
        i32.const 4
        i32.mul
        i32.le_u
        if
        br $draw_loop
        end
    )
)

(func $collision
    (param $d i32)
    (param $obj_counter i32)
    (param $i i32)
    (local $vx1 i32)
    (local $vx2 i32)
    (local $vy1 i32)
    (local $vy2 i32)
    (local $vx_offset i32)
    (local $vy_offset i32)


    local.get $i
    local.get $obj_counter
    i32.eq
    (if
        (then)
        (else
;;            local.get $d
;;            local.get $obj_counter
;;            local.get $i
;;            local.get $i
;;
;;            call $log

            global.get $vx_base
            local.get $i
            i32.add
            local.tee $vx_offset
            local.get $vx_offset
            i32.load
            i32.const -1
            i32.mul
            local.tee $vx1
            i32.store


            global.get $vx_base
            local.get $obj_counter
            i32.add
            local.tee $vx_offset
            local.get $vx_offset
            i32.load
            i32.const -1
            i32.mul
            local.tee $vx2
            i32.store

            global.get $vy_base
            local.get $i
            i32.add
            local.tee $vy_offset
            local.get $vy_offset
            i32.load
            i32.const -1
            i32.mul
            local.tee $vy1
            i32.store

            global.get $vy_base
            local.get $obj_counter
            i32.add
            local.tee $vy_offset
            local.get $vy_offset
            i32.load
            i32.const -1
            i32.mul
            local.tee $vy2
            i32.store


            global.get $x_base
            local.get $i
            i32.add
            global.get $x_base
            local.get $i
            i32.add
            i32.load
            local.get $vx1
            i32.add
            i32.const 511
            i32.and
            i32.store


            global.get $x_base
            local.get $obj_counter
            i32.add
            global.get $x_base
            local.get $obj_counter
            i32.add
            i32.load
            local.get $vx2
            i32.add
            i32.const 511
            i32.and
            i32.store

            global.get $y_base
            local.get $i
            i32.add
            global.get $y_base
            local.get $i
            i32.add
            i32.load
            local.get $vy1
            i32.add
            i32.const 511
            i32.and
            i32.store


            global.get $y_base
            local.get $obj_counter
            i32.add
            global.get $y_base
            local.get $obj_counter
            i32.add
            i32.load
            local.get $vy2
            i32.add
            i32.const 511
            i32.and
            i32.store
        )
    )


)

(func $find_collisions_2
    (local $obj_counter i32)
    (local $i i32)
    (local $object_i i32)
    (local $dx v128)
    (local $dy v128)
    (local $d v128)
    (local $coll_i v128)
    (local $di i32)
    (local $help i32)
    (local $helpp v128)
    (loop $out
        i32.const 0
        local.set $i

        (loop $inner

        global.get $x_base
        local.get $i
        i32.add
        v128.load

        global.get $x_base
        local.get $obj_counter
        i32.add
        v128.load32_splat

        i32x4.sub
        local.set $dx

        global.get $y_base
        local.get $i
        i32.add
        v128.load

        global.get $y_base
        local.get $obj_counter
        i32.add
        i32.load
        i32x4.splat

        i32x4.sub
        local.set $dy

        local.get $dx
        local.get $dx
        i32x4.mul
        local.get $dy
        local.get $dy
        i32x4.mul
        i32x4.add
        f32x4.convert_i32x4_s
        f32x4.sqrt
        i32x4.trunc_sat_f32x4_s
        local.tee $d
        i32.const 6
        i32x4.splat
        i32x4.ge_s
        i32.const -1
        i32x4.splat
        i32x4.mul
        i32x4.all_true
        (if
            (then
            )
            (else
                local.get $d
                i32x4.extract_lane 0
                local.tee $di
                i32.const 6
                i32.lt_s
                (if
                    (then
                        local.get $di
                        local.get $obj_counter
                        local.get $i
                        call $collision
                    )
                    (else)
                )

                local.get $d
                i32x4.extract_lane 1
                local.tee $di
                i32.const 6
                i32.lt_s
                (if
                    (then
                        local.get $di
                        local.get $obj_counter
                        local.get $i
                        i32.const 4
                        i32.add
                        call $collision
                    )
                    (else)
                )

                local.get $d
                i32x4.extract_lane 2
                local.tee $di
                i32.const 6
                i32.lt_s
                (if
                    (then
                        local.get $di
                        local.get $obj_counter
                        local.get $i
                        i32.const 8
                        i32.add
                        call $collision
                    )
                    (else)
                )

                local.get $d
                i32x4.extract_lane 3
                local.tee $di
                i32.const 6
                i32.lt_s
                (if
                    (then
                        local.get $di
                        local.get $obj_counter
                        local.get $i
                        i32.const 12
                        i32.add
                        call $collision
                    )
                    (else)
                )
            )
        )





        local.get $i
        i32.const 16
        i32.add
        local.tee $i
        i32.const 16
        i32.add
        global.get $object_count
        i32.const 4
        i32.mul
        i32.le_u
        if
        br $inner
        end)

        local.get $obj_counter
        i32.const 4
        i32.add
        local.tee $obj_counter
        i32.const 4
        i32.add
        global.get $object_count
        i32.const 4
        i32.mul
        i32.le_u
        if
        br $out
        end
        )









)







 (func $main (export "main")
  (call $clear_canvas)
  (call $move_objects_2)
  (call $find_collisions_2)
  (call $draw_objects_2)
)
)

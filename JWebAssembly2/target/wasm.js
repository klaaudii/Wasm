 import * as myModule from './myModule.js';
  import {wasmImports} from './JWebAssembly2-1.0-SNAPSHOT.wasm.js'
    // function maxi(a,b) {
    //     if (a > b) return a;
    //     return b;
    // }

    // wasmImports.jsImports = {
    //     maxi: (a, b) => { if (a > b) return a; return b; },
    //     mini: (a, b) => { if (a < b) return a; return b; }
    // };
 //
 // var wasmImports = {
 //     NonGC:{
 //         get_i32:(a,i) => a[i],
 //         new_org_example_Main$Point:() => Object.seal({0:252,1:0,2:0,3:0}),
 //         get_externref:(a,i) => a[i],
 //         set_i32:(a,v,i) => a[i]=v
 //     },
 //     myModule:myModule,
 //     Math:Math,
 //     Main:{
 //         log:(a) => {console.log(a)}
 //     },
 //     System:{
 //         currentTimeMillis:()=>BigInt(Date.now())
 //     }
 // };



    WebAssembly.instantiateStreaming(fetch('JWebAssembly2-1.0-SNAPSHOT.wasm'), wasmImports)
        .then(
            obj => {
                wasmImports.instance = obj.instance;
                // console.log(obj.instance.exports.maxi(10,4))
                console.log( obj.instance.exports.main())
                var a = obj.instance.exports.anotherOne() + BigInt(10)
                console.log(1);
                console.log("la")
                // console.log(obj.instance.exports.main())
                // console.log(obj.instance.exports.main())
                // console.log(obj.instance.exports.anotherOne())
                // console.log(obj.instance.exports.second())
                // console.log(obj.instance.exports.timeMillis())
                // console.log(obj.instance.exports.secondFromMain())
                // console.log(obj.instance.exports.importedSin())
                // console.log(obj.instance.exports.sqrt(64))
                // console.log(obj.instance);
                // console.log(wasmImports.instance)
            })
        .catch((err) => document.write(err + '<p>Missing <a href="https://github.com/i-net-software/JWebAssembly/wiki/browser">Browser Support</a>') );

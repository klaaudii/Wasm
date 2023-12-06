 import * as myModule from './myModule.js';
 var wasmImports = {
     myModule:myModule,
     Math:Math,
     System:{
         currentTimeMillis:()=>BigInt(Date.now())
     }
 };
    // function maxi(a,b) {
    //     if (a > b) return a;
    //     return b;
    // }

    // wasmImports.jsImports = {
    //     maxi: (a, b) => { if (a > b) return a; return b; },
    //     mini: (a, b) => { if (a < b) return a; return b; }
    // };



    WebAssembly.instantiateStreaming(fetch('JWebAssembly2-1.0-SNAPSHOT.wasm'), wasmImports)
        .then(
            obj => {
                wasmImports.instance = obj.instance;
                // console.log(obj.instance.exports.maxi(10,4))
                obj.instance.exports.main()
                var a = obj.instance.exports.anotherOne() + BigInt(10)
                console.log(1);
                console.log("la")
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

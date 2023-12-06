import * as myModule from './myModule.js';

'use strict';var wasmImports = {
NonGC:{
get_i32:(a,i) => a[i],
new_org_example_Main$Point:() => Object.seal({0:252,1:0,2:0,3:0}),
get_externref:(a,i) => a[i],
set_i32:(a,v,i) => a[i]=v
},
myModule:myModule,
Math:Math,
Main:{
log:(a) => {console.log(a)}
},
System:{
currentTimeMillis:()=>BigInt(Date.now())
}
};
// if (typeof module !== 'undefined') module.exports = wasmImports;

export {wasmImports}
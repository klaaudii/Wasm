import antlr4 from './antlr4/index.web.js';
import SimpleLLexer from './SimpleLLexer.js';
import SimpleLParser from './SimpleLParser.js';
import SimpleLVisitor from './SimpleLVisitor.js';
import binaryen from './binaryen/index.js'

class ASTNode {
    constructor(type) {
        this.type = type;
    }
}

class BinOpNode extends ASTNode {
    constructor(type, left, right) {
        super(type);
        this.left = left;
        this.right = right;
    }
}

class IntNode extends ASTNode {
    constructor(value) {
        super('INT');
        this.value = value;
    }
}

class MyVisitor extends SimpleLVisitor {
    visitStart(ctx) {
        return this.visit(ctx.expr());
    }

    visitExpr(ctx) {
        if (ctx.INT()) {
            return new IntNode(parseInt(ctx.INT().getText()));
        } else if (ctx.getChildCount() === 1) {
            return this.visit(ctx.expr(0));
        } else {
            const left = this.visit(ctx.expr(0));
            const right = this.visit(ctx.expr(1));
            const operator = ctx.getChild(1).getText();
            return new BinOpNode(operator, left, right);
        }
    }
}



let wasmModule = new binaryen.Module();
export function compileToWasm(){
    wasmModule = new binaryen.Module();
    const input = document.getElementById('userCode').value;
    const chars = new antlr4.InputStream(input);
    const lexer = new SimpleLLexer(chars);
    const tokens = new antlr4.CommonTokenStream(lexer);
    const parser = new SimpleLParser(tokens);
    parser.buildParseTrees = true;
    const tree = parser.start();
    const visitor = new MyVisitor();
    const ast = visitor.visit(tree);


    const wasmExpression = generateWasm(ast);
    // wasmModule.addFunction('main', binaryen.i32, [], [], wasmModule.block('', [wasmModule.return(result)]));
    wasmModule.addFunction('main', [], binaryen.i32, [], wasmExpression);
    wasmModule.addFunctionExport('main', 'main');

    const wasmText = wasmModule.emitText();

    console.log(wasmText);
    return wasmModule.emitBinary();
}


function generateWasm(node) {
    switch (node.constructor) {
        case BinOpNode:
            return generateBinOpWasm(node);
        case IntNode:
            return generateIntNode(node, wasmModule);
        default:
            throw new Error('Unsupported node type');
    }
}

function generateIntNode(node){
    return wasmModule.i32.const(node.value);
}

function generateBinOpWasm(node) {
    const left = generateWasm(node.left);
    const right = generateWasm(node.right);

    switch (node.type) {
        case '+':
            return wasmModule.i32.add(left, right);
        case '*':
            return wasmModule.i32.mul(left, right);
        default:
            throw new Error('Unsupported operator');
    }
}


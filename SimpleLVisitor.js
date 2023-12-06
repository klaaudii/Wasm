// Generated from SimpleL.g4 by ANTLR 4.13.1
// jshint ignore: start
import antlr4 from './antlr4/index.web.js';

// This class defines a complete generic visitor for a parse tree produced by SimpleLParser.

export default class SimpleLVisitor extends antlr4.tree.ParseTreeVisitor {

	// Visit a parse tree produced by SimpleLParser#start.
	visitStart(ctx) {
	  return this.visitChildren(ctx);
	}


	// Visit a parse tree produced by SimpleLParser#expr.
	visitExpr(ctx) {
	  return this.visitChildren(ctx);
	}



}
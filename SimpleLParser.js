// Generated from SimpleL.g4 by ANTLR 4.13.1
// jshint ignore: start
import antlr4 from './antlr4/index.web.js';
import SimpleLListener from './SimpleLListener.js';
import SimpleLVisitor from './SimpleLVisitor.js';

const serializedATN = [4,1,6,27,2,0,7,0,2,1,7,1,1,0,1,0,1,0,1,1,1,1,1,1,
1,1,1,1,1,1,3,1,14,8,1,1,1,1,1,1,1,1,1,1,1,1,1,5,1,22,8,1,10,1,12,1,25,9,
1,1,1,0,1,2,2,0,2,0,0,27,0,4,1,0,0,0,2,13,1,0,0,0,4,5,3,2,1,0,5,6,5,0,0,
1,6,1,1,0,0,0,7,8,6,1,-1,0,8,9,5,3,0,0,9,10,3,2,1,0,10,11,5,4,0,0,11,14,
1,0,0,0,12,14,5,5,0,0,13,7,1,0,0,0,13,12,1,0,0,0,14,23,1,0,0,0,15,16,10,
4,0,0,16,17,5,1,0,0,17,22,3,2,1,5,18,19,10,3,0,0,19,20,5,2,0,0,20,22,3,2,
1,4,21,15,1,0,0,0,21,18,1,0,0,0,22,25,1,0,0,0,23,21,1,0,0,0,23,24,1,0,0,
0,24,3,1,0,0,0,25,23,1,0,0,0,3,13,21,23];


const atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

const decisionsToDFA = atn.decisionToState.map( (ds, index) => new antlr4.dfa.DFA(ds, index) );

const sharedContextCache = new antlr4.atn.PredictionContextCache();

export default class SimpleLParser extends antlr4.Parser {

    static grammarFileName = "SimpleL.g4";
    static literalNames = [ null, "'+'", "'*'", "'('", "')'" ];
    static symbolicNames = [ null, null, null, null, null, "INT", "WS" ];
    static ruleNames = [ "start", "expr" ];

    constructor(input) {
        super(input);
        this._interp = new antlr4.atn.ParserATNSimulator(this, atn, decisionsToDFA, sharedContextCache);
        this.ruleNames = SimpleLParser.ruleNames;
        this.literalNames = SimpleLParser.literalNames;
        this.symbolicNames = SimpleLParser.symbolicNames;
    }

    sempred(localctx, ruleIndex, predIndex) {
    	switch(ruleIndex) {
    	case 1:
    	    		return this.expr_sempred(localctx, predIndex);
        default:
            throw "No predicate with index:" + ruleIndex;
       }
    }

    expr_sempred(localctx, predIndex) {
    	switch(predIndex) {
    		case 0:
    			return this.precpred(this._ctx, 4);
    		case 1:
    			return this.precpred(this._ctx, 3);
    		default:
    			throw "No predicate with index:" + predIndex;
    	}
    };




	start() {
	    let localctx = new StartContext(this, this._ctx, this.state);
	    this.enterRule(localctx, 0, SimpleLParser.RULE_start);
	    try {
	        this.enterOuterAlt(localctx, 1);
	        this.state = 4;
	        this.expr(0);
	        this.state = 5;
	        this.match(SimpleLParser.EOF);
	    } catch (re) {
	    	if(re instanceof antlr4.error.RecognitionException) {
		        localctx.exception = re;
		        this._errHandler.reportError(this, re);
		        this._errHandler.recover(this, re);
		    } else {
		    	throw re;
		    }
	    } finally {
	        this.exitRule();
	    }
	    return localctx;
	}


	expr(_p) {
		if(_p===undefined) {
		    _p = 0;
		}
	    const _parentctx = this._ctx;
	    const _parentState = this.state;
	    let localctx = new ExprContext(this, this._ctx, _parentState);
	    let _prevctx = localctx;
	    const _startState = 2;
	    this.enterRecursionRule(localctx, 2, SimpleLParser.RULE_expr, _p);
	    try {
	        this.enterOuterAlt(localctx, 1);
	        this.state = 13;
	        this._errHandler.sync(this);
	        switch(this._input.LA(1)) {
	        case 3:
	            this.state = 8;
	            this.match(SimpleLParser.T__2);
	            this.state = 9;
	            this.expr(0);
	            this.state = 10;
	            this.match(SimpleLParser.T__3);
	            break;
	        case 5:
	            this.state = 12;
	            this.match(SimpleLParser.INT);
	            break;
	        default:
	            throw new antlr4.error.NoViableAltException(this);
	        }
	        this._ctx.stop = this._input.LT(-1);
	        this.state = 23;
	        this._errHandler.sync(this);
	        var _alt = this._interp.adaptivePredict(this._input,2,this._ctx)
	        while(_alt!=2 && _alt!=antlr4.atn.ATN.INVALID_ALT_NUMBER) {
	            if(_alt===1) {
	                if(this._parseListeners!==null) {
	                    this.triggerExitRuleEvent();
	                }
	                _prevctx = localctx;
	                this.state = 21;
	                this._errHandler.sync(this);
	                var la_ = this._interp.adaptivePredict(this._input,1,this._ctx);
	                switch(la_) {
	                case 1:
	                    localctx = new ExprContext(this, _parentctx, _parentState);
	                    this.pushNewRecursionContext(localctx, _startState, SimpleLParser.RULE_expr);
	                    this.state = 15;
	                    if (!( this.precpred(this._ctx, 4))) {
	                        throw new antlr4.error.FailedPredicateException(this, "this.precpred(this._ctx, 4)");
	                    }
	                    this.state = 16;
	                    this.match(SimpleLParser.T__0);
	                    this.state = 17;
	                    this.expr(5);
	                    break;

	                case 2:
	                    localctx = new ExprContext(this, _parentctx, _parentState);
	                    this.pushNewRecursionContext(localctx, _startState, SimpleLParser.RULE_expr);
	                    this.state = 18;
	                    if (!( this.precpred(this._ctx, 3))) {
	                        throw new antlr4.error.FailedPredicateException(this, "this.precpred(this._ctx, 3)");
	                    }
	                    this.state = 19;
	                    this.match(SimpleLParser.T__1);
	                    this.state = 20;
	                    this.expr(4);
	                    break;

	                } 
	            }
	            this.state = 25;
	            this._errHandler.sync(this);
	            _alt = this._interp.adaptivePredict(this._input,2,this._ctx);
	        }

	    } catch( error) {
	        if(error instanceof antlr4.error.RecognitionException) {
		        localctx.exception = error;
		        this._errHandler.reportError(this, error);
		        this._errHandler.recover(this, error);
		    } else {
		    	throw error;
		    }
	    } finally {
	        this.unrollRecursionContexts(_parentctx)
	    }
	    return localctx;
	}


}

SimpleLParser.EOF = antlr4.Token.EOF;
SimpleLParser.T__0 = 1;
SimpleLParser.T__1 = 2;
SimpleLParser.T__2 = 3;
SimpleLParser.T__3 = 4;
SimpleLParser.INT = 5;
SimpleLParser.WS = 6;

SimpleLParser.RULE_start = 0;
SimpleLParser.RULE_expr = 1;

class StartContext extends antlr4.ParserRuleContext {

    constructor(parser, parent, invokingState) {
        if(parent===undefined) {
            parent = null;
        }
        if(invokingState===undefined || invokingState===null) {
            invokingState = -1;
        }
        super(parent, invokingState);
        this.parser = parser;
        this.ruleIndex = SimpleLParser.RULE_start;
    }

	expr() {
	    return this.getTypedRuleContext(ExprContext,0);
	};

	EOF() {
	    return this.getToken(SimpleLParser.EOF, 0);
	};

	enterRule(listener) {
	    if(listener instanceof SimpleLListener ) {
	        listener.enterStart(this);
		}
	}

	exitRule(listener) {
	    if(listener instanceof SimpleLListener ) {
	        listener.exitStart(this);
		}
	}

	accept(visitor) {
	    if ( visitor instanceof SimpleLVisitor ) {
	        return visitor.visitStart(this);
	    } else {
	        return visitor.visitChildren(this);
	    }
	}


}



class ExprContext extends antlr4.ParserRuleContext {

    constructor(parser, parent, invokingState) {
        if(parent===undefined) {
            parent = null;
        }
        if(invokingState===undefined || invokingState===null) {
            invokingState = -1;
        }
        super(parent, invokingState);
        this.parser = parser;
        this.ruleIndex = SimpleLParser.RULE_expr;
    }

	expr = function(i) {
	    if(i===undefined) {
	        i = null;
	    }
	    if(i===null) {
	        return this.getTypedRuleContexts(ExprContext);
	    } else {
	        return this.getTypedRuleContext(ExprContext,i);
	    }
	};

	INT() {
	    return this.getToken(SimpleLParser.INT, 0);
	};

	enterRule(listener) {
	    if(listener instanceof SimpleLListener ) {
	        listener.enterExpr(this);
		}
	}

	exitRule(listener) {
	    if(listener instanceof SimpleLListener ) {
	        listener.exitExpr(this);
		}
	}

	accept(visitor) {
	    if ( visitor instanceof SimpleLVisitor ) {
	        return visitor.visitExpr(this);
	    } else {
	        return visitor.visitChildren(this);
	    }
	}


}




SimpleLParser.StartContext = StartContext; 
SimpleLParser.ExprContext = ExprContext; 

// Generated from SimpleL.g4 by ANTLR 4.13.1
// jshint ignore: start
import antlr4 from './antlr4/index.web.js';


const serializedATN = [4,0,6,33,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,
7,4,2,5,7,5,1,0,1,0,1,1,1,1,1,2,1,2,1,3,1,3,1,4,4,4,23,8,4,11,4,12,4,24,
1,5,4,5,28,8,5,11,5,12,5,29,1,5,1,5,0,0,6,1,1,3,2,5,3,7,4,9,5,11,6,1,0,2,
1,0,48,57,3,0,9,10,13,13,32,32,34,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,
7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,1,13,1,0,0,0,3,15,1,0,0,0,5,17,1,0,0,
0,7,19,1,0,0,0,9,22,1,0,0,0,11,27,1,0,0,0,13,14,5,43,0,0,14,2,1,0,0,0,15,
16,5,42,0,0,16,4,1,0,0,0,17,18,5,40,0,0,18,6,1,0,0,0,19,20,5,41,0,0,20,8,
1,0,0,0,21,23,7,0,0,0,22,21,1,0,0,0,23,24,1,0,0,0,24,22,1,0,0,0,24,25,1,
0,0,0,25,10,1,0,0,0,26,28,7,1,0,0,27,26,1,0,0,0,28,29,1,0,0,0,29,27,1,0,
0,0,29,30,1,0,0,0,30,31,1,0,0,0,31,32,6,5,0,0,32,12,1,0,0,0,3,0,24,29,1,
6,0,0];


const atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

const decisionsToDFA = atn.decisionToState.map( (ds, index) => new antlr4.dfa.DFA(ds, index) );

export default class SimpleLLexer extends antlr4.Lexer {

    static grammarFileName = "SimpleL.g4";
    static channelNames = [ "DEFAULT_TOKEN_CHANNEL", "HIDDEN" ];
	static modeNames = [ "DEFAULT_MODE" ];
	static literalNames = [ null, "'+'", "'*'", "'('", "')'" ];
	static symbolicNames = [ null, null, null, null, null, "INT", "WS" ];
	static ruleNames = [ "T__0", "T__1", "T__2", "T__3", "INT", "WS" ];

    constructor(input) {
        super(input)
        this._interp = new antlr4.atn.LexerATNSimulator(this, atn, decisionsToDFA, new antlr4.atn.PredictionContextCache());
    }
}

SimpleLLexer.EOF = antlr4.Token.EOF;
SimpleLLexer.T__0 = 1;
SimpleLLexer.T__1 = 2;
SimpleLLexer.T__2 = 3;
SimpleLLexer.T__3 = 4;
SimpleLLexer.INT = 5;
SimpleLLexer.WS = 6;




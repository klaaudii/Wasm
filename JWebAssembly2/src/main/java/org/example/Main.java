package org.example;
import de.inetsoftware.jwebassembly.api.annotation.Export;
import de.inetsoftware.jwebassembly.api.annotation.Import;
import de.inetsoftware.jwebassembly.api.annotation.WasmTextCode;
import de.inetsoftware.jwebassembly.web.dom.Document;
import de.inetsoftware.jwebassembly.web.dom.HTMLElement;
import de.inetsoftware.jwebassembly.web.dom.Text;
import de.inetsoftware.jwebassembly.web.dom.Window;


public class Main {

    static class Point {
        int x;
        int y;

        Point(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public int getX() {
            return x;
        }
    }

    @Export
    public static void main() {
        Point point = new Point(10,20);
        log(point.getX() + 10);
//        System.out.println(point.getX());
    }

//    @Export
//    public static byte[] getData(){
//        String myString = "Hello, World!";
////        String charsetName = "UTF-8"; // Example: UTF-8 encoding
////        try {
////            return myString.getBytes(charsetName);
////        } catch (Throwable e) {
////
////        }
////        return new byte[0];
//        return myString.getBytes();
//    }

//    @Export
//    public static void setData( byte[] data ) {
//
//    }
//
    @Export()
    public static long anotherOne() {
        return maxi(100,200);
    }

    @Export()
    public static long timeMillis() {
        return System.currentTimeMillis();
    }
    @Export
    public static long secondFromMain(){
        return Second.main();
    }

    @Export
    public static double importedSin(){
        return sin(1.5);
    }

    @Import( module = "Math", name = "sin" )
    static native double sin( double x );

    @Import( js = "(a) => {console.log(a)}")
    static native double log( double x );

//    @Import( module = "", name = "maxi" )
//    static native double maxi(int x, int y);

    @Import(js = "(a,b) => {if (a > b) return a; return b}")
    public static native int max(int a, int b);

    @Import(module="myModule", name="maxi")
    public static native int maxi(int a, int b);

    @Export
    @WasmTextCode( "local.get 0 " //
            + "f64.sqrt " //
            + "return" )
    public static native double sqrt( double x );
//
//    @WasmTextCode( value = "local.get 0 " + //
//            "global.set $java/lang/System.out" )
//    static native void setOut(PrintStream out);
//
//    @Import( js = "(src,srcPos,dest,destPos,length)=>{" + //
//            "src=src[2];" + //
//            "dest=dest[2];" + //
//            "if(destPos<srcPos){" + //
//            "for (var i=0;i<length;i++)dest[i+destPos]=src[i+srcPos];" + //
//            "}else{" + //
//            "for (var i=length-1;i>=0;i--)dest[i+destPos]=src[i+srcPos];" + //
//            "}" + //
//            "}" )
//    static native void arraycopy( Object src, int srcPos, Object dest, int destPos, int length );
}
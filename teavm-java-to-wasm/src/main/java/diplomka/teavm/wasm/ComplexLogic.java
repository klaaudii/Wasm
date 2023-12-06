package diplomka.teavm.wasm;

//import org.teavm.interop.*;

import org.teavm.interop.Export;
import org.teavm.interop.Import;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ComplexLogic {

	static List<Ball> balls;
	static int age = 111;
	static int height = 200;

	int h;
	@Export(name="main")
	public static void main(String[] args) {
		initBalls();
	}

	@Export(name = "initBalls")
	public static int initBalls() {
//		height = 202;
		age = 120;
		Ball ball = new Ball(0,0,10,0);
		ball.move();
		return ball.getX();
//		balls.add(ball);
//		return balls.get(0).getX();

//		Random rnd = new Random();
//		balls = new ArrayList<>();
//		for (int i = 0; i < 1000; i++){
//			balls.add(new Ball(rnd.nextInt(512),rnd.nextInt(512),
//					rnd.nextBoolean() ? 1 : -1, rnd.nextBoolean() ? 1 : -1));
//		}
//		System.out.println("ahoj");
	}

	@Export(name = "initb")
	public void initb() {
		height = 205;
//		Random rnd = new Random();
//		balls = new ArrayList<>();
//		for (int i = 0; i < 1000; i++){
//			balls.add(new Ball(rnd.nextInt(512),rnd.nextInt(512),
//					rnd.nextBoolean() ? 1 : -1, rnd.nextBoolean() ? 1 : -1));
//		}
//		System.out.println("ahoj");
	}

	@Export(name = "inith")
	public void inith() {
		h = 25;
//		Random rnd = new Random();
//		balls = new ArrayList<>();
//		for (int i = 0; i < 1000; i++){
//			balls.add(new Ball(rnd.nextInt(512),rnd.nextInt(512),
//					rnd.nextBoolean() ? 1 : -1, rnd.nextBoolean() ? 1 : -1));
//		}
//		System.out.println("ahoj");
	}

//	@Export(name = "moveBalls")
//	public void moveBalls() {
//		for (int i = 0; i < balls.size(); i++) {
//			balls.get(i).move();
//		}
//	}
//
//
//	@Export(name = "solveCollision")
//	public void solveCollision() {
//		for (int i = 0; i < balls.size(); i++) {
//			for (int j = 0; j < balls.size(); j++){
//				if (i == j) {
//					continue;
//				}
//				balls.get(i).solveCollision(balls.get(j));
//			}
//		}
//	}
//
//	@Export(name = "drawBalls")
//	public void drawBalls() {
//		for (Ball ball : balls) {
//			drawBall(ball.getX(), ball.getY());
//		}
//	}
//
//	@Import(module = "teavm", name = "drawBall")
//	private static native void drawBall(int x, int y);
//
//	@Export(name = "animateJava")
//	public void animateJava() {
//		moveBalls();
//		solveCollision();
//		drawBalls();
//	}
//
//	@Export(name = "animateJ")
//	public void animateJ() {
//		for (int i = 0; i < balls.size(); i++) {
//			balls.get(i).move();
//		}
//		for (int i = 0; i < balls.size(); i++) {
//			for (int j = 0; j < balls.size(); j++){
//				if (i == j) {
//					continue;
//				}
//				balls.get(i).solveCollision(balls.get(j));
//			}
//		}
//		for (Ball ball : balls) {
//			drawBall(ball.getX(), ball.getY());
//		}
//	}
//
//
//	@Export(name = "getMagicNumber")
//    public static void getMagicNumber(int range) {
//		int magicNumber = (range/2) + range%3;
//
//		setMagicNumber(magicNumber);
//    }
//
//	@Import(module = "teavm", name = "setMagicNumber")
//    private static native void setMagicNumber(int message);
//
//
//	@Export(name = "getListAt")
//	public static int getListAt(int index) {
//		Random rand = new Random();
//		List<Integer> mutableList = new ArrayList<>();
//		for (int i = 0; i < 10; i++){
//			mutableList.add(rand.nextInt(10));
//		}
//		return mutableList.get(index);
//	}



}

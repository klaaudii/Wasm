package diplomka.teavm.wasm;

import org.teavm.interop.Export;

public class Ball {
    private int x = 111;
    private int y = 11;
    private int vx = 150;
    private int vy = 11;

    public Ball(int x, int y, int vx, int vy) {
        this.x = x;
        this.y = y;
        this.vx = vx;
        this.vy = vy;
    }

    public static void main(String[] args) {
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getVx() {
        return vx;
    }

    public void setVx(int vx) {
        this.vx = vx;
    }

    public int getVy() {
        return vy;
    }

    public void setVy(int vy) {
        this.vy = vy;
    }

    private int convertNumber(int n){
        n = n % 512;
        if (n < 0){
            n += 512;
        }
        return n;
    }
    @Export(name = "move")
    public void move() {
        x = convertNumber(x + vx);
        y = convertNumber(y + vy);
    }

    public void solveCollision(Ball ball) {
        int dx = ball.x - x;
        int dy = ball.y - y;
        double d = Math.pow(Math.pow(dx,2) + Math.pow(dy,2),0.5);
        if (d < 6) {
            vx *= -1;
            vy *= -1;
            ball.vx *= -1;
            ball.vy *= -1;
            x += vx;
            y += vy;
            ball.x += ball.vx;
            ball.y += ball.vy;
        }
    }

    @Export(name = "lala")
    public void lala() {
        x = 10;
        y = 110;
    }
}

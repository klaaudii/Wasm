import random
from js import drawBall

class Ball:
    def __init__(self, x, y, vx, vy):
        self.x = x
        self.y = y
        self.vx = vx
        self.vy = vy



    def convert_number(self, n):
        n = n % 512
        if n < 0:
            n += 512
        return n

    def move(self):
        self.x = self.convert_number(self.x + self.vx)
        self.y = self.convert_number(self.y + self.vy)

    def solve_collision(self, ball):
        dx = ball.x - self.x
        dy = ball.y - self.y
        d = (dx**2 + dy**2)**0.5
        if d < 6:
            self.vx *= -1
            self.vy *= -1
            ball.vx *= -1
            ball.vy *= -1
            self.x += self.vx
            self.y += self.vy
            ball.x += ball.vx
            ball.y += ball.vy

balls = []
def init_balls():
    print("init")
    for i in range(100):
        balls.append(Ball(random.randint(0, 512), random.randint(0, 512), random.choice([-1,1]), random.choice([-1,1])))
    print("end init")

def move_balls():
    for ball in balls:
        ball.move()

def solve_collisions():
    for i in range(len(balls)):
        for j in range(len(balls)):
            if i != j:
                balls[i].solve_collision(balls[j])

def draw_balls():
    for ball in balls:
        drawBall(ball.x, ball.y)

def animate():
    move_balls()
    solve_collisions()
    draw_balls()


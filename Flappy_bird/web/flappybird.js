/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Lấy tham chiếu đến canvas
var canvas = document.createElement("canvas");
var context = canvas.getContext("2d");
document.body.appendChild(canvas);

// Thiết lập kích thước canvas
canvas.width = 800;
canvas.height = 600;

// Biến trò chơi
var bird = { x: 100, y: 300, velocity: 0, gravity: 2 };
var pipes = [];
var score = 0;

// Lắng nghe sự kiện nhấn phím để làm con chim nhảy
window.addEventListener("keydown", function (event) {
    if (event.code === "Space") {
        bird.velocity = -20;
    }
});

// Hàm cập nhật trạng thái trò chơi
function update() {
    bird.velocity += bird.gravity;
    bird.y += bird.velocity;

    // Tạo ống mới và kiểm tra va chạm
    if (Math.random() < 0.02) {
        pipes.push({ x: canvas.width, height: 100 + Math.random() * 300 });
    }

    for (var i = pipes.length - 1; i >= 0; i--) {
        pipes[i].x -= 5;

        if (pipes[i].x < bird.x + 30 && bird.x < pipes[i].x + 50) {
            if (!(bird.y < pipes[i].height || bird.y > pipes[i].height + 200)) {
                gameOver();
            }
        }

        if (pipes[i].x < -50) {
            pipes.splice(i, 1);
            score++;
        }
    }

    // Kiểm tra va chạm với đất
    if (bird.y > canvas.height) {
        gameOver();
    }
}

// Hàm vẽ các đối tượng trong trò chơi
function draw() {
    // Vẽ nền
    context.fillStyle = "#87CEEB";
    context.fillRect(0, 0, canvas.width, canvas.height);

    // Vẽ con chim
    context.fillStyle = "#FFD700";
    context.fillRect(bird.x, bird.y, 30, 30);

    // Vẽ ống
    context.fillStyle = "#008000";
    for (var i = 0; i < pipes.length; i++) {
        context.fillRect(pipes[i].x, 0, 50, pipes[i].height);
        context.fillRect(pipes[i].x, pipes[i].height + 200, 50, canvas.height - pipes[i].height - 200);
    }

    // Vẽ điểm số
    context.fillStyle = "#000000";
    context.font = "20px Arial";
    context.fillText("Score: " + score, 20, 20);
}

// Hàm kết thúc trò chơi
function gameOver() {
    alert("Game Over! Your Score: " + score);
    document.location.reload();
}

// Hàm lặp trò chơi
function gameLoop() {
    update();
    draw();
    requestAnimationFrame(gameLoop);
}

// Bắt đầu lặp trò chơi
gameLoop();



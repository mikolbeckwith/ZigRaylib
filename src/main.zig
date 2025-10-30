const rl = @import("raylib");

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // get the mouse position
        const button_rectangle = rl.Rectangle{
            .x = 350,
            .y = 200,
            .width = 100,
            .height = 50,
        };
        var button_color: rl.Color = rl.Color.blue;

        const mouse_position = rl.getMousePosition();
        const mouse_over_button = rl.checkCollisionPointRec(mouse_position, button_rectangle);
        var button_pressed: bool = false;

        if (mouse_over_button) {
            if (rl.isMouseButtonDown(.left)) {
                // Button action goes here
                button_pressed = true;
                button_color = rl.Color.red;
            } else {
                button_color = rl.Color.green;
            }
        }

        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);
        rl.drawRectangleRec(button_rectangle, button_color);
        rl.drawText("Click Me!", button_rectangle.x + 15, button_rectangle.y + 15, 14, .black);

        // rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
        //----------------------------------------------------------------------------------
    }
}

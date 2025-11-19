#!/usr/bin/env bash

read -p "Enter the path to your input file: " input_file

if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

ffmpeg -i "$input_file" ./source/progress-%01d.png -hide_banner

touch ./source/animated-boot.script

image_count=$(ls ./source/progress-*.png 2>/dev/null | wc -l)

echo "Window.SetBackgroundTopColor (0.0, 0.00, 0.0);

Window.SetBackgroundBottomColor (0.0, 0.00, 0.0);

for (i = 1; i <= $image_count; i++)
  flyingman_image[i] = Image(\"progress-\" + i + \".png\");
flyingman_sprite = Sprite();


flyingman_sprite.SetX(Window.GetWidth() / 2 - flyingman_image[1].GetWidth() / 2);
flyingman_sprite.SetY(Window.GetHeight() / 2 - flyingman_image[1].GetHeight() / 2);

progress = 1;

fun refresh_callback ()
  {
    flyingman_sprite.SetImage(flyingman_image[(Math.Int(progress / 3) % $image_count) + 1]);
    progress++;
  }
  
Plymouth.SetRefreshFunction (refresh_callback);
" >> ./source/animated-boot.script

echo "Done!"
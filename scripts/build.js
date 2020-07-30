const fs = require("fs")
const path = require("path")
const nodeHtmlToImage = require('node-html-to-image')

const convert = async (src, output, content) => {
  src = path.resolve(__dirname, src);
  output = path.resolve(__dirname, output);

  const html = fs.readFileSync(src).toString();
  await nodeHtmlToImage({
    output,
    html,
    transparent: true,
    content,
  })

  console.log(`Successfully converted "${src}" to "${output}"!`);
}
 
// convert("button.html", "start_button.png", { label: "Start" });
// convert("button.html", "credits_button.png", { label: "Credits" });
convert("button.html", "levels_button.png", { label: "Levels" });
// convert("button.html", "exit_button.png", { label: "Quit" });
// convert("title.html", "title.png");
// convert("health-outline.html", "health-outline.png");
// convert("text-bubble.html", "text-bubble.png");


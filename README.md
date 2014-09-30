# gengo-parser

[kaiinui/GengoML](https://github.com/kaiinui/GengoML)向けのParser

## Usage

こんな感じのテキストファイルを用意

data.txt
```
[[[@HELLO_WORLD]]]

[[[Category:UI Control, Instruction:アプリのチュートリアルに入るので、柔らかめにお願いします. 次の URL でスクリーンショットを参照してください。 , Context:http://dropbox.com/public/screenshot1.png]]]

こんにちは!

[[[/@HELLO_WORLD]]]
```

して引数に入れてやると
```
$ ruby parser.rb data.txt
"@HELLO_WORLD" = "こんにちは!"
```
こんな感じで返してくれる

echo "Initializing Text-to-Speech autoload plugin"

python3 << END

import vim
import pyttsx3

engine = pyttsx3.init()

def GetRange():
    buf = vim.current.buffer
    (lnum1, col1) = buf.mark('<')
    (lnum2, col2) = buf.mark('>')
    lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
    if len(lines) == 1:
        lines[0] = lines[0][col1:col2 + 1]
    else:
        lines[0] = lines[0][col1:]
        lines[-1] = lines[-1][:col2 + 1]
    return "\n".join(lines)

def Text2Speech(visual):
  if visual == "0":
    word = vim.eval("expand('<cWORD>')")
  else:
    word = GetRange()

  engine.say(word)
  engine.runAndWait()
END


function! tts#Speak(visual=0) abort
  :py3 Text2Speech(vim.eval("a:visual"))
endfunction

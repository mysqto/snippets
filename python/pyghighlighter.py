# The MIT License (MIT)
# 
# Copyright (c) 2014 Chen Lei
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.lexers import guess_lexer
from pygments.lexers.special import TextLexer
from pygments.formatters import HtmlFormatter
from pygments.util import ClassNotFound

def pyghighlight(code, lang):
    try:
        # First, use passed language
        lexer = get_lexer_by_name(lang, stripall=True)
    except ClassNotFound:
        try:
            # Then, try guss language
            lexer = guess_lexer(code)
        except ClassNotFound:
            # We can do Nothing, just plain text
            lexer = TextLexer
    # Found Nothing, use plain text
    if lexer is None:
        lexer = TextLexer
    formatter = HtmlFormatter(linenos=True, nowrap=True, cssclass="source")
    result = highlight(code, lexer, formatter)
    return str(result)

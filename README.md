cordova-plugin-base64binary
============

This plugin decodes base64binary data via native Objective-C code.

-----

Some experimenal features:
* Send your image via tweet.
* Send your image and or document via Gmail.
* Open documents via Microsoft or a PDF, like, word processing application.
* More to come or yet to be discoverd. Stay tuned.


> Compatiple files when decoding: 
> PNG, JPG, MP3, PDF, MS WORD, TXT, HTML.

The list will grow over time. Thank you for patience.

-----


Usage:
------

```javascript

function startDecoding(a,b){
    
    a = base64binary;  // Use small files in kb to test the base64binary string.
    b = filenameString; // Your code doesn't have to look like this. Thank goodness :)

    startUtility(a, b);
}

// Thats it!

```




## License

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software

TgramaHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# fix_ctrlCanonizesURLs

This is a simple patch for Firefox on MacOS.

I use Ctrl+Enter constantly, but Firefox 137 changes the shortcut on MacOS to CMD+Enter.
This patch reverts the shortcut back to Ctrl+Enter, keeping it consistent across platforms.

## Usage

Download your desired Firefox source tarball, drop this patch in the root, then execute the following commands:

```Bash
patch -p1 < fix_ctrlCanonizesURLs.patch
./mach build
```


# fix_ctrlCanonizesURLs

This is a simple patch for Firefox on MacOS.

I use Ctrl+Enter constantly, but Firefox 137 changes the shortcut on MacOS to CMD+Enter.
This patch reverts the shortcut back to Ctrl+Enter, keeping it consistent across platforms.

Also includes ffdl, a small script for downloading and extracting Firefox source tarballs.

## Dependencies

The patch is just a patch, but ffdl has a few dependencies.
You'll need to make sure each of `LWP::Simple`, `Archive::Tar::Wrapper`, and `File::Copy::Recursive` are installed.
If you don't want to use the script, you can download your own sources and patch.

## Usage

To do a complete patched build, run the following commands:

```Bash
git clone https://github.com/calebstein1/Firefox-fix_ctrlCanonizesURLs
./ffdl.pl <version>
cd firefox-<version>
patch -p1 <../fix_ctrlCanonizesURLs.patch
./mach build
./mach package
```

The ffdl script takes version names in the form of either 1xx.x for stable builds, or 1xx.xbx for beta builds.


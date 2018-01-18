
# `animate_modules.rb`

Every commit in a repository, checkout the commit, run graphmod, render the graph (if new), and then make a gif of the rendered graphs.


# Requirements:


## [graphmod](https://hackage.haskell.org/package/graphmod)

```bash

stack install graphmod
```


## [dot](www.graphviz.org)

```bash
brew install graphviz
```


## ImageMagick

```bash
brew install imagemagick
```

```
> convert --version
Version: ImageMagick 6.9.7-3 Q16 x86_64 2017-01-07 http://www.imagemagick.org
Copyright: © 1999-2017 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC Modules
Delegates (built-in): bzlib freetype jng jpeg ltdl lzma png tiff xml zlib
```


## Ruby

```
> ruby --version
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]
```


# Usage

```bash
# Without logging:
ruby animate_modules.rb "https://github.com/michaeljklein/hackage-stats.git"

# With logging:
ruby animate_modules.rb "https://github.com/michaeljklein/hackage-stats.git" | tee -a animated_modules_https_github_com_michaeljklein_hackage_stats_git.log
```

```ruby
animate_modules.rb [0] [1] [2] [3]

or

ruby animate_modules.rb [0] [1] [2] [3]

[0] to_clone     (required)
[1] out_dir      (default is '.')
[2] out_filename (default is "animated_modules_\#{to_clone.gsub(/\W+/, '_')}.gif"
[3] temp_dir     (default is random-ish)
```


# Examples


- [Equirecursive](https://github.com/michaeljklein/Equirecursive)

![examples/animated_modules_https_github_com_michaeljklein_Equirecursive_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_Equirecursive_git.gif "Title")

[examples/animated_modules_https_github_com_michaeljklein_Equirecursive_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_Equirecursive_git.log)


- [git-details](https://github.com/michaeljklein/git-details)

![examples/animated_modules_https_github_com_michaeljklein_git_details_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_git_details_git.gif "Title")

[examples/animated_modules_https_github_com_michaeljklein_git_details_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_git_details_git.log)


- [hackage-stats](https://github.com/michaeljklein/hackage-stats)

![examples/animated_modules_https_github_com_michaeljklein_hackage_stats_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_hackage_stats_git.gif "Title")

[examples/animated_modules_https_github_com_michaeljklein_hackage_stats_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_hackage_stats_git.log)


- [parser-tutorial](https://github.com/michaeljklein/parser-tutorial)

![examples/animated_modules_https_github_com_michaeljklein_parser_tutorial_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_parser_tutorial_git.gif "Title")

[examples/animated_modules_https_github_com_michaeljklein_parser_tutorial_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_parser_tutorial_git.log)


- [prim-spoon](https://github.com/michaeljklein/prim-spoon)

![examples/animated_modules_https_github_com_michaeljklein_prim_spoon_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_prim_spoon_git.gif "Title")

[examples/animated_modules_https_github_com_michaeljklein_prim_spoon_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_prim_spoon_git.log)


- [stream-timers](https://github.com/michaeljklein/stream-timers)

![examples/animated_modules_https_github_com_michaeljklein_stream_timers_git.gif](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_michaeljklein_stream_timers_git.gif "michaeljklein/stream-timers")


- [Pandoc](https://github.com/jgm/pandoc) is too big for this script without changes:

[examples/animated_modules_https_github_com_jgm_pandoc_git.log](
[examples/animated_modules_https_github_com_michaeljklein_prim_spoon_git.log](https://github.com/michaeljklein/animate_modules/raw/master/examples/animated_modules_https_github_com_jgm_pandoc_git.log)






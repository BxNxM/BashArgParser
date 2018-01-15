# BashArgParser

***BASIC DEMO USAGE***

* Get maunual page

```
XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --man
--man		::	manual 
--example	::	example for usage,  2 par
--example2	::	other example for usage, 1 par
```

* Input check - and manual

```
XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash asd
[!!!] valid arg not find, use --man for more info.
```

* The right usage - paratemer inputs check

```
XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example val1 val2
example was called with parameters: val1 val2 
```
* And the other input handling capabilities

```
XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example val1 val2 --example2 val1
example was called with parameters: val1 val2 
example was called with parameters: val1 

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example val1 val2 --example2
--example2 arg required 1 parameter, 0 were given
[!!!] args error, use --man for more info.

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example val1 --example2 val1
[!!!] args error, use --man for more info.

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example2 val1
example was called with parameters: val1 

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example2 val1 --example2 
--example2 arg required 1 parameter, 0 were given
[!!!] args error, use --man for more info.

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example2 val1 --example val1 val2
example was called with parameters: val1 val2 
example was called with parameters: val1 

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example2 val1 --example2 val11 val22
example was called with parameters: val11 

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example2 val1 --example2 val112
example was called with parameters: val112 

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash
XyZ@AsD-MacBook-Pro:bash_argparser$
```

# To set your custom parameters edit:
***bash_argparser/arg_pargser.bash*** file

* At line: 12- 23

```
 12 # ------------------- SET ARG PARSER ----------------#
 13 function init() {
 14     #__________________________!!!!!!!!!___________________________#
 15     ########################## SET THESE ###########################
 16     known_args=("man" "debug" "example" "example2" "example3")                             # valid arg list - add ne    w args - call with -- expl: --man
 17     known_args_subs_pcs=(0 0 2 1 0)                                               # values for args - expl: --man ->     0, --example -> 1 etc.
 18     man_for_args=("--man\t\t::\tmanual"\                                        # add help text here
 19                   "--example\t::\texample for usage,  ${known_args_subs_pcs[2]} par"\
 20                   "--example2\t::\tother example for usage, ${known_args_subs_pcs[3]} par"\
 21                   "--example3\t::\tother example for usage, ${known_args_subs_pcs[4]} par")
 22     #______________________________________________________________#
 23     ################################################################
```

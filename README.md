------------------- BashArgParser ------------------
::::::::::::::::: BASIC DEMO USAGE :::::::::::::::::

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --man
--man		::	manual 
--example	::	example for usage,  2 par
--example2	::	other example for usage, 1 par

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash asd
[!!!] valid arg not find, use --man for more info.

XyZ@AsD-MacBook-Pro:bash_argparser$ ./usage_like_module.bash --example val1 val2
example was called with parameters: val1 val2 

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

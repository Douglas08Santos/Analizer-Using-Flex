# lexical-analyser

Install Flex
```
sudo apt install flex
```
Run Flex and execute the code
```
flex analyzer.l && gcc lex.yy.c -ll && ./a.out < input.txt
```
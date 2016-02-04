# Magma

An attempt to implement Crystal interpreter.

Currently under hard development. However you can try it:)

## Installation

It requires Crystal v0.11.

Clone the repo:
```
git clone https://github.com/greyblake/crystal-magma.git
cd crystal-magma
```
Run make to build binary
```
make
```

## Usages

Now you can try to run some samples, e.g:
```
# aka Hello World
./bin/magma ./bin/magma ./samples/saluton_mondo.cr
Saluton Mondo!

# Recursive fibonacci
/bin/magma ./samples/recursive_fibonacci.cr
```

There are a lot to implement, likely you'll experience a bug, if you'll try to run something more complecated.

## Contributors

- [greyblake](https://github.com/greyblake) Potapov Sergey - creator, maintainer

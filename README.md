# test-package

Smallest setup that reproduces the following linker issue:

```
<command line>: can't load .so/.DLL for: ~/code/docker-linker/.stack-work/dist/x86_64-linux-dk0b0e913400164c45d895a78059f06b08/Cabal-2.4.0.1/build/libHStest-package-0.1.0.0-9yqG0W3aMra6J2U4MACSLQ-ghc8.6.5.so (Error loading shared library libHStest-package-0.1.0.0-DCIOn6fmoou5Fo9Xfia0Fe-test-package-internal-ghc8.6.5.so: No such file or directory (needed by ~/code/docker-linker/.stack-work/dist/x86_64-linux-dk0b0e913400164c45d895a78059f06b08/Cabal-2.4.0.1/build/libHStest-package-0.1.0.0-9yqG0W3aMra6J2U4MACSLQ-ghc8.6.5.so))

--  While building package test-package-0.1.0.0 using:
      ~/.stack/setup-exe-cache/x86_64-linux-dk0b0e913400164c45d895a78059f06b08/Cabal-simple_mPHDZzAJ_2.4.0.1_ghc-8.6.5 --builddir=.stack-work/dist/x86_64-linux-dk0b0e913400164c45d895a78059f06b08/Cabal-2.4.0.1 build lib:test-package lib:test-package-internal exe:test-package-exe --ghc-options " -fdiagnostics-color=always"
    Process exited with code: ExitFailure 1
```

## Steps to reproduce

Run `stack docker pull`
Run `stack build --docker`

## Observations

- Building locally works fine
- Building with docker using default `fpco/stack-build` works fine
- Building with docker using another debian image e.g., `haskell:8` works fine
- Building with alpine image e.g., `neoncrisis/alpine-haskell-gmp:8.6.5` *does not work*
- The issue only happens when *both* the library and executable targets depend on the internal-library

## Docker image

The docker image `neoncrisis/alpine-haskell-gmp:8.6.5` is built from the following repository:
https://github.com/jkachmar/alpine-haskell-stack

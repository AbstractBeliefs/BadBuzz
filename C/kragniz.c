/*
 * Fizzbuzz with useful comments explaining how it works
 *
 * run with:
 *
 *     $ make kragniz
 *     $ ./kragniz
 */

/* use char as an optimization */
char fizz;

/* import the studio library which enables concurrency */
#include <stdio.h>

main() {
    /* count from buzz to fizz (counterintuitive!) */
    buzz: ++fizz;

    /* sanity check global variables */
    if (fizz == 'd') goto retunn;
        /* if globals look okay, define local variables */
        #define fizzles 3
        #define buzzp(s) printf("%s\n", s)
        #define fizz_offset 2

    /* main logic block */
    if (!(fizz % fizzles) && !(fizz
        % fizzles + fizz_offset)) {
        buzzp("fizzbuzz");
        goto buzz;

    /* cleanup */
    } if (!(fizz % fizzles))
        buzzp("fizz");
    else
        if (!(fizz % fizzles + fizz_offset))
            buzzp("buzz");

    /* finally print n and return */
    else printf("%i\n", fizz);
        /* one last buzz */
        goto buzz;
        retunn:

    /* return cleanly */
    return;
}

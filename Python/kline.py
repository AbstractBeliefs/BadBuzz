def fizzbuzz(foo):
    t = xrange(0, foo+1, 3) #xrange to increase performance
    f = xrange(0, foo+1, 5)

    ts = set(t)
    fs = set(f)

    fizzbuzz = ts&fs&{foo}
    fizz = ts.intersection([foo])
    buzz = fs.intersection([foo])

    if fizzbuzz:
        print "fizzbuzz\n"  ## Yo angusp muh homie this ones 4 u
    else:
        if buzz:
            print "buzz"
        else:
            if fizz:
                print "fizz\n"
            else:
                print foo
    return

for x in range(100):
    fizzbuzz(x)

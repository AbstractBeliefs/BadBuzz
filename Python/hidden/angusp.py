def fb(n):
    for i in range(1,(n+1)):
        if((i % 3) == 0 or (i % 5) == 0):
            if(i % 3):
                print "Fiiiiishh"
            if(i % 5):
                print "Buuuuush"
            print "\n"
        else:
            print i

package main

import (
	"fmt"
)

var chans [101]chan string

func buzz(i int) {
	if i%15 == 0 {
		chans[i] <- "FizzBuzz"
	} else if i%3 == 0 {
		chans[i] <- "Fizz"
	} else if i%5 == 0 {
		chans[i] <- "Buzz"
	}
	chans[i] <- fmt.Sprintf("%v", i)
}

func main() {
	for i := range chans {
		chans[i] = make(chan string)
	}

	for i := 1; i <= 100; i++ {
		go buzz(i)
	}

	for i := 1; i <= 100; i++ {
		fmt.Println(<-chans[i])
	}
}

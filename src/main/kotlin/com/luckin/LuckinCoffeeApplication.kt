package com.luckin

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class LuckinCoffeeApplication

fun main(args: Array<String>) {
	runApplication<LuckinCoffeeApplication>(*args)
}

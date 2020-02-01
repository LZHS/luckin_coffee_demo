package com.luckin

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest
class LuckinCoffeeApplicationTests {

	@Test
	fun contextLoads() {
		println("""
			这个是第一行
					第二行
结束！
		""".trimIndent())
	}

}

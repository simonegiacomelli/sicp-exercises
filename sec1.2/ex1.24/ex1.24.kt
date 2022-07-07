#!/usr/bin/env kscript
import java.io.File

fun main() {
    val filename = "ex1.24.output.txt"
    println("reading $filename")

    val lines = File(filename).readLines()
    var exp = 0
    val timings = lines.mapNotNull { line ->
        val startCandidate = line.substringAfter("starting from ")
        if (line.startsWith("Looking for ") && startCandidate.isNotBlank())
            exp = startCandidate.length - 1

        if (startCandidate.isNotBlank() && line.contains("time: ")) {
            val time = line.substringAfter("time: ")
            exp to time.toDouble()
        } else null
    }.groupBy(
        keySelector = { it.first },
        valueTransform = { it.second }
    ).mapValues {
        it.value.average()
    }.toList()

    timings.filter { it.first > 1 }.forEachIndexed { index, pair ->
        print("${pair.first}\t")
//        print("10^" + pair.first + "\t")
        print(pair.second)
        println()
    }


}
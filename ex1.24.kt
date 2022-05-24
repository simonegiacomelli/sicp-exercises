#!/usr/bin/env kscript
import java.io.File

fun main() {
    val filename = "ex1.24.output.txt"
    println("reading $filename")

    val lines = File(filename).readLines()
    var start = ""
    lines.mapNotNull { line ->
        val startCandidate = line.substringAfter("starting from ")
        if (line.startsWith("Looking for ") && startCandidate.isNotBlank())
            start = "10^${startCandidate.length - 1}"

        if (line.contains("time: ")) {
            val time = line.substringAfter("time: ")
            start to time.toDouble()
        } else null
    }.groupBy(
        keySelector = { it.first },
        valueTransform = { it.second }
    ).mapValues {
        print(it.key.padEnd(5,' ') + " ")
        println(it.value.average())
    }
}
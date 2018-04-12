//////////////////////
// Tanner Kvarfordt //
// CS 4700          // 
// Dr. Dyreson      //
//////////////////////

// Do not remove or rename the package
package lists

/*
 * The following functions are helper functions that I am providing
 */


// Extend the List class with a "tail" getter to get the tail of a list.
// Below is an example of how you would use tail
//    val a = listOf(1,2,3)
//    val t = a.tail
//    println("tail of $a is $t") // prints [2,3]
val <T> List<T>.tail: List<T>
get() = drop(1)


// Extend the List class with a "head" getter to get the head of a list.
// Below is an example of how you would use head
//    val a = listOf(1,2,3)
//    val h = a.head
//    println("head of $a is $h") // prints 1
val <T> List<T>.head: T
get() = first()


// The isPrime function takes as input an Int
//      x : an Int object to test
// and returns a Boolean
//      true  if x is a prime
//      false if x is not a prime
fun isPrime(x : Int) : Boolean {
    if (x == 1) return false
    for (i in 2..(x-1)) {
        if (x % i == 0) {
            return false
        }    
    }
    return true
}

// Provides a list of whole numbers from 1 to @n
//
// param n : how many numbers to include in the returned List
// return  : a list of whole numbers from 1 to @n
fun countingNumbers(n : Int?) : List<Int>? {
    if (n == null) return null
    if (n <= 0) return listOf<Int>()
    val list : MutableList<Int>? = mutableListOf<Int>()
    for (i in 1..n) {
        list?.add(i)
    }
    return list
}

// Provides a list of the even numbers in the range 1 to @n
// E.g. evenNumbers(6) returns [2,4,6]
//
// param n : top end of range of even numbers returned
// return  : a list of the even numbers in the range 1 to @n
fun evenNumbers(n : Int?) : List<Int>? {
    if (n == null) return null
    if (n <= 0) return listOf<Int>()
    return countingNumbers(n)?.filter { it % 2 == 0 }
}

// Provides a list of the prime numbers in the range 1 to @n
// E.g. primeNumbers(20) returns [2, 3, 5, 7, 11, 13, 17, 19]
//
// param n : top end of the range of prime numbers returned
// return  : a list of the prime numbers in the range 1 to @n
fun primeNumbers(n : Int?) : List<Int>? {
    if (n == null) return null
    if (n <= 0) return listOf<Int>()
    return countingNumbers(n)?.filter { isPrime(it) }
}

// Merges two already-sorted lists together into one sorted list
// E.g. merge(listOf(1,2,3),listOf(1,7)) returns [1,1,2,3,7]
// Returns null if either list is null
//
// param a : a sorted list
// param b : a sorted list
// return  : @a and @b merged into one sorted list, or null if @a or @b is null
fun<T : Comparable<T>> merge(a : List<T>?, b : List<T>?) : List<T>? {
    if (a == null || b == null) return null
    if (a == null) return b
    if (b == null) return a
    val a1 : MutableList<T> = a.toMutableList()
    val b1 : MutableList<T> = b.toMutableList()
    val result : MutableList<T>? = mutableListOf<T>()
    while (a1.isEmpty() == false && b1.isEmpty() == false) {
        when {
            a1.head <= b1.head -> { result?.add(a1.head) ; a1.removeAt(0) }
            a1.head > b1.head  -> { result?.add(b1.head) ; b1.removeAt(0) }
        }
    }
    result?.addAll(a1)
    result?.addAll(b1)
    return result
}

// Creates a list of sub-lists, whre the n-th sub-list is a list of elements
// from 1 to n in the original list
// 
// Examples:
// countElements(subLists(listOf(1,2,3)))    returns 6
// countElements(listOf(listOf(1,2,3),null)) returns 3
// countElements(null)                       returns 0
//
// param a : a list
// return  : a list of sub-lists, where the n-th sub-list is a list of elements
//           from 1 to n in the original list
fun<T> subLists(a : List<T>?) : List<List<T>>? {
    if (a == null) return null
    if (a.isEmpty()) return listOf<List<T>>()
    val result : MutableList<List<T>> = mutableListOf<List<T>>()
    for (i in 1..a.size) {
        result.addAll(listOf(a.subList(0, i)))
    }
    return result
}

// The compose function takes as input
//     f - A function that takes as input a value of type T and returns a value of type T
//     g - A function that takes as input a value of type T and returns a value of type T
//  and returns as output the composition of the functions
//     f(g(x))
fun<T> compose(f: (T)->T,  g:(T) -> T) : (T) -> T = { f(g(it)) }


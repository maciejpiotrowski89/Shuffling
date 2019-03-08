# Shuffling

Contains `Shuffler` which uses [Fisher-Yates](https://en.wikipedia.org/wiki/Fisher–Yates_shuffle) algorithm to shuffle a collection.


## Usage

```swift
let shuffler = Shuffler()
let collection = [1, 2, 3, 4, 5]
let shuffled = shuffler.shuffle(collection)
```

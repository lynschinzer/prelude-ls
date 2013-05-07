{id, is-type, replicate} = require '../lib/Prelude.js'
require! assert
{equal: eq, deep-equal: deep-eq, ok} = assert

suite 'id' ->
  test 'number' ->
    eq 5, id 5

  test 'object is the same' ->
    obj = {}
    eq obj, id obj

suite 'is-type' ->
  test 'literals' ->
    ok is-type 'Undefined' void
    ok is-type 'Boolean' true
    ok is-type 'Number' 1
    ok is-type 'Number' 1.2
    ok is-type 'String' 'asdfa'
    ok is-type 'Object' {}
    ok is-type 'Array' []

    ok not is-type 'Boolean' 1

  test 'constructors' ->
    ok is-type 'Date' new Date

  test 'classes' ->
    class A

    ok is-type 'Object' new A

suite 'replicate' ->
  test 'zero as input' ->
    deep-eq [], replicate 0 0
    deep-eq [], replicate 0 'a'

  test 'number as input' ->
    deep-eq [3,3,3,3], replicate 4 3

  test 'string as input' ->
    deep-eq <[ a a a a ]>, replicate 4 'a'


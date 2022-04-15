import options, jsony

func includeHook[T](v: Option[T]): bool =
  v.isSome

type
  Test = object
    a: Option[int]
    b: Option[int]

doAssert Test(a: none(int), b: some(123)).toJson() == """{"b":123}"""

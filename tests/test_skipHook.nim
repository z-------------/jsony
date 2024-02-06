import jsony
import std/options

type
  Conn = object
    id: int
  Foo = object
    a: int
    password: string
    b: float
    conn: Conn
    c, d: Option[string]

proc skipHook(T: typedesc[Foo], key: static string): bool =
  key in ["password", "conn"]

proc skipHook[V, E](_: typedesc[V], _: static string, value: Option[E]): bool =
  value.isNone

let v = Foo(a:1, password: "12345", b:0.6, conn: Conn(id: 1), d: some("hello"))
doAssert v.toJson() ==
  """{"a":1,"b":0.6,"d":"hello"}"""

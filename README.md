# EventDispatch

A small library to dispatch and handle events

## Install

1) clone the repo: `git clone https://github.com/0x454d505459/eventdispatch.git`
2) install using nimble: `cd eventdispatch && nimble install .`
3) Your done!

## Usage

```nim
import eventdispatch

proc myCallBack():
    echo "Hello world!"

# create an event handler
let handler = EventHandler()
# listen for an event
handler.on("EventName", myCallBack)

# dispatch an event
handler.dispatchEvent("EventName")
```
With multiple callbacks
```nim
import eventdispatch

let handler = EventHandler()

proc myCallBack() =
    echo "Hello world 1"

proc myCallBack2() =
    echo "Hello world 2"

handler.on("hello event", myCallBack)
handler.on("hello event", myCallBack2)

handler.dispatchEvent("hello event")
```
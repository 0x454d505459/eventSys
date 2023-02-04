type 
    EventHandler* = ref object of RootObj
        calls:seq[proc ()]
        names:seq[string]


proc on*(handler:EventHandler, name:string, procedure: proc ()) =
    handler.calls.add(procedure)
    handler.names.add(name)


proc dispatchEvent*(handler:EventHandler,name:string) =
    let eventIndex = handler.names.find(name)
    if eventIndex == -1:
        raise newException(ValueError, "No such event:" & name)

    handler.calls[eventIndex]()

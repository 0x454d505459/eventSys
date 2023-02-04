type 
    EventHandler* = ref object of RootObj
        calls:seq[seq[proc ()]]
        names:seq[string]


proc on*(handler:EventHandler, name:string, procedure: proc ()) =
    let eventIndex = handler.names.find(name)
    if eventIndex == -1:
        handler.calls.add(@[procedure])
        handler.names.add(name)
    else:
        handler.calls[eventIndex].add(procedure)


proc dispatchEvent*(handler:EventHandler,name:string) =
    let eventIndex = handler.names.find(name)
    if eventIndex == -1:
        raise newException(ValueError, "No such event:" & name)

    for call in handler.calls[eventIndex]:
        call()

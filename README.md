# ti-quicknode

A jQuery-like XML Node wrapper for traversing XML documents in Titanium Mobile

## Usage

    $("tagname", xml)

Returns an array of enhanced XML Nodes with **tagname** from the Ti XML Document **xml**.

## Examples

    $els = $("tagname", xml)
    $el = $els[0]
    
    elementId = $el.attr("id")
    
    $linkEls = $el.parent().next().find("link")
    
    textOfFirstChildOfFirstChild = $el.children()[1].first().txt()
    
    $videos = $els.filter("type=video")
    
    $elMatchingFn = $els.find((node) -> node.children().length > 2) 


MIT Licensed.

Copyright 2013 Double Rebel.
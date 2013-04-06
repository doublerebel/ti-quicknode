# Quicknode
# A jQuery-like XML Node wrapper for traversing XML documents in Titanium Mobile
# 2013 doublerebel


qNode = (el) ->
	superpowers =
		attr: (attr) -> @getAttribute attr
		children: -> new qNodeList @childNodes
		find: (filter) -> @children().filter filter
		txt: -> @firstChild.textContent
		first: -> qNode @firstChild
		last: -> qNode @lastChild
		next: -> qNode @nextSibling
		prev: -> qNode @previousSibling
		parent: -> qNode @parentNode

	el[k] = v for k, v of superpowers
	el

	
class qNodeList
	constructor: (nodeList) ->
		@length = nodeList.length
		i = 0
		
		@[i] = qNode nodeList.item i++ while i < nodeList.length

	filter: (filter) ->
		if typeof filter is "string"
			if filter.indexOf "=" is -1
				node for node in @ when node.tagName is filter
			else
				[key, value] = filter.split "="
				node for node in @ when node.getAttribute key is value
		else
			node for node in @ when filter node

	find: (filter) ->
		els = @filter filter
		qNode els[0] if els.length


$ = (tag, xml) ->
	nodeList = xml.getElementsByTagName tag
	new qNodeList nodeList


module.exports = 
	qNode:     qNode
	qNodeList: qNodeList
	$:         $
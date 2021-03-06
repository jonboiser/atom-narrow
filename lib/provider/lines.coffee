Base = require './base'
{Point} = require 'atom'

module.exports =
class Lines extends Base
  initialize: ->
    @subscribe @editor.onDidStopChanging(@refresh)

  refresh: =>
    @items = null
    @ui.refresh()

  getItems: ->
    @items ?= ({point: new Point(i, 0), text} for text, i in @editor.getBuffer().getLines())

  viewForItem: ({text, point}) ->
    @getTextForRow(point.row) + ":" + text

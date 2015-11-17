# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#
#$(document).ready ->
#  $("#calendar").data(@array)
#  $("#calendar").fullCalendar(
##    events: "/events.json"
#    events: {
#      url: '/events',   data:{action:'get'}}
#    lang: 'ru'
#    timeFormat: 'H(:mm)'
#    timezone: 'Europe/Moscow'
#    header: {
#      left: 'prev, next, today',
#      center: 'title',
#      right: 'month, agendaDay, agendaWeek'
#    }
#    editable: true,
#    eventResizeStop: true

#
#  );


curSource = new Array
#first source uses querystring to determine what events to pull back
curSource[0] = '/office'
#curSource[1] = '/events?sort=my_jobs'
#+ $('#e1').is(':checked') + '&e2=' + $('#e2').is(':checked')
#second source just returns all events
#curSource[1] = '/events'
newSource = new Array
#we'll use this later
$(document).ready ->
  $('#branch').change ->
    #get current status of our filters into newSource
    newSource[0] = '/park_equipments/office?sort=my_departments'
#    + $('#e1').is(':checked') + '&e2=' + $('#e2').is(':checked')
#    newSource[1] = if $('#e3').is(':checked') then '/events' else ''
    #remove the old eventSources
    $('#eventFilterCalendar').fullCalendar 'removeEventSource', curSource[0]
#    $('#eventFilterCalendar').fullCalendar 'removeEventSource', curSource[1]
    $('#eventFilterCalendar').fullCalendar 'refetchEvents'
    #attach the new eventSources
    $('#eventFilterCalendar').fullCalendar 'addEventSource', newSource[0]
#    $('#eventFilterCalendar').fullCalendar 'addEventSource', newSource[1]
    $('#eventFilterCalendar').fullCalendar 'refetchEvents'
    curSource[0] = newSource[0]
#    curSource[1] = newSource[1]
    return
  return





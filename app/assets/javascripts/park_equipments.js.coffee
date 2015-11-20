jQuery ->
  departments = $('#office_department_id').html()
  console.log(departments)
#  $('#office_branch_id').change ->
#    branch = $('#office_branch_id :selected').text()
#    options = $(departments).filter("optgroup[label='#{branch}']").html()
#    if options
#      $('#office_department_id').html(options)
#    else
#      $('#office_department_id').empty()

paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

jQuery ->
  $("a[data-background-color]").click (e) ->
    e.preventDefault()

    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    paintIt(this, backgroundColor, textColor)



$(document).ready ->
  $("#new_article").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"
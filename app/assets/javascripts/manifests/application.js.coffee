
#== require jquery
#== require jquery_ujs
#== require underscore
#== require backbone
#== require handlebars
#== require thorax
# ------------------------
# Sochi
# ------------------------
#
#= require_tree ./../../templates
#
#= require_tree ./../sochi/lib
#
#= require_tree ./../sochi/config
#
#= require_self
#
#= require ./../sochi/model
#= require ./../sochi/collection
#= require_tree ./../sochi/models
#= require_tree ./../sochi/collections
#
#= require ./../sochi/view
#= require_tree ./../sochi/helpers
#= require_tree ./../sochi/views


$ ->

  Backbone.history.start({
    pushState: false,
    root: '/',
    silent: true
  })
  
  # preloaded stuff should go here
  
  Thorax.setRootObject(new Sochi.Views.Application(el: document.getElementById('application')))
  
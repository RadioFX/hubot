module.exports = (robot) ->
  # must be included in the configuration
  POWER_USERS = process.env.HUBOT_RBAC_POWER_USERS.split(',')
  
  robot.listenerMiddleware (context, next, done) ->
    if context.listener.options.id in POWER_USERS
      return next()

    context.response.reply "I'm sorry, @#{context.response.message.user.name}, but you don't have access to do that."
    done()

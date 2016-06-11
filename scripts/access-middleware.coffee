module.exports = (robot) ->
  # must be included in the configuration
  POWER_USERS = process.env.HUBOT_RBAC_POWER_USERS.split(',')

  robot.listenerMiddleware (context, next, done) ->
    robot.logger.debug "processing", context.response.envelope.user

    if String(context.response.envelope.user.id) in POWER_USERS
      return next()

    context.response.reply "I'm sorry, @#{context.response.message.user.name}, but you don't have access to do that."
    done()

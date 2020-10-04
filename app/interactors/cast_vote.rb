class CastVote
  include Interactor

  def call
    vote = Vote.new
    vote.user     = context.user
    vote.planning = context.planning
    vote.rating   = context.rating
    vote.save!
  rescue ActiveRecord::RecordInvalid => e
    context.error = e.record.errors.full_messages.join('. ')
    context.fail!
  end
end

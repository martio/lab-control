class GenerateReport
  include Interactor

  def call
    context.report = {
      'rating' => 0,
      'votes'  => {
        '1' => [],
        '2' => [],
        '3' => [],
        '5' => [],
        '8' => []
      }
    }

    votes = []

    context.planning.votes.includes(:user).each do |vote|
      votes << vote.rating

      if not context.report['votes']["#{vote.rating}"].nil?
        context.report['votes']["#{vote.rating}"] << vote.user.try(:name)
      end
    end

    unless votes.size.zero?
      context.report['rating'] = (votes.inject { |sum, el| sum + el }.to_f / votes.size).round(0)
    end
  end
end

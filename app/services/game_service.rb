class GameService
  MAP = %Q{
    function() {
      emit(this.game_id, { amount: 1});
    }
  }

  REDUCE = %Q{
    function(key, values) {
      var result = { amount: 0 };
      values.forEach(function(value) {
        result.amount += 1;
      });
      return result;
    }
  }

  class << self
    def top
      sorted_output = Subscription.map_reduce(MAP, REDUCE).out(inline: true).map {|document| document}.sort_by do |i|
        -i['value']['amount']
      end

      sorted_output.map do |hash|
        {game: hash['_id'], amount: hash['value']['amount']}
      end
    end
  end
end

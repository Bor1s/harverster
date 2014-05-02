class EventService
  MAP = %Q{
    function() {
      emit(this.beginning_at.getUTCDate() + "/" + (this.beginning_at.getUTCMonth() + 1), { amount: 1});
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
    def daily_events_amount
      output = Event.map_reduce(MAP, REDUCE).out(inline: true).map {|document| document}.sort_by do |i|
        -i['value']['amount']
      end

      result = {}

      output.each do |hash|
        result[hash['_id']] = hash['value']['amount']
      end

      result
    end
  end
end

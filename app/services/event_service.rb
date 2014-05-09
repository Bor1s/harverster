class EventService
  MAP = %Q{
    function() {
      emit(this.beginning_at.getUTCDate() + "/" + (this.beginning_at.getUTCMonth() + 1), this._id);
    }
  }

  REDUCE = %Q{
    function(key, values) {
      var result = { events: [] };
      values.forEach(function(value) {
        result.events.push(value);
      });
      return result;
    }
  }

  class << self
    def daily_events_amount
      output = Event.map_reduce(MAP, REDUCE).out(inline: true).map {|document| document}

      result = {}

      output.each do |hash|
        if hash['value'].is_a?(Hash)
          result[hash['_id']] = hash['value']['events']
        else
          result[hash['_id']] = [hash['value']]
        end
      end

      result
    end
  end
end

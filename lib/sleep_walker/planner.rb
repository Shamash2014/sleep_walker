require 'fugit'
require 'chronic'

module SleepWalker
  class Planner
    ''"
     Ruby class helpfull  of generating property time slots from crontab
    "''

    def self.call(crontab:, days:)
      new(crontab).schedule_for(days)
    end

    def self.run(crontab:, days:)
      call(crontab: crontab, days: days).to_h
    end

    def filter_by(window: [])
      date_ranges = window.map { |xs| Range.new(xs.start_datetime, xs.end_datetime) }
      @schedule = @schedule.reject { |xs| date_ranges.any? { |ys| ys.include?(xs) } }
      self
    end

    def to_h
      @schedule.force.group_by { |xs| DateTime.strptime(xs.to_s, '%s').to_date.to_s }
    end

    def schedule_for(amount)
      @schedule = time_range(amount)
                  .flat_map { |xs| DateTime.parse(xs.to_s).to_time.to_i }

      self
    end

    def time_range(amount)
      next_day = Chronic.parse("#{amount} days from now").to_date
      ethernal_schedule.lazy.take_while do |next_time|
        Date.parse(next_time.to_s).to_date < next_day
      end
    end

    def ethernal_schedule
      Enumerator.new do |en|
        prev = @cron.next_time
        en.yield prev
        loop do
          prev = @cron.next_time(prev)
          en.yield prev
        end
      end
    end

    private

    def initialize(crontab)
      @cron = Fugit::Cron.parse(crontab)
      @schedule = []
    end
  end
end

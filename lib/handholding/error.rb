require 'delegate'
module Handholding
  class Error < SimpleDelegator

    def type
      exception.class
    end

    def line_number
      relevant_line[/:(\d+):/, 1].to_i
    end

    def file_name
      relevant_line[/\A([^:]+):/, 1]
    end

    def location
      relevant_line[/in\ `([^']+)'\z/, 1]
    end

    private

    def relevant_line
      backtrace.first
    end

  end
end

module Dapper
  class Base

    def helpers
      self.class.helpers
    end
    alias :h :helpers

    class << self
      def helpers
        Dapper::ViewContext.current
      end
      alias :h :helpers
    end

  end
end

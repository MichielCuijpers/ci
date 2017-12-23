module FastlaneCI
  class WorkerBase
    def initialize
      Thread.new do
        loop do
          sleep(self.timeout)
          begin
            self.work
          rescue => ex
            puts "[#{self.class} Exception]: #{ex}: "
            puts caller.join("\n")
          end
        end
      end
    end

    def work
      not_implemented(__method__)
    end

    # Timeout in seconds
    def timeout
      not_implemented(__method__)
    end
  end
end